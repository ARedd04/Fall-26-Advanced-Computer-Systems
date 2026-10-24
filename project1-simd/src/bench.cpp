// SIMD benchmark harness (dot product, SAXPY family, elementwise multiply, peak FLOPs).
// One invocation = one configuration = one CSV row on stdout.
//
// Examples:
//   ./bin/bench_native --kernel saxpy --dtype f32 --kib 32 --cpu 2 --ghz 4.2 --header
//   ./bin/bench_native --kernel dot --variant simd_acc --dtype f64 --kib 1024 --cpu 2
//   ./bin/bench_native --kernel saxpy_stride --stride 4 --n 4096 --cpu 2
//   ./bin/bench_native --kernel saxpy_gather --gather rand --n 4096 --cpu 2
//   ./bin/bench_native --kernel peak --dtype f32 --cpu 2
//   ./bin/bench_native --calib --cpu 2          (prints the measured core clock, GHz)
//
// Flags:
//   --kernel   dot | saxpy | saxpy_stride | saxpy_gather | mul | peak   (default dot)
//   --variant  dot only: strict | multiacc | simd | simd_acc            (default strict)
//   --dtype    f32 | f64 | i32 (i32: not for peak)
//   --kib      total footprint of all arrays in KiB (sets N; includes the stride span
//              and the gather index array)
//   --n        explicit element count (overrides --kib; use for tail/stride studies)
//   --stride   saxpy_stride: element stride s (default 1)
//   --gather   saxpy_gather: seq | rand  (idx[i] = i, or a random permutation)
//   --offset   shift every array by this many ELEMENTS from a 64B boundary
//   --offset-x / --offset-y   per-array shifts (y also applies to z for mul)
//   --trials   number of timed trials (default 15)
//   --min-ms   minimum duration of each timed batch (default 2.0)
//   --cpu      logical CPU to pin to (-1 = no pinning; see pin_to_cpu for numbering)
//   --ghz      core frequency used for cycles/element (0 = report nan); measure it
//              with --calib rather than assuming a number
//   --tag      free-text label copied to the CSV (e.g. build name)
//   --run      repeat index copied to the CSV (default 1)
//   --header   print the CSV header first

// Platform support: Windows (MSYS2/MinGW-w64) and Linux.
#ifdef _WIN32
#define NOMINMAX
#define WIN32_LEAN_AND_MEAN
#include <malloc.h>
#include <windows.h>
#else
#include <sched.h>
#endif

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
#include <numeric>
#include <random>
#include <string>
#include <type_traits>
#include <vector>

#include "kernels.h"

using Clock = std::chrono::steady_clock;

// Written after every trial so the optimizer must keep the kernel calls.
static volatile double g_sink = 0.0;

struct Opts {
    std::string kernel = "dot";
    std::string variant = "strict";
    std::string dtype = "f32";
    std::string gather = "";
    std::string tag = "";
    int run = 1;
    size_t n = 0;
    size_t kib = 32;
    size_t stride = 1;
    long offset_x = -1, offset_y = -1;   // -1 = use --offset
    size_t offset = 0;
    int trials = 15;
    double min_ms = 2.0;
    int cpu = -1;
    double ghz = 0.0;
    bool header = false;
    bool calib = false;
};

// Pin the process to one logical CPU.
// Windows: index into processor group 0 (0..63). SMT siblings are adjacent, so on a
//          12-core/24-thread part, 2 and 3 are the two threads of physical core 1.
// Linux:   logical CPU number as shown by `lscpu -e`.
static void pin_to_cpu(int cpu) {
    if (cpu < 0) return;
#ifdef _WIN32
    if (cpu >= 64) {
        std::fprintf(stderr, "--cpu %d is outside processor group 0 (continuing unpinned)\n", cpu);
        return;
    }
    const DWORD_PTR mask = (DWORD_PTR)1 << cpu;
    if (SetThreadAffinityMask(GetCurrentThread(), mask) == 0)
        std::fprintf(stderr, "SetThreadAffinityMask failed (error %lu), continuing unpinned\n",
                     (unsigned long)GetLastError());
    // Reduce scheduling noise from other processes while measuring.
    SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);
