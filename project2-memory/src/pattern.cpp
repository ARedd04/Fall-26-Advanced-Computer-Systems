// pattern.cpp - access pattern (sequential / random) x stride / granularity sweep
//
// Usage:
//   pattern.exe lat  [R]            > data/raw/pattern_lat.csv    latency: pointer chase
//   pattern.exe bw   [R] [threads]  > data/raw/pattern_bw.csv     bandwidth: one 8 B read per stride
//   pattern.exe gran [R] [threads]  > data/raw/pattern_gran.csv   bandwidth: whole blocks of B bytes
//
// lat  : the chase from the original chase.cpp "stride" mode. The size knob is the
//        FOOTPRINT (nodes x 64 B = bytes of lines actually touched), so the cache level
//        stays the same across strides; the array spans nodes x stride bytes.
// bw   : same footprint/stride layout, but independent loads (addresses come from a
//        counter or an index array, not from the previous load), so many misses can be
//        in flight. Each access reads one 8 B word; the whole 64 B line still moves, so
//        both "line" and "useful" GB/s are reported. Random order reads a shuffled
//        uint32 index array (4 B per access, streamed sequentially, prefetch-friendly).
// gran : 1 GB buffer cut into blocks of B bytes; every byte of each block is read, and
//        blocks are visited in address order or in shuffled order. Shows how large a
//        random chunk must be before random access reaches sequential bandwidth.
#include "common.h"

using namespace std;
using namespace bench;

int run_lat(int R, size_t& sink) {
    const size_t footprints_kb[] = {16, 256, 4096, 65536};          // L1, L2, L3, DRAM
    const size_t strides[] = {64, 256, 1024};
    cout << "run,seed,pattern,stride_B,footprint_KB,array_KB,mean_ns,sd_ns,ghz,cycles\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "lat run " << run << ": clock " << ghz << " GHz\n";
        for (size_t fkb : footprints_kb)
            for (bool rnd : {false, true})
                for (size_t s : strides) {
                    size_t nodes = fkb * 1024 / LINE;
                    Buffer buf(nodes * s, false);
                    void* start = link_chain(buf.data(), strided_offsets(nodes, s, rnd, seed));
                    if (!is_single_cycle(start, nodes)) { cerr << "bad chain\n"; return 1; }
                    Stats st = measure_chase(start, nodes, hops_for(fkb * 1024), 10, sink);
                    cout << run << "," << seed << "," << (rnd ? "random" : "sequential") << ","
                         << s << "," << fkb << "," << buf.size() / 1024 << "," << st.mean << ","
                         << st.sd << "," << ghz << "," << st.mean * ghz << endl;
                }
    }
    return 0;
}

int run_bw(int R, int T, size_t& sink) {
    const size_t footprint = 128u << 20;                // 128 MB of lines: 4x the whole L3
    const size_t n = footprint / LINE;                  // accesses per pass
    const size_t strides[] = {64, 256, 1024};
    vector<uint64_t> sinks(T * 8);
    auto masks = default_masks(T);
    cout << "run,seed,threads,pattern,stride_B,footprint_MB,line_GBps,line_sd,useful_GBps,ns_per_access,ghz\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "bw run " << run << ": clock " << ghz << " GHz\n";
        for (size_t s : strides) {
            Buffer buf(n * s, false);
            const uint64_t* base = buf.words();
            const size_t sw = s / 8;                    // stride in words
            vector<uint32_t> idx(n);
            iota(idx.begin(), idx.end(), 0u);
            mt19937_64 rng(seed);
            shuffle(idx.begin(), idx.end(), rng);
            for (bool rnd : {false, true}) {
                auto secs = run_pinned(masks, 1 + 5, [&](int t, int) {
                    size_t a = n * t / T, b = n * (t + 1) / T;
                    uint64_t sum = 0;
                    if (rnd) for (size_t i = a; i < b; i++) sum += base[(size_t)idx[i] * sw];
                    else     for (size_t i = a; i < b; i++) sum += base[i * sw];
                    sinks[t * 8] += sum;
                });
                secs.erase(secs.begin());               // first pass = warm-up
                vector<double> gbps;
                for (double x : secs) gbps.push_back(n * (double)LINE / x / 1e9);
                Stats g = stats(gbps), tsec = stats(secs);
                cout << run << "," << seed << "," << T << "," << (rnd ? "random" : "sequential") << ","
                     << s << "," << (footprint >> 20) << "," << g.mean << "," << g.sd << ","
                     << g.mean / 8.0 << "," << tsec.mean * 1e9 / n << "," << ghz << endl;
            }
        }
    }
    for (auto v : sinks) sink ^= v;
    return 0;
}

int run_gran(int R, int T, size_t& sink) {
    const size_t bytes = 1u << 30;
    const size_t blocks_B[] = {64, 128, 256, 512, 1024, 4096, 16384, 65536};
    Buffer buf(bytes, false);
    vector<uint64_t> sinks(T * 8);
    auto masks = default_masks(T);
    cout << "run,seed,threads,pattern,block_B,GBps,sd_GBps,ns_per_block,ghz\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "gran run " << run << ": clock " << ghz << " GHz\n";
        for (size_t B : blocks_B) {
            size_t nb = bytes / B, lines_per_block = B / LINE;
            vector<uint32_t> order(nb);
            iota(order.begin(), order.end(), 0u);
            for (bool rnd : {false, true}) {
                if (rnd) { mt19937_64 rng(seed); shuffle(order.begin(), order.end(), rng); }
                auto secs = run_pinned(masks, 1 + 3, [&](int t, int) {
                    size_t a = nb * t / T, b = nb * (t + 1) / T;
                    uint64_t sum = 0;
                    for (size_t i = a; i < b; i++)
                        sum += read_lines(buf.words() + (size_t)order[i] * (B / 8), lines_per_block);
                    sinks[t * 8] += sum;
                });
                secs.erase(secs.begin());
                vector<double> gbps;
                for (double x : secs) gbps.push_back(bytes / x / 1e9);
                Stats g = stats(gbps);
                cout << run << "," << seed << "," << T << "," << (rnd ? "random" : "sequential") << ","
                     << B << "," << g.mean << "," << g.sd << "," << stats(secs).mean * 1e9 / nb << ","
                     << ghz << endl;
            }
        }
    }
    for (auto v : sinks) sink ^= v;
    return 0;
}

int main(int argc, char** argv) {
    setup_process();
    if (argc < 2) { cerr << "usage: pattern (lat [R] | bw [R] [threads] | gran [R] [threads])\n"; return 1; }
    int R = argc >= 3 ? max(1, atoi(argv[2])) : 3;
    int T = argc >= 4 ? clamp(atoi(argv[3]), 1, MAX_WORKERS) : 1;
    size_t sink = 0;
    int rc;
    if (!strcmp(argv[1], "lat"))       rc = run_lat(R, sink);
    else if (!strcmp(argv[1], "bw"))   rc = run_bw(R, T, sink);
    else if (!strcmp(argv[1], "gran")) rc = run_gran(R, T, sink);
    else { cerr << "unknown mode\n"; return 1; }
    cerr << "sink (ignore): " << sink << "\n";
    return rc;
}
