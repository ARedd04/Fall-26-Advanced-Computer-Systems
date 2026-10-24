#include "kernels.h"

using std::size_t;

#define NOINLINE __attribute__((noinline))

// ---------------------------------------------------------------------------
// 1) Strict scalar: single accumulator. Without -ffast-math the compiler is not
//    allowed to reorder the adds, so the sum stays one serial chain. GCC 13 may
//    still report this loop as "vectorized": it vectorizes the multiplies and keeps
//    the adds in order (an in-order reduction), so it stays latency-bound.
// ---------------------------------------------------------------------------
template <typename T>
NOINLINE T dot_strict(const T* __restrict__ x, const T* __restrict__ y, size_t n) {
    T s = T(0);
    for (size_t i = 0; i < n; ++i) s += x[i] * y[i];
    return s;
}

// ---------------------------------------------------------------------------
// 2) Multi-accumulator scalar: breaks the dependency chain by hand.
//    NOTE: in the auto/native builds GCC/Clang may SLP-vectorize this loop.
//    Check the vectorization report before calling it "scalar ILP".
// ---------------------------------------------------------------------------
template <typename T>
NOINLINE T dot_multiacc(const T* __restrict__ x, const T* __restrict__ y, size_t n) {
    constexpr size_t K = 8;
    T acc[K] = {};
    size_t i = 0;
    for (; i + K <= n; i += K) {
        for (size_t k = 0; k < K; ++k) acc[k] += x[i + k] * y[i + k];
    }
    T s = T(0);
    for (size_t k = 0; k < K; ++k) s += acc[k];
    for (; i < n; ++i) s += x[i] * y[i];  // tail
    return s;
}

// ---------------------------------------------------------------------------
// 3) OpenMP SIMD reduction (compile with -fopenmp-simd; no threads involved).
//    The compiler may reassociate because we explicitly allowed it. Typically
//    one vector accumulator => vector-add latency can still limit throughput.
// ---------------------------------------------------------------------------
template <typename T>
NOINLINE T dot_simd(const T* __restrict__ x, const T* __restrict__ y, size_t n) {
    T s = T(0);
#pragma omp simd reduction(+ : s)
    for (size_t i = 0; i < n; ++i) s += x[i] * y[i];
    return s;
}

// ---------------------------------------------------------------------------
// 4) SIMD with several independent vector accumulators.
//    W elements per block; the inner simd loop is elementwise (no reduction),
//    so with AVX2/float it maps to 4 independent ymm accumulators.
// ---------------------------------------------------------------------------
template <typename T>
NOINLINE T dot_simd_acc(const T* __restrict__ x, const T* __restrict__ y, size_t n) {
    constexpr size_t W = 32;
    T acc[W] = {};
    size_t i = 0;
    for (; i + W <= n; i += W) {
#pragma omp simd
        for (size_t j = 0; j < W; ++j) acc[j] += x[i + j] * y[i + j];
    }
    T s = T(0);
    for (size_t j = 0; j < W; ++j) s += acc[j];
    for (; i < n; ++i) s += x[i] * y[i];  // tail
    return s;
}

// ---------------------------------------------------------------------------
// SAXPY family. Plain loops: whether they vectorize is up to the build flags.
// ---------------------------------------------------------------------------
template <typename T>
NOINLINE void saxpy(T a, const T* __restrict__ x, T* __restrict__ y, size_t n) {
    for (size_t i = 0; i < n; ++i) y[i] = a * x[i] + y[i];
}

template <typename T>
NOINLINE void saxpy_stride(T a, const T* __restrict__ x, T* __restrict__ y, size_t n, size_t s) {
    for (size_t i = 0; i < n; ++i) y[i * s] = a * x[i * s] + y[i * s];
}

template <typename T>
NOINLINE void saxpy_gather(T a, const T* __restrict__ x, T* __restrict__ y,
                           const std::int32_t* __restrict__ idx, size_t n) {
    for (size_t i = 0; i < n; ++i) y[i] = a * x[idx[i]] + y[i];
}

