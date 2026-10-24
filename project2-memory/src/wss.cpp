// wss.cpp - working-set sweep from L1-resident to DRAM-resident
//
// Usage:
//   wss.exe lat [R]  > data/raw/wss_lat.csv    random pointer chase (latency) per size
//   wss.exe bw  [R]  > data/raw/wss_bw.csv     single-thread sequential read bandwidth per size
//
// Annotate the plots at the cache edges of the TR 2920X: L1d 32 KB, L2 512 KB,
// L3 8 MB per CCX (a core only allocates into its own CCX's L3), 32 MB chip total.
// Extra points sit just below / above each edge. 640/768/896 KB are kept from the
// original sweep to follow the bump seen at 768 KB.
#include "common.h"

using namespace std;
using namespace bench;

const size_t SIZES_KB[] = {
    4, 8, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 640, 768, 896,
    1024, 1536, 2048, 3072, 4096, 5120, 6144, 7168, 8192, 10240, 12288,
    16384, 32768, 65536, 131072, 262144, 524288, 1048576};

int run_lat(int R, size_t& sink) {
    cout << "run,seed,size_KB,mean_ns,sd_ns,ghz,cycles\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "lat run " << run << ": clock " << ghz << " GHz\n";
        for (size_t kb : SIZES_KB) {
            size_t bytes = kb * 1024, nodes = bytes / LINE;
            Buffer buf(bytes, false);
            void* start = link_chain(buf.data(), strided_offsets(nodes, LINE, true, seed));
            if (!is_single_cycle(start, nodes)) { cerr << "bad chain at " << kb << " KB\n"; return 1; }
            Stats s = measure_chase(start, nodes, hops_for(bytes), 10, sink);
            cout << run << "," << seed << "," << kb << "," << s.mean << "," << s.sd << "," << ghz << ","
                 << s.mean * ghz << endl;
        }
        cerr << "lat run " << run << ": clock after run " << calibrate_ghz(sink) << " GHz\n";
    }
    return 0;
}

// Each trial reads ~512 MB in total (many passes over small buffers, one pass over
// big ones), so every trial is long enough to time accurately.
int run_bw(int R, size_t& sink) {
    cout << "run,size_KB,passes,GBps,sd_GBps,bytes_per_cycle,ghz\n";
    for (int run = 1; run <= R; run++) {
        double ghz = calibrate_ghz(sink);
        cerr << "bw run " << run << ": clock " << ghz << " GHz\n";
        for (size_t kb : SIZES_KB) {
            size_t bytes = kb * 1024, lines = bytes / LINE;
            size_t passes = max<size_t>(1, (512u << 20) / bytes);
            Buffer buf(bytes, false);
            read_lines(buf.words(), lines);                   // warm-up pass
            vector<double> gbps;
            for (int t = 0; t < 7; t++) {
                uint64_t s = 0;
                auto t0 = Clock::now();
                for (size_t p = 0; p < passes; p++) { s += read_lines(buf.words(), lines); keep(s); }
                double sec = seconds_between(t0, Clock::now());
                sink ^= s;
                gbps.push_back(bytes * (double)passes / sec / 1e9);
            }
            Stats g = stats(gbps);
            cout << run << "," << kb << "," << passes << "," << g.mean << "," << g.sd << ","
                 << g.mean / ghz << "," << ghz << endl;
        }
    }
    return 0;
}

int main(int argc, char** argv) {
    setup_process();
    if (argc < 2) { cerr << "usage: wss (lat [R] | bw [R])\n"; return 1; }
    int R = argc >= 3 ? max(1, atoi(argv[2])) : 3;
    size_t sink = 0;
    int rc;
    if (!strcmp(argv[1], "lat"))     rc = run_lat(R, sink);
    else if (!strcmp(argv[1], "bw")) rc = run_bw(R, sink);
    else { cerr << "unknown mode\n"; return 1; }
    cerr << "sink (ignore): " << sink << "\n";
    return rc;
}
