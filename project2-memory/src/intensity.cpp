// intensity.cpp - throughput vs latency as access intensity grows (the "knee")
//
// Usage:
//   intensity.exe mlp    [R] [MB] [page]  > data/raw/intensity_mlp.csv   (MB default 1024, min 64)
//                                         page: 4k, 2m, or auto (2m when allowed; default)
//   intensity.exe loaded [R] [threads]    > data/raw/intensity_loaded.csv
//
// mlp    : ONE thread chases K independent random chains in a 1 GB buffer, interleaved
//          (p1 = *p1; p2 = *p2; ... pK = *pK). The K loads of a round do not depend on
//          each other, so up to K misses are in flight. Concurrency is set exactly, so
//          Little's Law reads directly:  K = throughput(lines/ns) x latency(ns).
//          Latency stays flat while the core / memory can overlap the misses; past the
//          limit (miss buffers, DRAM bandwidth) throughput flattens and latency grows.
//          On 4 KB pages every hop is also a TLB miss, and the few page walkers can
//          become the limit before DRAM does. Running the same size with 4k and 2m
//          pages separates the two limits (see 'page' column); a smaller MB (e.g. 64)
//          also shortens the walks on 4 KB.
// loaded : Intel-MLC-style loaded latency. The main thread chases a 256 MB random chain
//          (latency probe) while T worker cores stream reads over a 1 GB buffer with an
//          injected delay of D spin iterations after each line. Sweeping D from large to
//          0 (then T up to the max) raises the load; plot probe latency vs total GB/s.
#include "common.h"

using namespace std;
using namespace bench;

// One round = one hop on each of K chains. Returns ns per round.
template <int K>
double chase_k(void** heads, size_t rounds) {
    void* q[K];
    for (int k = 0; k < K; k++) q[k] = heads[k];
    auto start = Clock::now();
    for (size_t r = 0; r < rounds; r++) {
#pragma GCC unroll 32
        for (int k = 0; k < K; k++) q[k] = *(void**)q[k];
    }
    auto end = Clock::now();
    for (int k = 0; k < K; k++) heads[k] = q[k];
    return std::chrono::duration<double, std::nano>(end - start).count() / rounds;
}

using ChaseFn = double (*)(void**, size_t);
struct KEntry { int k; ChaseFn fn; };
const KEntry K_LIST[] = {
    {1, chase_k<1>},   {2, chase_k<2>},   {3, chase_k<3>},   {4, chase_k<4>},
    {6, chase_k<6>},   {8, chase_k<8>},   {10, chase_k<10>}, {12, chase_k<12>},
    {16, chase_k<16>}, {20, chase_k<20>}, {24, chase_k<24>}, {32, chase_k<32>},
};

int run_mlp(int R, size_t mb, const char* page, size_t& sink) {
    const size_t bytes = mb << 20, nodes = bytes / LINE;
    Buffer buf;
    if (!strcmp(page, "4k"))      buf = Buffer(bytes, false);
    else if (!strcmp(page, "2m")) buf = enable_large_pages() ? Buffer(bytes, true) : Buffer();
    else                          buf = chase_buffer(bytes);
    if (!buf) { cerr << "could not allocate " << mb << " MB with page setting '" << page << "'\n"; return 1; }
    cerr << "mlp: " << mb << " MB on " << page_name(buf) << " pages\n";
    cout << "run,seed,chains,latency_ns,latency_sd,GBps,lines_per_ns,littles_L,ghz,latency_cycles,size_MB,page\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "mlp run " << run << ": clock " << ghz << " GHz\n";
        vector<size_t> off = strided_offsets(nodes, LINE, true, seed);
        for (const KEntry& e : K_LIST) {
            // Split the shuffled node list into K pieces; each piece is its own cycle
            vector<void*> heads(e.k);
            for (int k = 0; k < e.k; k++) {
                size_t a = nodes * k / e.k, b = nodes * (k + 1) / e.k;
                heads[k] = link_chain(buf.data(), off, a, b - a);
            }
            if (!is_single_cycle(heads[0], nodes / e.k)) { cerr << "bad chain\n"; return 1; }
            const size_t rounds = 2'000'000;
            e.fn(heads.data(), rounds / 4);                    // warm-up
            vector<double> v;
            for (int t = 0; t < 5; t++) v.push_back(e.fn(heads.data(), rounds));
            for (void* h : heads) sink ^= (size_t)(uintptr_t)h;
            Stats s = stats(v);
            double lines_per_ns = e.k / s.mean;
            cout << run << "," << seed << "," << e.k << "," << s.mean << "," << s.sd << ","
                 << lines_per_ns * LINE << "," << lines_per_ns << "," << lines_per_ns * s.mean << ","
                 << ghz << "," << s.mean * ghz << "," << mb << "," << page_name(buf) << endl;
        }
    }
    return 0;
}

