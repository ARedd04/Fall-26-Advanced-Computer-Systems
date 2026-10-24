# Project 2 Report Outline: Cache & Memory Performance Profiling

Working outline. Each section lists the rubric category it earns points in, the figure(s) and data files to use, the measured numbers (from `data/processed/`, hypervisor-off data set, mean over 3 runs unless noted), and the interpretation points to make.
- **[YOU]** marks parts only you can write (hypotheses, AI-use note).
- **Rubric total 185:** zero-queue 25 · pattern/granularity/RW 35 · knee 35 · working-set/cache/TLB 35 · rigor 25 · AI + pitfall 15 · report quality 15.

---

## 1. Introduction (½ page)
- **Goal:** measure each level of the memory hierarchy (latency, bandwidth, queuing) and explain performance through locality, concurrency, cache misses and TLB misses. Use Little's Law and AMAT to interpret the results.
- **Approach:** one purpose-built C++ benchmark per experiment, plus hardware counters (AMD uProf PCM) and controlled settings (pinning, large pages, repeated runs).
- **Roadmap:** list the sections that follow.

## 2. System and methodology  → *Experimental rigor (25)*
Sources: `data/raw/sysinfo.txt`, `bin/compiler.txt`, README "Setup notes".

- **Hardware**

  | Item | Value |
  |---|---|
  | CPU | AMD Threadripper 2920X (Zen+), 12 cores / 24 threads, SMT on |
  | L1d | 32 KB, 8-way, per core |
  | L2 | 512 KB, 8-way, per core |
  | L3 | 8 MB, 16-way, per CCX (3 cores); 32 MB chip total |
  | Memory | 64 GB (4 × 16 GB DDR4-2133) |
  | NUMA | UMA mode: Windows sees one NUMA node, memory interleaved across both dies |

- **Software:**
  - Windows 10 Home 22H2
  - g++ 13.1 (MSYS2 UCRT64), flags `-O2 -std=c++20 -static`
  - AMD uProf 5.3.521 (AMDuProfPcm)
  - Python 3.12 + matplotlib for the plots
- **Frequency:**
  - **Power plan:** Ultimate Performance.
  - **Measured clock:** about 4.2 GHz, using a dependent-add chain timed before and after every run.
  - **Cycles:** ns × measured GHz, never an assumed clock.
- **Isolation:**
  - **Pinning:** the main/probe thread runs on logical CPU 2, with its SMT sibling (3) left idle; worker threads get one physical core each, starting at core 2.
  - **Priority:** HIGH.
- **Pages:** 4 KB by default; 2 MB large pages via `MEM_LARGE_PAGES` (needed the "Lock pages in memory" right, granted with a small helper because Windows Home has no `secpol.msc`).
- **Hypervisor:** Hyper-V/VBS turned off for the main data set (needed for the hardware counters); a hypervisor-on data set was kept for comparison (Section 11).
- **Repetitions:** each experiment runs 3 times in fresh processes, rebuilding buffers and reshuffling with a new seed each time. Error bars = ±1 sd across runs.
- **Correctness / sanity checks** (requirement 4):
  - every pointer chain is checked to form one complete cycle;
  - the SAXPY result is checked against a reference loop;
  - L1 latency reads exactly 4.0 cycles, matching Zen's documented load-to-use latency;
  - a result "sink" is printed so the compiler can't delete the timed loops.

## 3. Pre-experiment hypotheses  → *required by the assignment*
**[YOU]** For each experiment, write what you expected and why, *before* the results. Prompts:
- **Latency:** steps at 32 KB / 512 KB / 8 MB? Roughly how many cycles per level?
- **Patterns:** random slower than sequential? Prefetchers hiding sequential latency?
- **Writes:** lower bandwidth because of read-for-ownership?
- **Concurrency:** throughput rising with requests in flight until a bandwidth limit, then latency climbing?
- **TLB:** huge pages helping only once the working set exceeds TLB reach?

## 4. Zero-queue latency  → *Zero-queue baselines (25)*
Figure `01_zeroq.png`; table from `zeroq_summary.csv`.

| Level (test size) | 4K pages | 2M pages | Cycles (4K / 2M) |
|---|---|---|---|
| L1 (16 KB) | 0.95 ns | 0.95 ns | 4.0 / 4.0 |
| L2 (256 KB) | 2.87 ns | 2.87 ns | 12.0 / 12.0 |
| L3 (4 MB) | 9.13 ns | 8.10 ns | 38 / 34 |
| DRAM (1 GB) | 217.8 ns | 120.9 ns | 910 / 505 |