// ---------------------------------------------------------------------------
// Elementwise multiply
// ---------------------------------------------------------------------------
template <typename T>
NOINLINE void vmul(const T* __restrict__ x, const T* __restrict__ y, T* __restrict__ z, size_t n) {
    for (size_t i = 0; i < n; ++i) z[i] = x[i] * y[i];
}

// ---------------------------------------------------------------------------
// Peak FLOP rate. Written with GCC vector extensions (not auto-vectorization) so the
// width is fixed by the build's ISA: BUILD_SCALAR -> plain scalars, AVX -> 32-byte
// vectors, otherwise SSE 16-byte vectors. 12 independent chains cover the FP latency
// (Zen+: FMA latency 5 cycles x 2 FMA pipes = 10 operations in flight). acc*m + c
// contracts to one FMA when the build has -mfma (GCC's default -ffp-contract=fast).
// ---------------------------------------------------------------------------
#if defined(BUILD_SCALAR)
#define PEAK_VBYTES 0
#elif defined(__AVX__)
#define PEAK_VBYTES 32
#else
#define PEAK_VBYTES 16
#endif

template <typename T>
NOINLINE T peak_flops(size_t iters, T m, T c, double* flops_per_iter) {
    constexpr int K = 12;
#if PEAK_VBYTES == 0
    using V = T;
    constexpr int L = 1;
#else
    typedef T V __attribute__((vector_size(PEAK_VBYTES)));
    constexpr int L = PEAK_VBYTES / sizeof(T);
#endif
    V acc[K];
    for (int k = 0; k < K; ++k) acc[k] = V{} + (T(1) + T(k) * T(1e-3));
    const V vm = V{} + m, vc = V{} + c;
    for (size_t it = 0; it < iters; ++it) {
#pragma GCC unroll 12
        for (int k = 0; k < K; ++k) acc[k] = acc[k] * vm + vc;
    }
    V s = acc[0];
    for (int k = 1; k < K; ++k) s += acc[k];
    *flops_per_iter = 2.0 * K * L;
#if PEAK_VBYTES == 0
    return s;
#else
    T r = T(0);
    for (int l = 0; l < L; ++l) r += s[l];
    return r;
#endif
}

// ---------------------------------------------------------------------------
// References (ground truth for correctness checks)
// ---------------------------------------------------------------------------
template <typename T>
long double dot_ref(const T* x, const T* y, size_t n) {
    long double s = 0.0L;
    for (size_t i = 0; i < n; ++i) s += (long double)x[i] * (long double)y[i];
    return s;
}

template <typename T>
long double saxpy_ref_elem(T a, T x, T y) { return (long double)a * (long double)x + (long double)y; }

template <typename T>
long double vmul_ref_elem(T x, T y) { return (long double)x * (long double)y; }

// Explicit instantiations
#define INSTANTIATE(T)                                                                  \
    template T dot_strict<T>(const T*, const T*, size_t);                               \
    template T dot_multiacc<T>(const T*, const T*, size_t);                             \
    template T dot_simd<T>(const T*, const T*, size_t);                                 \
    template T dot_simd_acc<T>(const T*, const T*, size_t);                             \
    template void saxpy<T>(T, const T*, T*, size_t);                                    \
    template void saxpy_stride<T>(T, const T*, T*, size_t, size_t);                     \
    template void saxpy_gather<T>(T, const T*, T*, const std::int32_t*, size_t);        \
    template void vmul<T>(const T*, const T*, T*, size_t);                              \
    template long double dot_ref<T>(const T*, const T*, size_t);                        \
    template long double saxpy_ref_elem<T>(T, T, T);                                    \
    template long double vmul_ref_elem<T>(T, T);

INSTANTIATE(float)
INSTANTIATE(double)
INSTANTIATE(std::int32_t)

template float peak_flops<float>(size_t, float, float, double*);
template double peak_flops<double>(size_t, double, double, double*);
