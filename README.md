# ECSE 4320/6320 Advanced Computer Systems: Class-wide Projects (Fall 2026)

| Project | Folder | Topic |
|---|---|---|
| 1 | [`project1-simd/`](project1-simd/) | SIMD advantage profiling: scalar vs. auto-vectorized kernels, locality, alignment/tail, stride/gather, roofline |
| 2 | [`project2-memory/`](project2-memory/) | Cache & memory profiling: per-level latency, bandwidth, throughput-latency knee, cache/TLB misses |
| 3 | [`project3-ssd/`](project3-ssd/) | SSD profiling with fio: QD=1 latency, block size, read/write mix, queue-depth knee, tail latency |

All three were measured on the same machine: an AMD Ryzen Threadripper 2920X (Zen+, 12 cores / 24 threads), 64GB DDR4-2133Hz memory, running Windows 10. Each project folder has its own README with build/run instructions and setup notes, and uses the same layout:

```
src/             source code (projects 1 and 2)
build.ps1        builds bin\ (executables are not committed; rebuild them with this script)
run_*.ps1        runs the experiments and writes data\raw\
data/raw/        raw measurements and the environment record
data/processed/  per-configuration summaries written by plots/make_plots.py
plots/           figures and the plotting script
```
