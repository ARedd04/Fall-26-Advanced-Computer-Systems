// pitfall.cpp - benchmark pitfalls, each shown next to the correct measurement
//
// Usage:
//   pitfall.exe reuse [R]            > data/raw/pitfall_reuse.csv
//   pitfall.exe pin   [R] [threads]  > data/raw/pitfall_pin.csv
//   pitfall.exe freq                 > data/raw/pitfall_freq.csv
//   pitfall.exe addr  [R]            > data/raw/pitfall_addr.csv
//
// reuse: "DRAM" numbers that are really cache numbers.
//          bandwidth: re-reading a 4 MB buffer (L3-resident) vs one pass over 1 GB
//          latency  : a SEQUENTIAL 1 GB chain (prefetchers predict it) vs a random one,
//                     and a random 4 MB chain (fits in L3) mislabelled as DRAM
// pin  : multi-thread read bandwidth with different thread placement:
//          one_cpu   every thread on logical CPU 2 (what the original dram.cpp did with
//                    SetProcessAffinityMask: its threads all time-shared one core)
//          os        no pinning, Windows decides
//          smt_pairs two threads per physical core (SMT siblings)
//          spread    one thread per physical core (the setting used elsewhere)
// freq : sleeps 3 s so the core can drop its clock, then measures the clock in ~1 ms
//        slices plus an L1 pointer chase in ns. If the clock ramps, latencies in ns taken
//        without a warm-up are inflated; latencies in cycles are not. (On a "High
//        performance" power plan there may be no ramp; that is a valid result too.)
// addr : chase with the ADDRESS of the next node (p = *p) vs its INDEX (i = a[i], the
//        original chase.cpp idx mode). The index form needs a scaled-index address,
//        which on Zen costs an extra cycle per load, so L1 "latency" reads 5 instead of
//        4 cycles. Same data, different answer.
#include "common.h"

using namespace std;
using namespace bench;

double read_gbps(const Buffer& buf, size_t passes, size_t& sink) {
    size_t lines = buf.size() / LINE;
    read_lines(buf.words(), lines);                           // warm-up
    uint64_t s = 0;
    auto t0 = Clock::now();
    for (size_t p = 0; p < passes; p++) { s += read_lines(buf.words(), lines); keep(s); }
    double sec = seconds_between(t0, Clock::now());
    sink ^= s;
    return buf.size() * (double)passes / sec / 1e9;
}

int run_reuse(int R, size_t& sink) {
    cout << "run,test,config,value,unit\n";
    Buffer small(4u << 20, false), big(1u << 30, false);
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        cout << run << ",bandwidth,naive_4MB_reused," << read_gbps(small, 256, sink) << ",GB/s" << endl;
        cout << run << ",bandwidth,correct_1GB_single_pass," << read_gbps(big, 1, sink) << ",GB/s" << endl;

        size_t nb = big.size() / LINE, ns = small.size() / LINE;
        void* seq = link_chain(big.data(), strided_offsets(nb, LINE, false, seed));
        cout << run << ",latency,naive_sequential_chain_1GB,"
             << measure_chase(seq, nb, 5'000'000, 5, sink).mean << ",ns" << endl;
        void* rnd = link_chain(big.data(), strided_offsets(nb, LINE, true, seed));
        cout << run << ",latency,correct_random_chain_1GB,"
             << measure_chase(rnd, nb, 5'000'000, 5, sink).mean << ",ns" << endl;
        void* sm = link_chain(small.data(), strided_offsets(ns, LINE, true, seed));
        cout << run << ",latency,naive_random_chain_4MB," << measure_chase(sm, ns, 5'000'000, 5, sink).mean
             << ",ns" << endl;
    }
    return 0;
}

