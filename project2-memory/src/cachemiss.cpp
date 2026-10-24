// cachemiss.cpp - cache-miss impact on a simple kernel (SAXPY: y[i] = a*x[i] + y[i])
//
// Usage:
//   cachemiss.exe sweep [R]                     > data/raw/cachemiss.csv
//   cachemiss.exe one <footprint_KB> <seq|rand> <seconds> [y_offset]
//
// sweep: footprint (x + y, float) from 16 KB to 1 GB, sequential and random order.
//        Random order goes through a shuffled index array: j = idx[i]; y[j] += a*x[j].
//        Each trial processes ~256M elements (many passes over small footprints).
// one  : runs ONE configuration in a loop for the given time and prints READY once
//        setup is done, so a counter tool (AMDuProfPcm; perf is not available on
//        Windows) can count only the kernel loop on CPU 2. See run_cachemiss_pcm.ps1.
//        y_offset (bytes) forces (y - x) mod 4096 to that value; omit it for the normal
//        heap layout. Used by run_alias_check.ps1 to test whether the bimodal speed of
//        small random runs depends on the relative placement of x and y (4K aliasing).
//
// The model columns give the expected cache lines fetched per element once the data
// no longer fits in a level: sequential = 2 arrays x 4 B / 64 B = 0.125 lines/elem
// (prefetchable), random = 2 lines/elem (x[j] and y[j] in different lines, no reuse).
// Correlate these and the measured miss counters with ns/elem.
#include "common.h"

using namespace std;
using namespace bench;

// Layout of x and y:
//   y_offset < 0 : two separate heap vectors, placed wherever the allocator puts them
//                  (the normal case; their relative position can differ between runs)
//   y_offset >= 0: one page-aligned block; y starts y_offset bytes past the first 4 KB
//                  boundary after x, so (y - x) mod 4096 == y_offset exactly
// xy_offset() reports (y - x) mod 4096. When it is 0, x[j] and y[j] share their low 12
// address bits, which is the condition for 4K aliasing between loads and stores.
struct Saxpy {
    size_t n;
    vector<float> xv, yv;
    Buffer block;
    float* x;
    float* y;
    vector<uint32_t> idx;
    Saxpy(size_t n, unsigned seed, long y_offset = -1) : n(n), idx(n) {
        if (y_offset < 0) {
            xv.resize(n); yv.resize(n);
            x = xv.data(); y = yv.data();
        } else {
            size_t xbytes = (n * sizeof(float) + PAGE_4K - 1) / PAGE_4K * PAGE_4K;
            block = Buffer(2 * xbytes + 2 * PAGE_4K, false);
            x = (float*)block.data();
            y = (float*)(block.data() + xbytes + (y_offset % PAGE_4K));
        }
        for (size_t i = 0; i < n; i++) { x[i] = (float)(i % 97) * 0.01f; y[i] = 1.0f; }
        iota(idx.begin(), idx.end(), 0u);
        mt19937_64 rng(seed);
        shuffle(idx.begin(), idx.end(), rng);
    }
    size_t xy_offset() const { return ((uintptr_t)y - (uintptr_t)x) & (PAGE_4K - 1); }
    void pass(bool rnd, float a) {
        float* __restrict yp = y;
        const float* __restrict xp = x;
        if (rnd) for (size_t i = 0; i < n; i++) { uint32_t j = idx[i]; yp[j] = a * xp[j] + yp[j]; }
        else     for (size_t i = 0; i < n; i++) yp[i] = a * xp[i] + yp[i];
        keep(yp[0]);
    }
};

// Correctness check against a plain reference loop on a small copy, for both layouts
bool validate(unsigned seed) {
    for (long off : {-1L, 0L, 64L}) {
        Saxpy s(4096, seed, off);
        vector<float> ref(s.y, s.y + s.n);
        for (size_t i = 0; i < s.n; i++) ref[i] = 0.5f * s.x[i] + ref[i];
        s.pass(true, 0.5f);                               // random order must give the same result
        for (size_t i = 0; i < s.n; i++) if (s.y[i] != ref[i]) return false;
    }
    return true;
}