- **Method:** one dependent pointer chain in random order, one node per 64 B line. Only one miss is ever in flight, so there's no queueing and the prefetchers can't predict the next address.
- **Caveat: DRAM on 4 KB pages includes page walks.** 1 GB = 262K pages, far beyond the TLBs, so every hop also misses the TLB. True DRAM latency ≈ the 2 MB number (121 ns); the 97 ns difference is translation cost (links to Section 9).
- **Caveat: UMA mode** means about half the DRAM accesses go to the other die's memory controller, so the 121 ns is an average.
- **L3 at 4 MB** gets only partial L2 hits (4 MB vs 512 KB), so it's mostly an L3 number; the small 4K-vs-2M difference is L1 TLB misses.

## 5. Pattern, granularity and read/write sweeps  → *Pattern/granularity/RW sweeps (35)*
### 5a. Pattern × stride latency (`02a_pattern_latency.png`)
- **Design:** the footprint is fixed (the bytes of lines touched), so the cache level stays the same; strides of 64/256/1024 B change only how the lines are spread out.
- **Points:**
  - Sequential stays fast at every size because the prefetchers predict it.
  - Random at DRAM size (64 MB of lines) takes the full DRAM latency, about 125–180 ns depending on stride; quote exact values from `pattern_lat_summary.csv`.
  - Larger strides add TLB pressure: the same lines spread over more pages.
### 5b. Bandwidth by stride (`02b_pattern_bandwidth.png`)
- **1 thread:** sequential 64 B stride 17 GB/s vs random 8.5 GB/s; random at 256/1024 B strides drops to 1–3 GB/s.
- **8 threads:** sequential 49 GB/s vs random 40 GB/s.
- **Why:** each 8 B load pulls a whole 64 B line, so useful bandwidth is 1/8 of line bandwidth.
### 5c. Granularity (`02c_pattern_granularity.png`)
- Random blocks need to be large before they match sequential bandwidth:
  - 64 B: 1.4 GB/s (1 thread), 8.5 GB/s (8 threads)
  - 4 KB: 8.8 GB/s
  - 64 KB: 14.7 GB/s, close to sequential 15.8 GB/s
- **Interpretation:** each new random block pays a fresh latency and loses prefetching and DRAM row-buffer locality.
### 5d. Read/write mix (`03_rwmix.png`, `rwmix_summary.csv`)
- **Bandwidth the program touched, 8 threads:** 100R 48.5 · 70/30 36.4 · 50/50 33.1 · 100W 25.4 GB/s.
- **Write-allocate:** each written line is first read into the cache (read-for-ownership) and later written back, so DRAM moves about 2 × 64 B per written line. The estimated DRAM traffic is about 50 GB/s for every mix, so **the mixes differ in useful bandwidth, not in DRAM traffic**. Note that this ×2 factor is an estimate, not a counter reading.
- **Probe latency under load** grows with the write fraction, from 172 ns at 100R to about 280 ns at 100W with 8 threads, likely because of read/write turnaround and writebacks.

## 6. Intensity sweep: knee and Little's Law  → *Throughput-latency knee (35)*
Figures `04a_intensity_mlp.png`, `04b_intensity_loaded.png`; `intensity_knees.txt`.
- **Knee definition:** the first point reaching 90% of peak throughput; past it, more concurrency adds latency but little bandwidth.
- **One core (MLP sweep, K independent chains, 2 MB pages):**
  - The knee is at about **24 outstanding misses: 10.2 GB/s × 150 ns ÷ 64 B ≈ 24**.
  - Latency stays nearly flat (120 → 150 ns) until then, then rises (to ~195 ns at 32 chains) with throughput flat at about 10.5 GB/s.
  - **Interpretation:** a per-core limit on outstanding misses (the miss buffers), not DRAM. One core can't saturate memory.
- **4 KB pages at 1 GB:** the knee drops to **6 outstanding, 1.4 GB/s**; past it, latency grows linearly with concurrency (QD 32 ≈ 1.7 µs). Page walks are the bottleneck because the core can only run a few at once. Same buffer, so the difference is purely translation.
- **Whole chip (MLC-style: probe chase plus 10 streaming threads with injected delay):**
  - Latency 123 → 179 ns as throughput rises to about **50 GB/s; L = 50 GB/s ÷ 64 B × 179 ns ≈ 141 lines in flight**.
  - Past the knee: +4 GB/s costs +10 ns.
  - Peak about 53 GB/s, against a theoretical 68 GB/s for 4 × DDR4-2133 (about 78%).
- **Diminishing returns:** quote the slope before vs after the knee.