int run_loaded(int R, int Tmax, size_t& sink) {
    const size_t bytes = 1u << 30, total_lines = bytes / LINE;
    Buffer traffic(bytes, false);
    const size_t probe_bytes = 256u << 20, probe_nodes = probe_bytes / LINE;
    Buffer probe = chase_buffer(probe_bytes);
    cerr << "probe: 256 MB on " << page_name(probe) << " pages\n";

    // (threads, delay) points from light to heavy load
    vector<pair<int, int>> points;
    for (int d : {20000, 10000, 5000, 2000, 1000, 500, 300, 200, 100, 50, 20, 0}) points.push_back({Tmax, d});
    for (int t = 1; t < Tmax; t++) points.push_back({t, 0});

    cout << "run,seed,threads,delay,bg_GBps,probe_ns,probe_sd,probe_cycles,total_GBps,littles_L,ghz,probe_page\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "loaded run " << run << ": clock " << ghz << " GHz\n";
        void* start = link_chain(probe.data(), strided_offsets(probe_nodes, LINE, true, seed));
        if (!is_single_cycle(start, probe_nodes)) { cerr << "bad chain\n"; return 1; }

        Stats idle = measure_chase(start, probe_nodes, 2'000'000, 5, sink);
        double idle_gbps = LINE / idle.mean;
        cout << run << "," << seed << ",0,0,0," << idle.mean << "," << idle.sd << "," << idle.mean * ghz
             << "," << idle_gbps << "," << idle_gbps * idle.mean / LINE << "," << ghz << "," << page_name(probe) << endl;

        for (auto [T, delay] : points) {
            vector<uint64_t> sinks(T * 8);
            Background bg(default_masks(T), [&, T, delay](int t, atomic<bool>& stop) -> uint64_t {
                size_t first = total_lines * t / T, count = total_lines * (t + 1) / T - first;
                const uint64_t* p = traffic.words() + first * 8;
                uint64_t lines = 0, s = 0;
                for (size_t i = 0; !stop.load(memory_order_relaxed); i++) {
                    if (i == count) i = 0;
                    s += read_lines(p + 8 * i, 1);
                    for (int d = 0; d < delay; d++) asm volatile("");
                    lines++;
                }
                sinks[t * 8] = s;
                return lines;
            });
            bg.start();
            Sleep(50);
            Stats p = measure_chase(start, probe_nodes, 2'000'000, 5, sink);
            double bg_gbps = bg.finish();
            for (auto v : sinks) sink ^= v;
            // Little's Law: lines in flight = arrival rate (lines/ns) x time in system (ns).
            // The probe's latency is used as the time in system for all traffic.
            double total = bg_gbps + LINE / p.mean;
            cout << run << "," << seed << "," << T << "," << delay << "," << bg_gbps << "," << p.mean << ","
                 << p.sd << "," << p.mean * ghz << "," << total << "," << total * p.mean / LINE << ","
                 << ghz << "," << page_name(probe) << endl;
        }
    }
    return 0;
}

int main(int argc, char** argv) {
    setup_process();
    if (argc < 2) { cerr << "usage: intensity (mlp [R] [MB] [4k|2m|auto] | loaded [R] [threads])\n"; return 1; }
    int R = argc >= 3 ? max(1, atoi(argv[2])) : 3;
    int T = argc >= 4 ? clamp(atoi(argv[3]), 1, MAX_WORKERS) : 10;
    size_t mb = argc >= 4 ? max(64, atoi(argv[3])) : 1024;
    size_t sink = 0;
    int rc;
    const char* page = argc >= 5 ? argv[4] : "auto";
    if (!strcmp(argv[1], "mlp"))         rc = run_mlp(R, mb, page, sink);
    else if (!strcmp(argv[1], "loaded")) rc = run_loaded(R, T, sink);
    else { cerr << "unknown mode\n"; return 1; }
    cerr << "sink (ignore): " << sink << "\n";
    return rc;
}