#else
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(cpu, &set);
    if (sched_setaffinity(0, sizeof(set), &set) != 0)
        perror("sched_setaffinity (continuing unpinned)");
#endif
}

// 64-byte-aligned allocation (cache-line / AVX-512 aligned on both platforms).
static void* alloc64(size_t bytes) {
    bytes = (bytes + 63) / 64 * 64;
#ifdef _WIN32
    return _aligned_malloc(bytes, 64);
#else
    return std::aligned_alloc(64, bytes);
#endif
}

static void free64(void* p) {
#ifdef _WIN32
    _aligned_free(p);
#else
    std::free(p);
#endif
}

// Core clock from a chain of dependent integer adds (1 cycle each): adds / time = GHz.
// The empty asm keeps x in a register after every add so the chain cannot be folded.
static double calibrate_ghz() {
    std::vector<double> g;
    for (int t = 0; t < 5; ++t) {
        unsigned long long x = 0;
        const long iters = 100000000;
        auto a = Clock::now();
        for (long i = 0; i < iters; ++i) {
#define DEP_ADD x += 1; asm volatile("" : "+r"(x));
            DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD
#undef DEP_ADD
        }
        auto b = Clock::now();
        g_sink = g_sink + (double)x;
        g.push_back(8.0 * iters / std::chrono::duration<double, std::nano>(b - a).count());
    }
    std::sort(g.begin(), g.end());
    return g[g.size() / 2];
}

struct Timing {
    size_t reps = 0;
    double med = 0, best = 0, mean = 0, sd = 0;
};

// Warm-up, pick a batch size so one batch lasts >= min_ms, then time 'trials' batches.
// 'call(r)' runs the kernel once (r = call index) and returns something to sink.
template <class F>
static Timing time_kernel(F&& call, double min_ms, int trials) {
    double acc = 0.0;
    for (int i = 0; i < 3; ++i) acc += call(i);
    size_t reps = 1;
    for (;;) {                                   // grow the batch until it is long enough
        auto a = Clock::now();
        for (size_t r = 0; r < reps; ++r) acc += call((int)r);
        double s = std::chrono::duration<double>(Clock::now() - a).count();
        if (s >= min_ms * 1e-3 || reps >= (1ull << 30)) break;
        reps = s > 0 ? std::max<size_t>(reps * 2, (size_t)(reps * (min_ms * 1e-3 / s) * 1.1)) : reps * 16;
    }
    std::vector<double> per_call(trials);
    for (int t = 0; t < trials; ++t) {
        double local = 0.0;
        auto a = Clock::now();
        for (size_t r = 0; r < reps; ++r) local += call((int)r);
        auto b = Clock::now();
        g_sink = g_sink + local;
        per_call[t] = std::chrono::duration<double>(b - a).count() / (double)reps;
    }
    g_sink = g_sink + acc;

    Timing tm;
    tm.reps = reps;
    std::vector<double> s = per_call;
    std::sort(s.begin(), s.end());
    tm.med = (trials % 2) ? s[trials / 2] : 0.5 * (s[trials / 2 - 1] + s[trials / 2]);
    tm.best = s.front();
    for (double v : per_call) tm.mean += v;
    tm.mean /= trials;
    for (double v : per_call) tm.sd += (v - tm.mean) * (v - tm.mean);
    tm.sd = trials > 1 ? std::sqrt(tm.sd / (trials - 1)) : 0.0;
    return tm;
}

template <typename T>
using DotFn = T (*)(const T*, const T*, size_t);

template <typename T>
static DotFn<T> select_dot(const std::string& v) {
    if (v == "strict") return dot_strict<T>;
    if (v == "multiacc") return dot_multiacc<T>;
    if (v == "simd") return dot_simd<T>;
    if (v == "simd_acc") return dot_simd_acc<T>;
    return nullptr;
}