## 7. Working-set sweep  → *Working-set/cache/TLB analysis (35)*
Figure `05_wss.png`.
- **Latency plateaus** (`wss_lat_summary.csv`):

  | Working set | Latency | Cycles |
  |---|---|---|
  | up to 32 KB | 0.96 ns | 4 |
  | to 512 KB | 2.9 ns | 12 |
  | 2–6 MB | 8.1–10.6 ns | 34–44 |
  | 8 MB | 42.7 ns | |
  | 16 MB | 103 ns | |
  | 1 GB (4K pages) | 229 ns | |

  Annotate L1/L2/L3-per-CCX/chip-L3 edges.
- **Sequential bandwidth:** about 65 GB/s (L1/L2) → 59 GB/s (L3) → 11.9 GB/s (DRAM, 1 thread).
- **Points:**
  - The L3 edge is at **8 MB, not 32 MB**: one core only allocates into its own CCX's L3.
  - The gradual rise inside L3 is partly TLB reach (L2 DTLB 6 MB with 4 KB pages).
  - DRAM latency keeps rising beyond 16 MB because page walks start missing the caches.

## 8. Cache-miss impact with counters  → *Working-set/cache/TLB analysis (35)*
Figure `06_cachemiss.png`; `cachemiss_counters_summary.csv`.
- **Kernel:** SAXPY, sequential vs random (through an index array).
- **Counters:** AMDuProfPcm counting mode on CPU 2, counting only during the kernel (the program prints READY after setup). Events: instructions, cycles, L1 refills by source (L2 / L3 / DRAM), L2 requests and misses, L1 and L2 DTLB misses.
- **Correlation:** runtime tracks where misses are served:
  - **L2 → L3 transition:** 512 KB–1 MB, where refills from L3 rise past 1 per element.
  - **L3 → DRAM transition:** 8–16 MB, where DRAM refills reach 1.4 per element at 16 MB and 2.6 at 1 GB.
- **Page walks appear as extra L2 misses:** L2 misses − (L3 + DRAM refills) ≈ L2 DTLB misses (panel c: 64 MB 0.89 vs 0.74; 256 MB 2.24 vs 2.22; 1 GB 2.59 vs 2.57). Each walk adds one L2 miss, the page-table load.
- **Sequential shows ~0 demand misses even at 1 GB.** Prefetchers fetch the lines before the loads need them, so demand-miss counters are misleading for streaming code. Runtime still rises from 0.37 to 0.60 ns/element.
- **AMAT reasoning:**
  - **Formula:** AMAT = t_L1 + m_L1·(t_L2 + m_L2·(t_L3 + m_L3·t_DRAM)), using the Section 4 latencies.
  - **Worked check at 16 MB random:** per element, 0.08 refills from L2, 1.01 from L3 and 1.40 from DRAM. Serialized, that's ≈ 0.08×2.9 + 1.01×9.1 + 1.40×121 ≈ 179 ns, but the measured time is **9.5 ns**.
  - **Interpretation:** about 19 misses overlap, consistent with the ~24-miss per-core limit in Section 6. Plain AMAT assumes no overlap; memory-level parallelism is why it overestimates.
- **Footprint caveat:** the "footprint" axis counts x + y only; random SAXPY also streams an index array (+50%), which shifts the transitions left.

## 9. TLB-miss impact and huge pages  → *Working-set/cache/TLB analysis (35)*
Figures `07a_tlb_pages.png`, `07b_tlb_locality.png`; `tlb_counters_summary.csv`.
- **Design:** the same node layout on 4 KB and on 2 MB pages, so the cache footprint is identical and the difference is translation.
- **Spanning pages** (one line per page):
  - L1 DTLB misses start once the span passes **256 KB** (64 entries × 4 KB).
  - L2 DTLB misses start between 32 and 64 MB, not at the nominal 6 MB (1536 × 4 KB). **Hypothesis:** Zen's PTE coalescing (4 adjacent pages per entry) gives ~24 MB effective reach.
  - **At 1 GB:** 214 ns/hop on 4 KB vs 123 ns on 2 MB, with 1.29 L2 DTLB misses per hop vs ~0. DRAM refills are the same (1.32 per hop), so the ~90 ns gap is the page walk.
- **Page locality** (1 MB of lines packed into fewer pages): 15.6 ns at 1 line/page → 7.0 ns at 64 lines/page on 4 KB pages, while 2 MB stays flat at ~8.4 ns. Packing data densely gives most of the huge-page benefit.
- **Oddity:** slightly more than 1 L1 DTLB miss per hop (1.2–1.3) with one load per hop. The event probably also counts retried lookups; say so rather than explain it away.

## 10. Benchmark pitfalls  → *AI-use transparency and pitfall analysis (15)*
Figure `08_pitfalls.png`.

