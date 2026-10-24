# Project 2: Cache & Memory Performance Profiling

Each required experiment has its own program in `src/`. All of them share `src/common.h`, which holds pinning, clock calibration, buffers, the pointer chase, kernels and worker threads.

| Required experiment | Program / mode | Output (data/raw/ unless noted) |
|---|---|---|
| Zero-queue baselines | `zeroq [R] [large]` | `zeroq.csv` (+ summary table in `zeroq.log`) |
| Pattern & granularity sweep | `pattern lat`, `pattern bw`, `pattern gran` | `pattern_lat.csv`, `pattern_bw_t*.csv`, `pattern_gran_t*.csv` |
| Read/write mix sweep | `rwmix [R] [threads]` | `rwmix.csv` (throughput + loaded probe latency per mix) |
| Intensity sweep / knee / Little's Law | `intensity mlp [R] [MB] [4k\|2m]`, `intensity loaded` | `intensity_mlp_{1GB,64MB}_{4k,2m}.csv`, `intensity_loaded.csv` |
| Working-set sweep | `wss lat`, `wss bw` | `wss_lat.csv`, `wss_bw.csv` |
| Cache-miss impact | `cachemiss sweep` + `run_cachemiss_pcm.ps1` (hardware counters via AMDuProfPcm) | `cachemiss.csv`, `cachemiss_counters.csv`, raw PCM output in `data/pcm/` |
| TLB-miss impact | `tlb pages`, `tlb locality` + `run_tlb_pcm.ps1` (DTLB counters, 4K vs 2M) | `tlb_pages.csv`, `tlb_locality.csv`, `tlb_counters.csv` |
| Anomaly check (bimodal small random SAXPY) | `run_alias_check.ps1` (forces the x/y offset mod 4096) | `alias_check.csv` |
| Benchmark pitfall | `pitfall reuse / pin / freq / addr` | `pitfall_*.csv` |
| System config | `sysinfo` | `sysinfo.txt` |

Usage details and the reasoning behind each design choice are in the header comment of each source file.

## Build and run

```powershell
.\build.ps1                        # MSYS2 UCRT64 g++ 13, -O2 -std=c++20 -static -> bin\
.\run_all.ps1 -R 3                 # everything (long: the 1 GB DRAM points dominate)
.\run_all.ps1 -R 1 -Only zeroq,tlb # subset
```

## Plots and processed data

```powershell
py -3.12 -m pip install matplotlib numpy          # once
py -3.12 plots\make_plots.py                      # reads data\raw\, compares against data\hv_on\
```

This writes the figures to `plots\*.png` (error bars are ±1 sd across the 3 runs) and the per-configuration mean/sd/n tables to `data\processed\`. Little's Law at each knee is in `data\processed\intensity_knees.txt`. Knee = the first point that reaches 90% of peak throughput. The plotting script uses a regular Windows Python (3.12), not MSYS2's: installing matplotlib into MSYS2 would have meant upgrading MSYS2's core packages, which would also have replaced the g++ 13.1 compiler these benchmarks were built and documented with.

## Setup notes

- **Pinning:** the main / latency-probe thread runs on logical CPU 2 (core 1). Workers get one physical core each, starting at core 2 (`worker_cpu()` in `common.h`). Logical CPUs 2k and 2k+1 are SMT siblings (checked with `sysinfo`).
- **NUMA:** Windows reports a single NUMA node, so memory is interleaved across both dies (UMA / "distributed" mode). About half of all DRAM accesses therefore go to the other die's memory controller.
- **Large pages:** these need the *Lock pages in memory* right (SeLockMemoryPrivilege). Windows 10 Home has no `secpol.msc`, so run `tools\grant_lock_memory.exe` once from an Administrator shell, then sign out and back in. `whoami /priv` will list the right as "Disabled"; that is normal, because each benchmark enables it for itself. A normal (non-admin) shell is enough after that. Without large pages, `zeroq` and `tlb` write 4K rows only, and the chase buffers fall back to 4K pages.
- **Page walks:** on 4 KB pages, a random access over a large span is also a TLB miss. With many misses in flight, the few page walkers become the limit before DRAM does. For example, a 1 GB random chase reaches 10.4 GB/s with 32 chains on 2 MB pages, but stops at 1.18 GB/s on 4 KB pages. `intensity mlp` runs both page sizes. Other chase buffers in `intensity` and the `rwmix` probe use 2 MB pages when allowed; the page type is recorded in a column.
- **Hardware counters:** Windows has no `perf`, so counters come from AMD uProf 5.3's AMDuProfPcm (counting mode), restricted to CPU 2 and to the kernel loop only. The event list is in `tools/pcm_events.conf`, and the shared run logic in `tools/pcm_common.ps1`. The core counters are unavailable while the Hyper-V hypervisor runs (WSL2, VBS), so turn it off with `bcdedit /set hypervisorlaunchtype off` and reboot; re-enable it with `auto`. `run_cachemiss_uprof.ps1` (sampling mode) was abandoned: its reports came out empty, and re-translating them crashed.
- **Clock:** every run measures the core clock with a chain of dependent adds, before and after the run (see the `.log` files). Cycles are calculated as ns × measured GHz.
- **Write bandwidth:** ordinary stores are write-allocate, so each written line costs a read-for-ownership plus a writeback. `rwmix` reports both the bytes the program touched and a ×2-per-written-line DRAM estimate.

The original `chase.cpp` / `dram.cpp` and their CSVs are kept for reference. `pitfall pin` reproduces the `dram.cpp` affinity bug: its process-wide mask put every thread on CPU 2.