static void print_row(const Opts& o, const std::string& variant, size_t n, size_t footprint,
                      size_t ox, size_t oy, const Timing& tm, double flops_per_call,
                      double bytes_per_call, double rel_err, bool ok) {
    const double gflops = flops_per_call / tm.med / 1e9;
    const double gflops_best = flops_per_call / tm.best / 1e9;
    const double gibs = bytes_per_call / tm.med / (1024.0 * 1024.0 * 1024.0);
    const double ns_pe = tm.med * 1e9 / (double)n;
    const double cpe = o.ghz > 0 ? tm.med * o.ghz * 1e9 / (double)n : std::nan("");
    if (o.header)
        std::printf("tag,run,kernel,variant,dtype,n,stride,gather,footprint_bytes,offset_x_elems,"
                    "offset_y_elems,reps,trials,median_s,min_s,mean_s,std_s,gflops_median,"
                    "gibs_median,gflops_best,ns_per_elem,cycles_per_elem,ghz,rel_err,ok\n");
    std::printf("%s,%d,%s,%s,%s,%zu,%zu,%s,%zu,%zu,%zu,%zu,%d,%.6e,%.6e,%.6e,%.6e,%.4f,%.4f,%.4f,"
                "%.5f,%.4f,%.4f,%.3e,%d\n",
                o.tag.c_str(), o.run, o.kernel.c_str(), variant.c_str(), o.dtype.c_str(), n,
                o.kernel == "saxpy_stride" ? o.stride : (size_t)1,
                o.gather.empty() ? "-" : o.gather.c_str(), footprint, ox, oy, tm.reps, o.trials,
                tm.med, tm.best, tm.mean, tm.sd, gflops, gibs, gflops_best, ns_pe, cpe, o.ghz,
                rel_err, ok ? 1 : 0);
}

template <typename T>
static int run_peak(const Opts& o) {
    if constexpr (std::is_integral<T>::value) {
        std::fprintf(stderr, "peak is only defined for f32/f64\n");
        return 2;
    } else {
        double fpi = 0;
        const T m = T(0.999), c = T(1e-3);       // acc -> c/(1-m): bounded, never denormal
        const size_t iters = 1000000;
        Timing tm = time_kernel([&](int) { return (double)peak_flops<T>(iters, m, c, &fpi); },
                                o.min_ms, o.trials);
        print_row(o, "-", iters, 0, 0, 0, tm, fpi * (double)iters, 0.0, 0.0, true);
        return 0;
    }
}

