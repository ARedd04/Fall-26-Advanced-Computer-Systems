// rwmix.cpp - read/write mix sweep: throughput AND latency for 100R, 70/30, 50/50, 100W
//
// Usage:  rwmix.exe [R] [threads_list]  > data/raw/rwmix.csv      e.g. rwmix.exe 3 1,2,4,8
//
// Throughput: T pinned threads (one physical core each) sweep their slice of a 1 GB
//   buffer with the mix kernel (groups of 10 lines: 7 read + 3 written for 70/30).
//   app_GBps counts the bytes the program touched. Ordinary stores are write-allocate:
//   a written line is first READ from DRAM (read-for-ownership) and later written back,
//   so DRAM moves ~2x64 B per written line. est_dram_GBps applies that factor; it is an
//   estimate, not a counter reading.
// Latency: the same mix runs as background traffic on the T worker cores while the main
//   thread (its own core) pointer-chases a separate 256 MB random chain. The probe's
//   ns/hop is the DRAM latency seen under that mix and load. Rows with threads=0 are the
//   unloaded probe.
#include "common.h"

using namespace std;
using namespace bench;

int main(int argc, char** argv) {
    setup_process();
    int R = argc >= 2 ? max(1, atoi(argv[1])) : 3;
    vector<int> tlist = argc >= 3 ? parse_list(argv[2]) : vector<int>{1, 2, 4, 8};

    struct Mix { const char* name; int read_tenths; };
    const Mix mixes[] = {{"100R", 10}, {"70R30W", 7}, {"50R50W", 5}, {"100W", 0}};

    const size_t bytes = 1u << 30, total_lines = bytes / LINE;
    Buffer traffic(bytes, false);
    const size_t probe_bytes = 256u << 20, probe_nodes = probe_bytes / LINE;
    Buffer probe = chase_buffer(probe_bytes);
    cerr << "probe: 256 MB on " << page_name(probe) << " pages\n";
    size_t sink = 0;

    cout << "run,seed,mix,read_pct,threads,app_GBps,app_sd,est_dram_GBps,"
            "probe_ns,probe_sd,probe_cycles,bg_GBps_during_probe,ghz\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "run " << run << ": clock " << ghz << " GHz\n";
        void* start = link_chain(probe.data(), strided_offsets(probe_nodes, LINE, true, seed));
        if (!is_single_cycle(start, probe_nodes)) { cerr << "bad chain\n"; return 1; }

        Stats idle = measure_chase(start, probe_nodes, 2'000'000, 5, sink);
        cout << run << "," << seed << ",idle,100,0,0,0,0," << idle.mean << "," << idle.sd << ","
             << idle.mean * ghz << ",0," << ghz << endl;

        for (const Mix& m : mixes) {
            for (int T : tlist) {
                T = clamp(T, 1, MAX_WORKERS);
                auto masks = default_masks(T);
                // Slices in whole groups of 10 lines
                size_t groups = total_lines / 10;
                auto slice = [&](int t, size_t& first, size_t& count) {
                    size_t a = groups * t / T, b = groups * (t + 1) / T;
                    first = a * 10; count = (b - a) * 10;
                };
                vector<uint64_t> sinks(T * 8);

                // --- throughput: 1 warm-up pass + 5 timed passes
                auto secs = run_pinned(masks, 6, [&](int t, int rep) {
                    size_t first, count;
                    slice(t, first, count);
                    sinks[t * 8] += mix_lines(traffic.words() + first * 8, count, m.read_tenths, seed + rep);
                });
                secs.erase(secs.begin());
                vector<double> gbps;
                for (double x : secs) gbps.push_back(bytes / x / 1e9);
                Stats g = stats(gbps);
                double write_frac = (10 - m.read_tenths) / 10.0;
                double est_dram = g.mean * (1.0 + write_frac);      // + one RFO read per written line

                // --- latency under the same traffic
                Background bg(masks, [&](int t, atomic<bool>& stop) -> uint64_t {
                    size_t first, count;
                    slice(t, first, count);
                    const size_t chunk = 10 * 1024;               // check 'stop' every 640 KB
                    uint64_t lines = 0, s = 0;
                    for (size_t off = 0; !stop.load(memory_order_relaxed); off += chunk) {
                        if (off + chunk > count) off = 0;
                        s += mix_lines(traffic.words() + (first + off) * 8, chunk, m.read_tenths, lines);
                        lines += chunk;
                    }
                    sinks[t * 8] += s;
                    return lines;
                });
                bg.start();
                Sleep(50);                                         // let the traffic reach steady state
                Stats p = measure_chase(start, probe_nodes, 2'000'000, 5, sink);
                double bg_gbps = bg.finish();

                cout << run << "," << seed << "," << m.name << "," << m.read_tenths * 10 << "," << T << ","
                     << g.mean << "," << g.sd << "," << est_dram << "," << p.mean << "," << p.sd << ","
                     << p.mean * ghz << "," << bg_gbps << "," << ghz << endl;
                for (auto v : sinks) sink ^= v;
            }
        }
    }
    cerr << "sink (ignore): " << sink << "\n";
    return 0;
}
