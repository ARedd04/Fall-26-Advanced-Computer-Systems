# run_all.ps1 - collects the data for every required Project 3 (SSD profiling) experiment.
#
#   powershell -ExecutionPolicy Bypass -File .\run_all.ps1                     # everything (~75 min)
#   powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Only "qd1,qd"      # subset
#   powershell -ExecutionPolicy Bypass -File .\run_all.ps1 -Quick              # smoke test
# Run from an Administrator PowerShell to also log SSD temperature / wear (SMART).
#
# ---- DATA SAFETY -------------------------------------------------------------------
# Every job reads and writes ONLY inside one test file, $TestFile (default
# D:\ssdbench\fio_test.dat). Files are isolated by NTFS, so other files on D: cannot be
# touched. Invoke-Fio refuses to start fio unless the generated job file
#   - names exactly that test file (no other filename=, no raw devices / \\.\ paths),
#   - uses direct=1 (O_DIRECT-style, bypasses the OS cache), except the one buffered-I/O
#     pitfall job, which is explicitly marked and only READS.
# The test file is created only if D: keeps at least -MinFreeGB free afterwards.
# Delete D:\ssdbench when the project is finished to give the space back.
# -------------------------------------------------------------------------------------
#
# Parameters:
#   -TestFile   test file (must be inside D:\ssdbench\)      -SizeGB    its size (default 64)
#   -Runs       repeats per configuration (default 3)          -Runtime   seconds per job (20)
#   -Ramp       warm-up seconds per job, not measured (3)      -MinFreeGB free space kept on D: (100)
#   -MidQd / -KneeQd   queue depths for the tail-latency section (16 / 64)
#   -Only       comma-separated sections (default: all)  -Quick  1 run, 3 s jobs
#   -Refill     redo the 64 GiB sequential fill even though the test file already exists
#
# Sections (data\raw\<section>\*.json = fio JSON output, one file per job and run):
#   prep     (automatic when the test file is missing or short, or with -Refill) sequential fill
#            of the whole test file, so every LBA holds data: reading never-written LBAs returns
#            zeros from the FTL without touching flash
#   qd1      QD=1 latency: 4K random read/write, 128K sequential read/write
#   bs       block-size sweep 4K..256K random, 4K..1M sequential, reads, 4 jobs x QD 8
#   mix      read/write mix 100/0, 70/30, 50/50, 0/100 at 4K random, 4 jobs x QD 8
#   qd       4K random read, total outstanding I/Os 1..256 spread over up to 8 jobs (main
#            throughput-latency curve), plus a 1-job iodepth sweep for comparison
#   tail     longer runs at mid-QD and near-knee QD (total outstanding) for p99/p99.9/p99.99
#   lba      LBA range 1/4/16/64 GiB, 4K random read, 4 jobs x QD 8
# A single fio job (one submission thread) saturates near 65-70K 4K IOPS on this host, well
# below the SSD, so every high-concurrency test uses several jobs (one per physical core).
#   pattern  incompressible vs 50% compressible vs zero data, 128K sequential write
#   pitfall  buffered vs direct I/O; sync engine with iodepth=32 (effective QD 1)
#   state    burst vs steady state: 90 s sequential write and 120 s random write with
#            per-second bandwidth logs (SLC-cache exhaustion, garbage collection)
param([string]$TestFile = "D:\ssdbench\fio_test.dat", [int]$SizeGB = 64,
      [int]$Runs = 3, [int]$Runtime = 20, [int]$Ramp = 3, [int]$MinFreeGB = 100,
      [int]$MidQd = 16, [int]$KneeQd = 64,
      [string]$Only = "qd1,bs,qd,tail,lba,mix,pattern,pitfall,state", [switch]$Quick, [switch]$Refill)
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$Fio = "C:\Program Files\fio\fio.exe"
$AllowedDir = "D:\ssdbench"
if ($Quick) { $Runs = 1; $Runtime = 3; $Ramp = 1 }
$want = $Only -split "," | ForEach-Object { $_.Trim() }