| Pitfall | Naive | Correct |
|---|---|---|
| Cache reuse: "DRAM bandwidth" from a 4 MB buffer | 79.6 GB/s | 15.3 GB/s (1 GB, one pass) |
| Prefetching: "DRAM latency" from a sequential chain | 5.9 ns | 219.9 ns (random chain) |
| Cache reuse: "DRAM latency" from a 4 MB random chain | 9.1 ns | 219.9 ns |
| No real pinning: 8 threads on one CPU (the original `dram.cpp` bug) | 15.5 GB/s | 48.9 GB/s (1 per core) |
| SMT siblings (2 threads per core) | 26.7 GB/s | 48.9 GB/s |
| Chase encoding `i = a[i]` vs `p = *p` | 5.0 cycles (L1) | 4.0 cycles |
| Frequency ramp after idle | first sample 0.6–2.6 GHz | 4.2 GHz within ~1 ms |

- **Lead pitfall:** the `dram.cpp` affinity bug. It came from the original code and was found during this project; good material for both the AI note and the pitfall section.
- **Windows' own placement (45.6 GB/s) nearly matches explicit pinning.** Possibly because it spreads threads across all four CCXs; mention as a minor anomaly.
- **Frequency:** the ramp lasts only about 1 ms under the Ultimate Performance plan, so it only distorts benchmarks with no warm-up. That's why every run calibrates the clock and warms up first.

## 11. Anomalies and hypervisor comparison  → *Honest anomalies (required)*
- **Bimodal random SAXPY at 16–256 KB** (`09_alias_check.png`):
  - Each process runs at either about 0.7–0.9 or about 2.2 ns/element, with the same instruction and refill counts; the extra time is pure cycles.
  - **4K aliasing tested and rejected:** forcing (y − x) mod 4096 to 0/4/64/1024/2048 doesn't remove the two speeds.
  - Still open: something per-process (physical page placement, predictor state).
- **Hypervisor on vs off** (`10_hv_compare.png`):
  - All metrics changed by less than 8%, DRAM latency by under 1%. The hypervisor mainly mattered because it **blocked the hardware counters**.
  - Be honest that the initial guess (double address translation inflating DRAM latency) was wrong: the high 4 KB latency is page walks, as the 2 MB data shows.
- **Windows thread placement** vs explicit pinning (Section 10).
- **uProf sampling reports came out empty** and re-processing them crashed; switched to PCM counting mode. A methodology note, not a hardware result.

## 12. Limitations (½ page)  → *Report quality (15)*
- **Counters:** Windows has no `perf`, so they are counting-mode only, on one core, with multiplexed event groups (scaled estimates).
- **UMA memory mode:** local and remote DRAM are mixed; NUMA-local latency couldn't be isolated.
- **R/W DRAM traffic** is estimated (RFO factor), not measured with DF counters.
- **`cachemiss` footprint label** excludes the index array.
- **Single machine, Windows scheduler noise:** shown by the error bars; the bimodal anomaly remains unexplained.
- **Large pages:** require a special user right; the 1 GB 4 KB results include TLB effects by design.

## 13. Conclusion (¼ page)
Three or four takeaways, for example:
1. **Latency ladder:** about 4 / 12 / 34–38 / ~505 cycles.
2. **Bandwidth needs concurrency:** one core tops out at about 24 outstanding misses (~10 GB/s); the chip reaches about 50 GB/s at about 141 in flight.
3. **TLB reach:** past it, page walks can cost as much as the DRAM access itself; huge pages remove them.
4. **Validate the benchmark:** naive benchmarks overstate DRAM bandwidth by about 5× and understate its latency by about 37×.

## 14. AI-use note  → *AI-use transparency (15)*
**[YOU]** Be specific about what you did versus what the tool did:
- **Tools:** which ones you used (e.g., Claude Code) and for what (code, scripts, plotting, debugging, writing help).
- **Generated:** benchmark programs, run scripts, the PCM counter scripts, the plotting script.
- **Bugs found and fixed during validation:**
  - the `pin one_cpu` timing error (`inf`);
  - the original `dram.cpp` affinity bug;
  - a misleading knee definition, replaced by the 90%-of-peak rule;
  - a misleading cache-miss panel (L3 refills not subtracted).
- **Rejected or abandoned:** uProf sampling mode; the 4K-aliasing hypothesis.
- **Corrected claims:** the hypervisor explanation, and the "no frequency ramp" claim.
- **What you verified yourself:** sanity checks, re-runs, reading the disassembly/counters.

## Appendix
- **Reproduction:** `build.ps1`, then `run_all.ps1 -R 3`, `run_cachemiss_pcm.ps1`, `run_tlb_pcm.ps1`, `run_alias_check.ps1`, and `py -3.12 plots\make_plots.py`.
- **Data layout:** raw data in `data/raw/` (hypervisor off) and `data/hv_on/`; processed tables in `data/processed/`.
- **Large pages:** helper in `tools/grant_lock_memory.cpp`.
