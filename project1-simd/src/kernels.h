#pragma once
#include <cstddef>
#include <cstdint>

// All kernels are defined in kernels.cpp (a separate translation unit compiled with
// the build's vectorization flags) and marked noinline so that (a) the compiler cannot
// hoist or delete the work inside the benchmark's timing loop, and (b) each kernel is
// easy to find in the disassembly. Do NOT build with -flto.

// ---------------------------------------------------------------------------
// Dot product: s = sum(x_i * y_i)
// ---------------------------------------------------------------------------

// One accumulator, plain loop. Strict IEEE => loop-carried dependency on `s`.
template <typename T>
T dot_strict(const T* __restrict__ x, const T* __restrict__ y, std::size_t n);

// 8 independent scalar accumulators (ILP without intentional SIMD).
template <typename T>
T dot_multiacc(const T* __restrict__ x, const T* __restrict__ y, std::size_t n);

// `#pragma omp simd reduction(+:s)` -> vectorized, but only one vector accumulator.
template <typename T>
T dot_simd(const T* __restrict__ x, const T* __restrict__ y, std::size_t n);

// Block of independent lanes held in an accumulator array, updated with
// `#pragma omp simd` -> several vector accumulators in flight (SIMD + ILP).
template <typename T>
T dot_simd_acc(const T* __restrict__ x, const T* __restrict__ y, std::size_t n);

// ---------------------------------------------------------------------------
// SAXPY / AXPY: y = a*x + y
// ---------------------------------------------------------------------------

// Unit stride.
template <typename T>
void saxpy(T a, const T* __restrict__ x, T* __restrict__ y, std::size_t n);

// Stride s (run-time): updates x[i*s], y[i*s] for i < n. Same work per element as
// saxpy, but s times more cache lines (one line per element once s*sizeof(T) >= 64).
template <typename T>
void saxpy_stride(T a, const T* __restrict__ x, T* __restrict__ y, std::size_t n, std::size_t s);

// Gather: y[i] = a*x[idx[i]] + y[i]. Indexed READ, contiguous write, so AVX2 can use
// vgatherdps/vgatherdpd (AVX2 has no scatter, so an indexed write would not vectorize).
template <typename T>
void saxpy_gather(T a, const T* __restrict__ x, T* __restrict__ y,
                  const std::int32_t* __restrict__ idx, std::size_t n);

// ---------------------------------------------------------------------------
// Elementwise multiply: z = x * y
// ---------------------------------------------------------------------------
template <typename T>
void vmul(const T* __restrict__ x, const T* __restrict__ y, T* __restrict__ z, std::size_t n);

// ---------------------------------------------------------------------------
// Peak arithmetic throughput: 12 independent multiply-add chains held in registers,
// as wide as the build's ISA allows (scalar / 128-bit SSE / 256-bit AVX). With FMA
// available (native builds) each chain step is one FMA. Returns a value derived from
// the accumulators; *flops_per_iter receives the FLOPs done per outer iteration.
// ---------------------------------------------------------------------------
template <typename T>
T peak_flops(std::size_t iters, T m, T c, double* flops_per_iter);

// ---------------------------------------------------------------------------
// References (ground truth for correctness checks). Long double arithmetic: the x87
// type is never vectorized, so these are scalar in every build.
// ---------------------------------------------------------------------------
template <typename T>
long double dot_ref(const T* x, const T* y, std::size_t n);

template <typename T>
long double saxpy_ref_elem(T a, T x, T y);   // a*x + y for one element

template <typename T>
long double vmul_ref_elem(T x, T y);         // x*y for one element
