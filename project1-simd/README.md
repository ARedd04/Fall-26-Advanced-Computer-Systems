# Project 1: SIMD Advantage Profiling

Scalar vs. auto-vectorized performance of dot product, SAXPY and elementwise multiply on an AMD Ryzen Threadripper 2920X (Zen+, AVX2, `-march=znver1`), single-threaded, on Windows 10. The same sources (`src/`) are compiled four times with different flags, and `run_all.ps1` runs every build over the same configurations.

| Build | Flags (on top of `-std=c++17 -O3 -static`) | What it shows |
|---|---|---|
| `scalar` | `-fno-tree-vectorize -fno-tree-slp-vectorize -DBUILD_SCALAR` | true scalar baseline |
| `auto` | `-fopenmp-simd` | default target (SSE2, 128-bit) |
| `native` | `-fopenmp-simd -march=native` | this CPU's ISA; GCC's Zen+ tuning still prefers 128-bit vectors |
| `native256` | `-fopenmp-simd -march=native -mprefer-vector-width=256` | forced 256-bit AVX2 |

## Required experiment → output → figure

| Required experiment | Output (data/raw/) | Figure |
|---|---|---|
| Scalar vs auto-vectorized, all kernels, across working-set sizes | `baseline.csv` | `01_baseline_speedup` |
| Locality sweep (SAXPY, L1 → DRAM) | `baseline.csv` | `02_locality_saxpy` |
| Alignment (array start shifted 0..15 elements) | `align.csv` | `03_alignment`, `10_bimodal` |
| Tail handling (N = 1..64 and 1024..1056) | `tail.csv` | `04_tail` |
| Stride / gather | `stride.csv` | `05_stride_gather` |
| Data type (f32 / f64 / i32) | `baseline.csv` | `06_datatypes` |
| Roofline (measured bandwidth, peak FLOP/s) | `baseline.csv`, `peak.csv` | `07_roofline` |
| Vectorization verification + negative example | `reports/` | `08_verification_negative` |
| Environment (CPU, OS, compiler, flags, clock, power plan) | `env.txt` | — |

The dot product is run in four variants: `strict` (plain loop; strict IEEE ordering blocks vectorization), `multiacc` (8 scalar accumulators), `simd` and `simd_acc` (reassociation allowed through `omp simd`).

## Build and run

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1             # 4 builds -> bin\
powershell -ExecutionPolicy Bypass -File .\build.ps1 -Verify     # + vectorization evidence in reports\
powershell -ExecutionPolicy Bypass -File .\run_all.ps1           # every experiment -> data\raw\
powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Only "tail,peak"
powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Quick    # smoke test
```

`run_all.ps1` runs the `-Verify` build step first, so `reports\` is regenerated with every full run. Each source file's header comment describes its flags and design choices.

## Vectorization evidence (`reports/`)

- `vec_<build>.txt` / `missed_<build>.txt`: GCC `-fopt-info` lists of loops that were / were not vectorized.
- `kernels_<build>.s`: assembly of `kernels.cpp` (Intel syntax).
- `vector_summary.csv`: per-kernel count of packed 256-bit, packed 128-bit and scalar arithmetic instructions plus FMA and gather, from `tools\vec_summary.ps1`. Only arithmetic is counted, because scalar code also uses xmm registers.

## Plots and processed data

```powershell
py -3.12 -m pip install matplotlib numpy          # once
py -3.12 plots\make_plots.py                      # reads data\raw\, writes data\processed\ and plots\
```

Plots show the median of 3 runs (fresh processes), with min–max error bars. The median keeps one anomalous process from moving a point, and the bars keep it visible (see `10_bimodal`). Every baseline row is checked against a reference result; rows outside tolerance are listed in `data\processed\correctness_failures.csv`.

## Setup notes

- **Compiler:** MSYS2 UCRT64 g++ 13.1.0, called by full path, so no MSYS2 shell is needed. Exact flags are recorded in `bin\compiler.txt` and `data\raw\env.txt`.
- **Pinning:** each benchmark process is pinned to logical CPU 2 at HIGH priority; its SMT sibling (CPU 3) is left idle.
- **Timing:** 15 timed trials per process, each a batch of at least 2 ms; 3 fresh processes per configuration.
- **Clock:** the core clock is measured before and after the run (`--calib`) and used for cycles per element rather than an assumed frequency.
- **Power / hypervisor:** Ultimate Performance power plan, hypervisor off (recorded in `env.txt`).
- **Kernels** live in `src/kernels.cpp`, a separate translation unit marked `noinline`, so the compiler cannot remove work from the timing loop and each kernel is easy to find in the disassembly. Do not build with `-flto`.