int run_sweep(int R, size_t& sink) {
    const size_t sizes_kb[] = {16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384,
                               32768, 65536, 262144, 1048576};
    if (!validate(BASE_SEED)) { cerr << "SAXPY validation failed\n"; return 1; }
    cout << "run,pattern,footprint_KB,n,ns_per_elem,sd_ns,GBps,cycles_per_elem,model_lines_per_elem,ghz,xy_offset_mod4096\n";
    for (int run = 1; run <= R; run++) {
        double ghz = calibrate_ghz(sink);
        cerr << "run " << run << ": clock " << ghz << " GHz\n";
        for (size_t kb : sizes_kb) {
            size_t n = kb * 1024 / (2 * sizeof(float));
            Saxpy s(n, BASE_SEED + run);
            size_t passes = max<size_t>(1, (256u << 20) / n);
            for (bool rnd : {false, true}) {
                s.pass(rnd, 1.0001f);                         // warm-up
                vector<double> v;
                for (int t = 0; t < 5; t++) {
                    auto t0 = Clock::now();
                    for (size_t p = 0; p < passes; p++) s.pass(rnd, 1.0001f);
                    v.push_back(seconds_between(t0, Clock::now()) * 1e9 / (passes * (double)n));
                }
                Stats st = stats(v);
                // Bytes per element: read x, read y, write y (12 B); + 4 B index if random
                double bpe = rnd ? 16.0 : 12.0;
                cout << run << "," << (rnd ? "random" : "sequential") << "," << kb << "," << n << ","
                     << st.mean << "," << st.sd << "," << bpe / st.mean << "," << st.mean * ghz << ","
                     << (rnd ? 2.0 : 0.125) << "," << ghz << "," << s.xy_offset() << endl;
            }
            sink ^= (size_t)s.y[n / 2];
        }
    }
    return 0;
}

// Prints READY after setup, then one line "RESULT,key,value,key,value,..."
int run_one(size_t kb, bool rnd, double seconds, long y_offset, size_t& sink) {
    size_t n = kb * 1024 / (2 * sizeof(float));
    Saxpy s(n, BASE_SEED, y_offset);
    s.pass(rnd, 1.0001f);
    // Setup is done: a counter tool started now sees only the kernel loop
    cout << "READY" << endl;
    size_t passes = 0;
    auto t0 = Clock::now();
    while (seconds_between(t0, Clock::now()) < seconds) { s.pass(rnd, 1.0001f); passes++; }
    double sec = seconds_between(t0, Clock::now());
    cout << "RESULT,footprint_KB," << kb << ",pattern," << (rnd ? "random" : "sequential")
         << ",layout," << (y_offset < 0 ? "heap" : "forced") << ",xy_offset_mod4096," << s.xy_offset()
         << ",elements," << passes * n << ",ns_per_elem," << sec * 1e9 / (passes * (double)n) << endl;
    sink ^= (size_t)s.y[0];
    return 0;
}

int main(int argc, char** argv) {
    setup_process();
    size_t sink = 0;
    int rc;
    if (argc >= 2 && !strcmp(argv[1], "sweep"))
        rc = run_sweep(argc >= 3 ? max(1, atoi(argv[2])) : 3, sink);
    else if (argc >= 5 && !strcmp(argv[1], "one"))
        rc = run_one(strtoull(argv[2], nullptr, 10), !strcmp(argv[3], "rand"), atof(argv[4]),
                     argc >= 6 ? atol(argv[5]) : -1, sink);
    else { cerr << "usage: cachemiss (sweep [R] | one <footprint_KB> <seq|rand> <seconds> [y_offset])\n"; return 1; }
    cerr << "sink (ignore): " << sink << "\n";
    return rc;
}