int run_pin(int R, int T, size_t& sink) {
    const size_t bytes = 1u << 30, lines = bytes / LINE;
    Buffer buf(bytes, false);
    vector<pair<string, vector<DWORD_PTR>>> configs;
    configs.push_back({"one_cpu", vector<DWORD_PTR>(T, cpu_mask(MAIN_CPU))});
    configs.push_back({"os", vector<DWORD_PTR>(T, 0)});
    vector<DWORD_PTR> pairs(T);
    for (int t = 0; t < T; t++) pairs[t] = cpu_mask(worker_cpu(t / 2) + t % 2);
    configs.push_back({"smt_pairs", pairs});
    configs.push_back({"spread", default_masks(T)});

    cout << "run,threads,config,GBps,sd_GBps,min_GBps,max_GBps\n";
    for (int run = 1; run <= R; run++) {
        for (auto& [name, masks] : configs) {
            vector<uint64_t> sinks(T * 8);
            auto secs = run_pinned(masks, 1 + 7, [&](int t, int) {
                size_t a = lines * t / T, b = lines * (t + 1) / T;
                sinks[t * 8] += read_lines(buf.words() + a * 8, b - a);
            });
            secs.erase(secs.begin());
            vector<double> g;
            for (double x : secs) g.push_back(bytes / x / 1e9);
            Stats s = stats(g);
            cout << run << "," << T << "," << name << "," << s.mean << "," << s.sd << "," << s.min << ","
                 << *max_element(g.begin(), g.end()) << endl;
            for (auto v : sinks) sink ^= v;
        }
    }
    return 0;
}

int run_freq(size_t& sink) {
    const size_t nodes = (16u << 10) / LINE;                  // 16 KB: L1
    Buffer buf(16u << 10, false);
    void* p = link_chain(buf.data(), strided_offsets(nodes, LINE, true, BASE_SEED));
    cerr << "idling 3 s...\n";
    Sleep(3000);
    cout << "t_ms,ghz,l1_chase_ns,l1_chase_cycles\n";
    auto t0 = Clock::now();
    for (int i = 0; i < 600; i++) {
        double t = seconds_between(t0, Clock::now()) * 1e3;
        double ghz = ghz_once(50'000, sink);                  // 400K adds, ~0.1 ms at 4 GHz
        double ns = chase_ns(p, 200'000);                     // ~0.2 ms
        cout << t << "," << ghz << "," << ns << "," << ns * ghz << "\n";
    }
    sink ^= (size_t)(uintptr_t)p;
    return 0;
}

int run_addr(int R, size_t& sink) {
    const size_t sizes_kb[] = {16, 256, 4096, 1048576};
    cout << "run,size_KB,mode,mean_ns,ghz,cycles\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        for (size_t kb : sizes_kb) {
            size_t bytes = kb * 1024, nodes = bytes / LINE;
            Buffer buf(bytes, false);
            vector<size_t> off = strided_offsets(nodes, LINE, true, seed);

            void* start = link_chain(buf.data(), off);
            double ptr = measure_chase(start, nodes, hops_for(bytes), 7, sink).mean;

            // Same visit order, but each node stores the word index of the next node
            size_t* a = (size_t*)buf.data();
            for (size_t i = 0; i < nodes; i++) a[off[i] / 8] = off[(i + 1) % nodes] / 8;
            size_t idx = off[0] / 8, hops = hops_for(bytes);
            for (size_t h = 0; h < min(2 * nodes, hops); h++) idx = a[idx];
            vector<double> v;
            for (int t = 0; t < 7; t++) {
                auto t0 = Clock::now();
                for (size_t h = 0; h < hops; h++) idx = a[idx];
                v.push_back(seconds_between(t0, Clock::now()) * 1e9 / hops);
            }
            sink ^= idx;
            double ix = stats(v).mean;
            cout << run << "," << kb << ",ptr," << ptr << "," << ghz << "," << ptr * ghz << endl;
            cout << run << "," << kb << ",idx," << ix << "," << ghz << "," << ix * ghz << endl;
        }
    }
    return 0;
}

int main(int argc, char** argv) {
    setup_process();
    if (argc < 2) { cerr << "usage: pitfall (reuse [R] | pin [R] [threads] | freq | addr [R])\n"; return 1; }
    int R = argc >= 3 ? max(1, atoi(argv[2])) : 3;
    int T = argc >= 4 ? clamp(atoi(argv[3]), 1, 2 * MAX_WORKERS) : 8;
    size_t sink = 0;
    int rc;
    if (!strcmp(argv[1], "reuse"))     rc = run_reuse(R, sink);
    else if (!strcmp(argv[1], "pin"))  rc = run_pin(R, T, sink);
    else if (!strcmp(argv[1], "freq")) rc = run_freq(sink);
    else if (!strcmp(argv[1], "addr")) rc = run_addr(R, sink);
    else { cerr << "unknown mode\n"; return 1; }
    cerr << "sink (ignore): " << sink << "\n";
    return rc;
}