template <typename T>
static int run(const Opts& o) {
    if (o.kernel == "peak") return run_peak<T>(o);

    const size_t sz = sizeof(T);
    const size_t s = (o.kernel == "saxpy_stride") ? std::max<size_t>(1, o.stride) : 1;
    // Bytes spanned per element, over all arrays (what --kib describes)
    size_t span_per_elem;
    double flops_pe, bytes_pe;                   // useful work / traffic per element
    if (o.kernel == "dot")               { span_per_elem = 2 * sz;      flops_pe = 2; bytes_pe = 2.0 * sz; }
    else if (o.kernel == "saxpy")        { span_per_elem = 2 * sz;      flops_pe = 2; bytes_pe = 3.0 * sz; }
    else if (o.kernel == "saxpy_stride") { span_per_elem = 2 * sz * s;  flops_pe = 2; bytes_pe = 3.0 * sz; }
    else if (o.kernel == "saxpy_gather") { span_per_elem = 2 * sz + 4;  flops_pe = 2; bytes_pe = 3.0 * sz + 4; }
    else if (o.kernel == "mul")          { span_per_elem = 3 * sz;      flops_pe = 1; bytes_pe = 3.0 * sz; }
    else { std::fprintf(stderr, "unknown kernel '%s'\n", o.kernel.c_str()); return 2; }

    const size_t n = o.n ? o.n : (o.kib * 1024) / span_per_elem;
    if (n == 0) { std::fprintf(stderr, "N is zero\n"); return 2; }
    const size_t ox = o.offset_x >= 0 ? (size_t)o.offset_x : o.offset;
    const size_t oy = o.offset_y >= 0 ? (size_t)o.offset_y : o.offset;
    const size_t span = n * s;                   // elements spanned per data array

    // Over-allocate so shifted starts and tails never read out of bounds.
    const size_t elems = span + std::max(ox, oy) + 64;
    T* bx = static_cast<T*>(alloc64(elems * sz));
    T* by = static_cast<T*>(alloc64(elems * sz));
    T* bz = o.kernel == "mul" ? static_cast<T*>(alloc64(elems * sz)) : nullptr;
    std::vector<std::int32_t> idx;
    if (!bx || !by || (o.kernel == "mul" && !bz)) { std::fprintf(stderr, "allocation failed\n"); return 2; }

    // Fixed seed. Floats in [0.5, 1.5): no zeros/denormals, no cancellation.
    // Ints in [1, 3]. Writing every element also touches every page.
    std::mt19937_64 rng(12345);
    for (size_t i = 0; i < elems; ++i) {
        if constexpr (std::is_integral<T>::value) {
            bx[i] = T(1 + rng() % 3); by[i] = T(1 + rng() % 3);
        } else {
            std::uniform_real_distribution<T> dist(T(0.5), T(1.5));
            bx[i] = dist(rng); by[i] = dist(rng);
        }
        if (bz) bz[i] = T(0);
    }
    T* x = bx + ox;
    T* y = by + oy;
    T* z = bz ? bz + oy : nullptr;
    if (o.kernel == "saxpy_gather") {
        idx.resize(n);
        std::iota(idx.begin(), idx.end(), 0);
        if (o.gather == "rand") std::shuffle(idx.begin(), idx.end(), rng);
        else if (o.gather != "seq") { std::fprintf(stderr, "--gather must be seq or rand\n"); return 2; }
    }

    // SAXPY uses a, then -a, alternately, so y stays bounded over millions of calls
    // (and int32 never overflows). Same work either way.
    const T a = std::is_integral<T>::value ? T(1) : T(0.5);
    const double eps = std::is_integral<T>::value ? 0.0 : (double)std::numeric_limits<T>::epsilon();

    // ---- Correctness vs. long double reference --------------------------
    double rel_err = 0.0, tol = 0.0;
    std::string variant = "-";
    DotFn<T> dfn = nullptr;
    if (o.kernel == "dot") {
        variant = o.variant;
        dfn = select_dot<T>(o.variant);
        if (!dfn) { std::fprintf(stderr, "unknown variant '%s'\n", o.variant.c_str()); return 2; }
        const T got = dfn(x, y, n);
        const long double ref = dot_ref<T>(x, y, n);
        rel_err = (double)(std::fabs((long double)got - ref) / std::fabs(ref));
        // Reordered sums differ from the reference by roughly sqrt(N)*eps; be generous.
        tol = 16.0 * eps * std::sqrt((double)n) + 16.0 * eps;
    } else if (o.kernel == "mul") {
        vmul<T>(x, y, z, n);
        for (size_t i = 0; i < n; ++i) {
            long double ref = vmul_ref_elem<T>(x[i], y[i]);
            rel_err = std::max(rel_err, (double)(std::fabs((long double)z[i] - ref) / std::fabs(ref)));
        }
        tol = eps;                               // one correctly rounded multiply
    } else {
        std::vector<T> y0(y, y + span);
        if (o.kernel == "saxpy")             saxpy<T>(a, x, y, n);
        else if (o.kernel == "saxpy_stride") saxpy_stride<T>(a, x, y, n, s);
        else                                 saxpy_gather<T>(a, x, y, idx.data(), n);
        for (size_t i = 0; i < n; ++i) {
            const size_t j = i * s;
            const T xv = o.kernel == "saxpy_gather" ? x[idx[i]] : x[j];
            long double ref = saxpy_ref_elem<T>(a, xv, y0[j]);
            rel_err = std::max(rel_err, (double)(std::fabs((long double)y[j] - ref) / std::fabs(ref)));
        }
        tol = 2.0 * eps;                         // FMA (one rounding) vs mul+add (two)
    }
    const bool ok = rel_err <= tol;
    if (!ok)
        std::fprintf(stderr, "WARN: %s/%s/%s n=%zu rel_err=%.3e > tol=%.3e\n", o.kernel.c_str(),
                     variant.c_str(), o.dtype.c_str(), n, rel_err, tol);

    // ---- Timing ------------------------------------------------------------
    Timing tm;
    if (o.kernel == "dot") {
        tm = time_kernel([&](int) { return (double)dfn(x, y, n); }, o.min_ms, o.trials);
    } else if (o.kernel == "mul") {
        tm = time_kernel([&](int) { vmul<T>(x, y, z, n); return (double)z[n - 1]; }, o.min_ms, o.trials);
    } else if (o.kernel == "saxpy") {
        tm = time_kernel([&](int r) { saxpy<T>((r & 1) ? T(-a) : a, x, y, n); return (double)y[0]; },
                         o.min_ms, o.trials);
    } else if (o.kernel == "saxpy_stride") {
        tm = time_kernel([&](int r) { saxpy_stride<T>((r & 1) ? T(-a) : a, x, y, n, s); return (double)y[0]; },
                         o.min_ms, o.trials);
    } else {
        tm = time_kernel([&](int r) { saxpy_gather<T>((r & 1) ? T(-a) : a, x, y, idx.data(), n); return (double)y[0]; },
                         o.min_ms, o.trials);
    }

    print_row(o, variant, n, span_per_elem * n, ox, oy, tm, flops_pe * (double)n,
              bytes_pe * (double)n, rel_err, ok);
    free64(bx);
    free64(by);
    if (bz) free64(bz);
    return 0;
}

