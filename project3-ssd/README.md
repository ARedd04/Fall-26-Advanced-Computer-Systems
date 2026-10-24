# Project 3: SSD Performance Profiling

FIO-based characterization of a Samsung 970 EVO Plus 1 TB (NVMe, PCIe 3.0 x4) on Windows 10. `run_all.ps1` generates every fio job file into `configs\`, runs each job, and saves fio's JSON output to `data\raw\<section>\`. `plots\make_plots.py` parses that output into `data\processed\` and draws `plots\`.

## Data safety

- **One test file:** all I/O goes to a single 64 GiB test file, `D:\ssdbench\fio_test.dat`, on the second SSD (D:). Windows (C:) is on a different drive. NTFS keeps files isolated, so jobs cannot touch any other file on D:.
- **Checks before every fio call:** `run_all.ps1` refuses to run a job unless it names exactly that file, targets no raw device (`\\.\PhysicalDrive…`), and uses `direct=1`. The one exception is the buffered-I/O pitfall job, which only reads.
- **Path check:** a test path outside `D:\ssdbench\` is rejected before anything runs.
- **Free space:** the test file is created only if D: keeps at least 100 GB free afterwards.
- **Cleanup:** when the project is done, run `Remove-Item -Recurse D:\ssdbench` to reclaim the 64 GB.

## Required experiment → section → figure

| Requirement | Section | Figure |
|---|---|---|
| Zero-queue baselines (QD=1, 4K random R/W, 128K sequential R/W, p95/p99) | `qd1` | `01_qd1_latency` |
| Block-size sweep (random and sequential, throughput and latency from the same runs) | `bs` | `02_blocksize` |
| Read/write mix (100/0, 70/30, 50/50, 0/100) | `mix` | `03_rwmix` |
| QD/parallelism sweep, knee, Little's Law | `qd` | `04_qd_knee` (+ `littles_law.csv`) |
| Tail latency at mid and near-knee QD (p50–p99.99) | `tail` | `05_tail_latency` |
| Working-set / LBA range | `lba` | `06a_lba_range` |
| Device state: burst vs steady state | `state` | `06b_device_state` |
| Misleading setup (buffered I/O, wrong effective QD) | `pitfall` | `07_pitfalls` |
| Data pattern: incompressible vs compressible | `pattern` | `08_data_pattern` |

On the first run, a sequential fill of the whole test file (`prep`) writes data to every block. Reading blocks that were never written returns zeros without touching the flash, which would overstate read speed.

## Run

```powershell
powershell -ExecutionPolicy Bypass -File .\run_all.ps1            # ~75 min; Admin shell also logs SSD temperature
powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Quick     # smoke test, 3 s jobs
powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Only "qd,tail"
py -3.12 plots\make_plots.py
```

- **Tools:** fio 3.43 (`winget install fio.fio`, `windowsaio` engine) and Python 3.12 with matplotlib/numpy.
- **Environment record:** `data\raw\env.txt` holds drive model/firmware, file system, power plan, CPU and settings. `data\raw\smart.csv` holds temperature and wear per section, which needs an Administrator shell.
- **Same conventions as Projects 1 and 2:**
  - 3 runs per configuration
  - plots show the median, with min–max error bars
  - fio threads pinned to physical cores 1–8
  - the knee is the first point reaching 90% of peak throughput