# ---- Safety: the test file must live in D:\ssdbench\ --------------------------------
$full = [IO.Path]::GetFullPath($TestFile)
if (-not $full.StartsWith($AllowedDir + "\", [StringComparison]::OrdinalIgnoreCase) -or $full -match 'PhysicalDrive|^\\\\') {
    throw "Refusing to run: test file must be inside $AllowedDir\ (got $full)"
}
$FioName = $full -replace ':', '\:'          # fio uses ':' as a separator; escape the drive colon
$drive = $full.Substring(0, 1)

# ---- Job generation and the guarded fio call -------------------------------------------
# Global options shared by every job. A job's own options override these; a value of $null
# writes a bare flag (e.g. "thread").
function Base-Options {
    [ordered]@{
        ioengine = "windowsaio"; direct = 1; thread = $null; filename = $FioName; size = "${SizeGB}g"
        time_based = $null; runtime = $Runtime; ramp_time = $Ramp; group_reporting = $null
        norandommap = $null; randrepeat = 0; refill_buffers = $null
        percentile_list = "50:95:99:99.9:99.99"
        # fio threads on physical cores 1..8 (logical 2,4,..), one per job; core 0 keeps interrupts
        cpus_allowed = "2,4,6,8,10,12,14,16"; cpus_allowed_policy = "split"
    }
}

function Job-Text([string]$name, [hashtable]$opts) {
    $o = Base-Options
    foreach ($k in $opts.Keys) { if ($opts[$k] -eq "-") { $o.Remove($k) } else { $o[$k] = $opts[$k] } }
    $lines = @("[global]")
    foreach ($k in $o.Keys) { if ($null -eq $o[$k]) { $lines += $k } else { $lines += "$k=$($o[$k])" } }
    $lines += "", "[$name]"
    return ($lines -join "`n") + "`n"
}

# Writes configs\<section>\<name>.fio, checks it, runs fio, saves data\raw\<section>\<name>_r<run>.json
function Invoke-Fio([string]$section, [string]$name, [int]$run, [hashtable]$opts, [switch]$AllowBuffered) {
    $text = Job-Text $name $opts
    # --- safety checks on the exact text fio will read ---
    # @() keeps this a list: with one match PowerShell would return a bare string, and [0] a character
    $files = @([regex]::Matches($text, '(?m)^\s*filename\s*=\s*(.+)$') | ForEach-Object { $_.Groups[1].Value.Trim() })
    if ($files.Count -ne 1 -or $files[0] -ne $FioName) { throw "SAFETY: job '$name' targets '$($files -join ', ')', not $FioName" }
    if ($text -match '(?im)PhysicalDrive|\\\\\.\\|^\s*(directory|opendir|filename_format)\s*=') { throw "SAFETY: job '$name' names a device or directory" }
    if ($text -notmatch '(?m)^direct=1$') {
        if (-not $AllowBuffered -or $text -match '(?m)^rw=.*(write|trim|rw)') { throw "SAFETY: job '$name' is not direct I/O" }
    }
    # --- run ---
    $cfgDir = Join-Path "configs" $section; $rawDir = Join-Path "data\raw" $section
    New-Item -ItemType Directory -Force $cfgDir, $rawDir | Out-Null
    $cfg = Join-Path $cfgDir "$name.fio"
    Set-Content -Encoding ascii -NoNewline -Path $cfg -Value $text
    $out = Join-Path $rawDir "${name}_r$run.json"
    & $Fio --output-format=json --output="$out" $cfg | Out-Null
    if ($LASTEXITCODE -ne 0) { Write-Warning "fio failed: $section/$name run $run" }
    else { Write-Host ("   {0,-8} {1,-28} run {2}" -f $section, $name, $run) }
}

function Want([string]$s) { $want -contains $s }

# One fio job (one submission thread) tops out around 65-70K IOPS with windowsaio, far below
# this SSD's limit, so deeper queues are spread over up to 8 jobs (one per physical core).
# T = total outstanding I/Os = numjobs x iodepth.
function Spread([int]$T) { $nj = [math]::Min(8, $T); @{ numjobs = $nj; iodepth = [int]($T / $nj) } }
function Merge([hashtable]$a, [hashtable]$b) { $r = @{}; foreach ($h in $a, $b) { foreach ($k in $h.Keys) { $r[$k] = $h[$k] } }; $r }
function Rest([int]$s, [string]$why) { if (-not $Quick) { Write-Host "   idle $s s ($why)"; Start-Sleep -Seconds $s } }

# SSD temperature / wear (needs admin); one row per section into data\raw\smart.csv
$disk = Get-Partition -DriveLetter $drive | Get-Disk
function Log-Smart([string]$when) {
    $t = $null; $w = $null
    try {
        $c = Get-PhysicalDisk | Where-Object DeviceId -eq "$($disk.Number)" | Get-StorageReliabilityCounter -ErrorAction Stop
        $t = $c.Temperature; $w = $c.Wear
    } catch { }
    $line = "{0},{1},{2},{3}" -f (Get-Date -Format o), $when, $t, $w
    if (-not (Test-Path data\raw\smart.csv)) { "time,when,temperature_C,wear_pct" | Set-Content -Encoding ascii data\raw\smart.csv }
    Add-Content -Encoding ascii data\raw\smart.csv $line
}

# ---- Environment (methodology requirement) ----------------------------------------
New-Item -ItemType Directory -Force data\raw | Out-Null
$pd = Get-PhysicalDisk | Where-Object DeviceId -eq "$($disk.Number)"
$vol = Get-Volume -DriveLetter $drive
@(
    "date: $(Get-Date -Format o)"
    "fio: $(& $Fio --version)"
    "os: $((Get-CimInstance Win32_OperatingSystem).Caption) $((Get-CimInstance Win32_OperatingSystem).Version)"
    "cpu: $((Get-CimInstance Win32_Processor).Name.Trim())"
    "ssd: $($pd.FriendlyName), firmware $($pd.FirmwareVersion), bus $($pd.BusType), $([math]::Round($pd.Size/1GB)) GB, disk $($disk.Number)"
    "volume: ${drive}: $($vol.FileSystem), cluster $($vol.AllocationUnitSize) B, free $([math]::Round($vol.SizeRemaining/1GB,1)) of $([math]::Round($vol.Size/1GB,1)) GB"
    "test file: $full, $SizeGB GiB (filesystem file, direct I/O, windowsaio engine)"
    "jobs: runtime $Runtime s + ramp $Ramp s, $Runs runs; fio threads pinned to cores 1..8"
    "power plan: $((powercfg /getactivescheme) -join ' ')"
    "hypervisor present: $((Get-CimInstance Win32_ComputerSystem).HypervisorPresent)"
    "admin (SMART available): $(([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))"
) | Set-Content -Encoding ascii data\raw\env.txt
Log-Smart "start"

# ---- prep: create + fill the test file ------------------------------------------------
if ($Refill -or -not (Test-Path $full) -or ((Get-Item $full).Length -lt $SizeGB * 1GB)) {
    $have = if (Test-Path $full) { (Get-Item $full).Length } else { 0 }
    $freeAfter = ($vol.SizeRemaining - ($SizeGB * 1GB - $have)) / 1GB
    if ($freeAfter -lt $MinFreeGB) {
        throw "Refusing to create the test file: ${drive}: would have only $([math]::Round($freeAfter,1)) GB free (minimum $MinFreeGB GB)"
    }
    New-Item -ItemType Directory -Force (Split-Path $full) | Out-Null
    Write-Host "== prep: sequential fill of $SizeGB GiB (also the preconditioning pass)"
    Invoke-Fio prep "fill_seq_1m" 1 @{ rw = "write"; bs = "1m"; iodepth = 32; time_based = "-"; runtime = "-"; ramp_time = "-" }
    Rest 60 "let the SLC cache flush after the fill"
    Log-Smart "after prep"
}

# ---- 1. QD=1 latency baselines -----------------------------------------------------------
if (Want "qd1") {
    Write-Host "== qd1"
    foreach ($run in 1..$Runs) {
        Invoke-Fio qd1 "randread_4k_qd1"  $run @{ rw = "randread";  bs = "4k";   iodepth = 1 }
        Invoke-Fio qd1 "randwrite_4k_qd1" $run @{ rw = "randwrite"; bs = "4k";   iodepth = 1 }
        Invoke-Fio qd1 "seqread_128k_qd1"  $run @{ rw = "read";  bs = "128k"; iodepth = 1 }
        Invoke-Fio qd1 "seqwrite_128k_qd1" $run @{ rw = "write"; bs = "128k"; iodepth = 1 }
    }
    Log-Smart "after qd1"
}

# ---- 2. Block-size sweep (reads; throughput and latency from the same runs) -------------
if (Want "bs") {
    Write-Host "== bs"
    foreach ($run in 1..$Runs) {
        # 4 jobs x QD 8 (32 outstanding): small blocks are not limited by one submission thread
        foreach ($bs in "4k", "16k", "32k", "64k", "128k", "256k") {
            Invoke-Fio bs "randread_${bs}_4x8" $run @{ rw = "randread"; bs = $bs; numjobs = 4; iodepth = 8 }
        }
        # sequential: each job reads its own region (offset_increment) so the streams stay sequential
        foreach ($bs in "4k", "16k", "32k", "64k", "128k", "256k", "512k", "1m") {
            Invoke-Fio bs "seqread_${bs}_4x8" $run @{ rw = "read"; bs = $bs; numjobs = 4; iodepth = 8; size = "$([int]($SizeGB / 4))g"
                                                      offset_increment = "$([int]($SizeGB / 4))g" }
        }
    }
    Log-Smart "after bs"
}

# ---- 4. Queue depth / parallelism sweep (4K random read) ---------------------------------
if (Want "qd") {
    Write-Host "== qd"
    foreach ($run in 1..$Runs) {
        # main curve: total outstanding I/Os T spread over up to 8 jobs
        foreach ($T in 1, 2, 4, 8, 16, 32, 64, 128, 256) {
            Invoke-Fio qd "randread_4k_T$T" $run (Merge @{ rw = "randread"; bs = "4k" } (Spread $T))
        }
        # comparison: one job only -> limited by its single submission thread, not the SSD
        foreach ($qd in 1, 4, 16, 64, 256) {
            Invoke-Fio qd "randread_4k_1job_qd$qd" $run @{ rw = "randread"; bs = "4k"; iodepth = $qd }
        }
    }
    Log-Smart "after qd"
}

# ---- 5. Tail latency at mid-QD and near the knee -------------------------------------------
if (Want "tail") {
    Write-Host "== tail (QD $MidQd and $KneeQd, $(3 * $Runtime) s each)"
    foreach ($run in 1..$Runs) {
        foreach ($T in $MidQd, $KneeQd) {
            Invoke-Fio tail "randread_4k_T$T" $run (Merge @{ rw = "randread"; bs = "4k"; runtime = 3 * $Runtime } (Spread $T))
        }
    }
    Log-Smart "after tail"
}

# ---- 6a. LBA range / working set -------------------------------------------------------------
if (Want "lba") {
    Write-Host "== lba"
    foreach ($run in 1..$Runs) {
        foreach ($g in 1, 4, 16, $SizeGB) {
            Invoke-Fio lba "randread_4k_4x8_${g}g" $run @{ rw = "randread"; bs = "4k"; numjobs = 4; iodepth = 8; size = "${g}g" }
        }
    }
    Log-Smart "after lba"
}

# ---- 3. Read/write mix (4K random, QD 32) ------------------------------------------------------
if (Want "mix") {
    Write-Host "== mix"
    foreach ($run in 1..$Runs) {
        foreach ($r in 100, 70, 50, 0) {
            Invoke-Fio mix "randrw_4k_4x8_r$r" $run @{ rw = "randrw"; rwmixread = $r; bs = "4k"; numjobs = 4; iodepth = 8 }
        }
    }
    Log-Smart "after mix"
}

# ---- Data pattern: does the controller benefit from compressible data? ---------------------
if (Want "pattern") {
    Write-Host "== pattern"
    Rest 30 "SLC cache recovery"
    foreach ($run in 1..$Runs) {
        Invoke-Fio pattern "seqwrite_128k_incompressible" $run @{ rw = "write"; bs = "128k"; iodepth = 32 }
        Invoke-Fio pattern "seqwrite_128k_compress50" $run @{ rw = "write"; bs = "128k"; iodepth = 32; refill_buffers = "-"
                                                                 buffer_compress_percentage = 50; buffer_compress_chunk = 4096 }
        Invoke-Fio pattern "seqwrite_128k_zeros" $run @{ rw = "write"; bs = "128k"; iodepth = 32; refill_buffers = "-"; zero_buffers = $null }
    }
    Log-Smart "after pattern"
}

# ---- 7. Misleading setups ----------------------------------------------------------------------
# (a) Buffered I/O: direct=0 on a 1 GiB region, which fits in the OS file cache -> the cache is
#     measured, not the SSD. (b) sync engine with iodepth=32: a synchronous engine has one I/O in
#     flight per job, so the run is really QD 1 whatever iodepth says. fio on Windows rejects sync
#     engines with direct=1, so this job is buffered; it reads randomly across the full 64 GiB, where
#     the OS cache holds only a tiny fraction, and is compared with real QD 1 and QD 32 runs.
if (Want "pitfall") {
    Write-Host "== pitfall"
    foreach ($run in 1..$Runs) {
        Invoke-Fio pitfall "randread_4k_qd1_1g_direct"   $run @{ rw = "randread"; bs = "4k"; iodepth = 1; size = "1g" }
        # unmeasured: one buffered sequential pass pulls the 1 GiB region into the OS file cache
        Invoke-Fio pitfall "warm_cache_1g_buffered" $run @{ rw = "read"; bs = "1m"; iodepth = 1; size = "1g"; direct = 0
                                                             time_based = "-"; runtime = "-"; ramp_time = "-" } -AllowBuffered
        Invoke-Fio pitfall "randread_4k_qd1_1g_buffered" $run @{ rw = "randread"; bs = "4k"; iodepth = 1; size = "1g"; direct = 0 } -AllowBuffered
        Invoke-Fio pitfall "randread_4k_windowsaio_qd1"  $run @{ rw = "randread"; bs = "4k"; iodepth = 1 }
        Invoke-Fio pitfall "randread_4k_windowsaio_qd32" $run @{ rw = "randread"; bs = "4k"; iodepth = 32 }
        Invoke-Fio pitfall "randread_4k_sync_qd32"       $run @{ rw = "randread"; bs = "4k"; iodepth = 32; ioengine = "sync"; direct = 0 } -AllowBuffered
    }
    Log-Smart "after pitfall"
}

# ---- 6b. Device state: burst vs steady state ----------------------------------------------------
# Starts after an idle period so the SLC write cache is empty; per-second bandwidth/IOPS logs show
# the drop when the cache fills (sequential) and garbage-collection effects (random).
if (Want "state") {
    Write-Host "== state"
    $dur = if ($Quick) { 10 } else { 90 }
    Rest 120 "empty the SLC cache before the burst test"
    Log-Smart "before state"
    New-Item -ItemType Directory -Force data\raw\state | Out-Null
    Invoke-Fio state "seqwrite_128k_qd32_long" 1 @{ rw = "write"; bs = "128k"; iodepth = 32; runtime = $dur; ramp_time = 0
                                                    write_bw_log = "data/raw/state/seqwrite"; log_avg_msec = 1000 }
    Log-Smart "after long seq write"
    Rest 120 "SLC cache recovery"
    # 4 jobs x QD 8: one job alone is host-limited at 4K. Each job writes its own log file.
    Invoke-Fio state "randwrite_4k_4x8_long" 1 @{ rw = "randwrite"; bs = "4k"; numjobs = 4; iodepth = 8; runtime = [int]($dur * 4 / 3); ramp_time = 0
                                                  write_iops_log = "data/raw/state/randwrite"; write_lat_log = "data/raw/state/randwrite"; log_avg_msec = 1000 }
    Log-Smart "after long rand write"
}

Log-Smart "end"
Write-Host "done. Raw fio output in data\raw\, job files in configs\, environment in data\raw\env.txt"
Write-Host "When the project is finished: Remove-Item -Recurse $AllowedDir  (frees $SizeGB GB on ${drive}:)"