int main(int argc, char** argv) {
    Opts o;
    for (int i = 1; i < argc; ++i) {
        const std::string k = argv[i];
        auto val = [&](void) -> const char* {
            if (i + 1 >= argc) {
                std::fprintf(stderr, "missing value for %s\n", k.c_str());
                std::exit(2);
            }
            return argv[++i];
        };
        if (k == "--kernel") o.kernel = val();
        else if (k == "--variant") o.variant = val();
        else if (k == "--dtype") o.dtype = val();
        else if (k == "--gather") o.gather = val();
        else if (k == "--tag") o.tag = val();
        else if (k == "--run") o.run = std::atoi(val());
        else if (k == "--kib") o.kib = std::strtoull(val(), nullptr, 10);
        else if (k == "--n") o.n = std::strtoull(val(), nullptr, 10);
        else if (k == "--stride") o.stride = std::strtoull(val(), nullptr, 10);
        else if (k == "--offset") o.offset = std::strtoull(val(), nullptr, 10);
        else if (k == "--offset-x") o.offset_x = std::atol(val());
        else if (k == "--offset-y") o.offset_y = std::atol(val());
        else if (k == "--trials") o.trials = std::atoi(val());
        else if (k == "--min-ms") o.min_ms = std::atof(val());
        else if (k == "--cpu") o.cpu = std::atoi(val());
        else if (k == "--ghz") o.ghz = std::atof(val());
        else if (k == "--header") o.header = true;
        else if (k == "--calib") o.calib = true;
        else {
            std::fprintf(stderr, "unknown flag %s\n", k.c_str());
            return 2;
        }
    }
    if (o.trials < 1) o.trials = 1;

    pin_to_cpu(o.cpu);

    if (o.calib) {
        std::printf("%.4f\n", calibrate_ghz());
        return 0;
    }
    if (o.dtype == "f32") return run<float>(o);
    if (o.dtype == "f64") return run<double>(o);
    if (o.dtype == "i32") return run<std::int32_t>(o);
    std::fprintf(stderr, "unknown dtype '%s'\n", o.dtype.c_str());
    return 2;
}
