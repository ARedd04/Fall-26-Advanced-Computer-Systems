# run_all.ps1 - collects the data for every required Project 1 experiment.
#
#   powershell -ExecutionPolicy Bypass -File .\build.ps1
#   powershell -ExecutionPolicy Bypass -File .\run_all.ps1
#   powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Only "tail,peak"   # subset
#   powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Quick              # smoke test
#
# Parameters:
#   -Cpu     logical CPU to pin to (default 2; its SMT sibling 3 should stay idle)
#   -Runs    repeats of every configuration, each a fresh process (default 3)
#   -Trials  timed trials per process (default 15)
#   -Only    comma-separated experiments (default: verify,baseline,align,tail,stride,peak)
#   -Out     output folder (default data\raw)
#   -Quick   1 run, 5 trials, 4 sizes
#
# Output (one CSV per experiment, one row per configuration and run):
#   baseline.csv  scalar vs auto vs native vs native256, 3 kernels (+4 dot variants),
#                 f32/f64/i32, footprint 4 KiB .. 256 MiB  -> speedup, locality sweep,
#                 data-type comparison, memory-bound compression, roofline points
#   align.csv     array start shifted 0..15 elements (both arrays, or only x / only y)
#   tail.csv      N = 1..64 and 1024..1056: vector-width remainders, prologue/epilogue
#   stride.csv    saxpy stride 1..16 and gather (sequential / random index), L1 and DRAM
#   peak.csv      peak FLOP/s per build (roofline ceiling)
#   env.txt       machine, compiler, flags, measured clock before/after, power plan
# plus reports\ (verify): vectorization reports, assembly, reports\vector_summary.csv
param([int]$Cpu = 2, [int]$Runs = 3, [int]$Trials = 15,
      [string]$Only = "verify,baseline,align,tail,stride,peak",
      [string]$Out = "data\raw", [switch]$Quick)
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$builds = @("scalar", "auto", "native", "native256")
$sizesKiB = @(4, 8, 16, 24, 32, 48, 64, 128, 256, 384, 512, 768, 1024, 2048, 4096, 6144, 8192,
              12288, 16384, 32768, 65536, 131072, 262144)
if ($Quick) { $Runs = 1; $Trials = 5; $sizesKiB = @(16, 256, 4096, 65536) }
$want = $Only -split "," | ForEach-Object { $_.Trim() }

function Exe($build) { Join-Path $PSScriptRoot "bin\bench_$build.exe" }
foreach ($b in $builds) {
    if (-not (Test-Path (Exe $b))) { throw "missing bin\bench_$b.exe - run build.ps1 first" }
}

New-Item -ItemType Directory -Force $Out | Out-Null
$ghz = (& (Exe native) --calib --cpu $Cpu).Trim()
Write-Host "measured clock: $ghz GHz (cycles/element use this value)"

# ---- Environment (methodology requirement) -----------------------------------------
$cpuInfo = Get-CimInstance Win32_Processor
$env = @(
    "date: $(Get-Date -Format o)"
    "os: $((Get-CimInstance Win32_OperatingSystem).Caption) $((Get-CimInstance Win32_OperatingSystem).Version)"
    "cpu: $($cpuInfo.Name.Trim()), $($cpuInfo.NumberOfCores) cores / $($cpuInfo.NumberOfLogicalProcessors) threads"
    "native target: $((& C:\msys64\ucrt64\bin\g++.exe -march=native -Q --help=target | Select-String '^\s+-march=') -replace '\s+', ' ')"
    "pinned cpu: $Cpu (SMT sibling $($Cpu -bxor 1) left idle), HIGH priority"
    "runs: $Runs fresh processes x $Trials trials, batches >= 2 ms"
    "power plan: $((powercfg /getactivescheme) -join ' ')"
    "hypervisor present: $((Get-CimInstance Win32_ComputerSystem).HypervisorPresent)"
    "measured clock at start: $ghz GHz"
)
if (Test-Path bin\compiler.txt) { $env += Get-Content bin\compiler.txt }
$env | Set-Content -Encoding ascii (Join-Path $Out "env.txt")

# Appends one CSV row (with header if the file is new)
function Row([string]$file, [string]$build, [int]$run, [string[]]$a) {
    $hdr = @()
    if (-not (Test-Path $file) -or (Get-Item $file).Length -eq 0) { $hdr = @("--header") }
    $line = & (Exe $build) --cpu $Cpu --ghz $ghz --trials $Trials --tag $build --run $run @hdr @a
    if ($LASTEXITCODE -ne 0) { Write-Warning "failed: $build $a"; return }
    Add-Content -Path $file -Value $line -Encoding ascii
}
function Fresh([string]$name) {
    $p = Join-Path $Out $name
    Remove-Item $p -ErrorAction SilentlyContinue
    Write-Host "== $name"
    return $p
}
# dot needs --variant; the other kernels have none
function KArgs($spec) { if ($spec.v) { @("--kernel", $spec.k, "--variant", $spec.v) } else { @("--kernel", $spec.k) } }
function Spec($k, $v = $null) { @{ k = $k; v = $v } }

# ---- Vectorization verification ----------------------------------------------------
if ($want -contains "verify") {
    Write-Host "== verify (reports\)"
    & (Join-Path $PSScriptRoot "build.ps1") -Verify
}

# ---- 1. Baseline / locality / data type ------------------------------------------
# Kernels: saxpy, mul, and the dot product in 4 forms (strict = what plain code gets;
# simd/simd_acc = reassociation allowed via omp simd; multiacc = hand-split chains).
if ($want -contains "baseline") {
    $f = Fresh "baseline.csv"
    $specs = @((Spec saxpy), (Spec mul), (Spec dot strict), (Spec dot simd), (Spec dot simd_acc), (Spec dot multiacc))
    foreach ($run in 1..$Runs) {
        foreach ($b in $builds) {
            foreach ($s in $specs) {
                foreach ($dt in "f32", "f64", "i32") {
                    foreach ($kib in $sizesKiB) {
                        Row $f $b $run ((KArgs $s) + @("--dtype", $dt, "--kib", $kib))
                    }
                }
            }
            Write-Host "   run $run build $b done"
        }
    }
}

# ---- 2. Alignment ------------------------------------------------------------------
# Offsets in elements (f32: 4 B each). 0 = 64 B aligned; 4 = 16 B aligned (SSE ok);
# 8 = 32 B aligned (AVX ok) but not cache-line aligned; 1/2/15 = not vector aligned.
# "x only"/"y only" shifts make the two arrays mutually misaligned, so no prologue
# can align both.
if ($want -contains "align") {
    $f = Fresh "align.csv"
    foreach ($run in 1..$Runs) {
        foreach ($b in "auto", "native", "native256") {
            foreach ($s in @((Spec saxpy), (Spec mul), (Spec dot simd_acc))) {
                foreach ($kib in 16, 256, 65536) {
                    $base = (KArgs $s) + @("--dtype", "f32", "--kib", $kib)
                    foreach ($off in 0, 1, 2, 4, 8, 15) {
                        Row $f $b $run ($base + @("--offset-x", $off, "--offset-y", $off))
                    }
                    Row $f $b $run ($base + @("--offset-x", 0, "--offset-y", 1))
                    Row $f $b $run ($base + @("--offset-x", 1, "--offset-y", 0))
                }
            }
        }
    }
}

# ---- 3. Tail handling ----------------------------------------------------------------
# Every N from 1 to 64 (crosses vector widths 4 and 8 many times), then 1024..1056.
if ($want -contains "tail") {
    $f = Fresh "tail.csv"
    $ns = @(1..64) + @(1024..1056)
    foreach ($run in 1..$Runs) {
        foreach ($b in $builds) {
            foreach ($s in @((Spec saxpy), (Spec mul), (Spec dot simd_acc))) {
                foreach ($n in $ns) {
                    Row $f $b $run ((KArgs $s) + @("--dtype", "f32", "--n", $n))
                }
            }
        }
    }
}

# ---- 4. Stride / gather ----------------------------------------------------------------
# Fixed work (N elements updated), so time differences come from the access pattern.
# N = 4096: cache-resident at small strides; N = 2M: DRAM. Stride 16 f32 = 64 B = one
# element per cache line.
if ($want -contains "stride") {
    $f = Fresh "stride.csv"
    foreach ($run in 1..$Runs) {
        foreach ($b in $builds) {
            foreach ($dt in "f32", "f64") {
                foreach ($n in 4096, 2097152) {
                    foreach ($st in 1, 2, 4, 8, 16) {
                        Row $f $b $run @("--kernel", "saxpy_stride", "--stride", $st, "--dtype", $dt, "--n", $n)
                    }
                    foreach ($g in "seq", "rand") {
                        Row $f $b $run @("--kernel", "saxpy_gather", "--gather", $g, "--dtype", $dt, "--n", $n)
                    }
                }
            }
        }
    }
}

# ---- 5. Peak FLOP/s (roofline ceiling) ---------------------------------------------
if ($want -contains "peak") {
    $f = Fresh "peak.csv"
    foreach ($run in 1..$Runs) {
        foreach ($b in $builds) {
            foreach ($dt in "f32", "f64") { Row $f $b $run @("--kernel", "peak", "--dtype", $dt) }
        }
    }
}

$ghzEnd = (& (Exe native) --calib --cpu $Cpu).Trim()
Add-Content -Encoding ascii (Join-Path $Out "env.txt") "measured clock at end: $ghzEnd GHz"
Write-Host "done; clock start $ghz GHz, end $ghzEnd GHz. Data in $Out\"
