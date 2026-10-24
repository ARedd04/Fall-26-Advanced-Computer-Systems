# run_cachemiss_pcm.ps1 - hardware counters for the cache/TLB-miss experiment (SAXPY)
#
# Uses AMDuProfPcm (counting mode, like "perf stat") on logical CPU 2, where
# cachemiss.exe runs. Each configuration is a separate "cachemiss.exe one" process;
# counting starts after its setup (see tools\pcm_common.ps1) and covers $window seconds
# of the SAXPY loop only. Counts are divided by the elements processed in that window
# (window / ns_per_elem from the program's own timing).
# Output: data\cachemiss_counters.csv (per-element values) + raw PCM folders in data\pcm\
#
#   powershell -ExecutionPolicy Bypass -File .\run_cachemiss_pcm.ps1
#   powershell -ExecutionPolicy Bypass -Command "& .\run_cachemiss_pcm.ps1 -R 1 -Sizes 64,1024"
param([int]$window = 4, [int]$R = 3,
      [int[]]$Sizes = @(16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 262144, 1048576),
      [string]$Out = "data\cachemiss_counters.csv")

. (Join-Path $PSScriptRoot "tools\pcm_common.ps1")
$exe  = Join-Path $PSScriptRoot "bin\cachemiss.exe"
$outd = Join-Path $PSScriptRoot "data\pcm"
New-Item -ItemType Directory -Force $outd | Out-Null

$rows = @()
foreach ($run in 1..$R) {
  foreach ($kb in $Sizes) {
    foreach ($pat in "seq", "rand") {
        $tag = "saxpy_${kb}KB_${pat}_r$run"
        $m = Invoke-PcmMeasurement -Exe $exe -ArgLine "one $kb $pat $($window + 2)" -Window $window -Tag $tag -OutDir $outd
        if (-not $m) { continue }
        $ns = [double]$m["ns_per_elem"]
        $head = [ordered]@{ run = $run; footprint_KB = $kb; pattern = $pat; ns_per_elem = $ns
                            xy_offset_mod4096 = $m["xy_offset_mod4096"] }
        $row = ConvertTo-PerUnitRow -Head $head -m $m -units ($window * 1e9 / $ns) -suffix "elem"
        $rows += $row
        Write-Host ("{0,-26} ns/elem {1,7:N2}  L2miss/elem {2,7:N3}  DRAMrefill/elem {3,7:N3}  L2TLBmiss/elem {4,7:N3}  xy_off {5}" -f `
            $tag, $ns, $row.l2_misses_from_l1d_per_elem, $row.l1d_refills_from_dram_g1_per_elem, $row.l2_dtlb_misses_per_elem, $head.xy_offset_mod4096)
    }
  }
}
$rows | Export-Csv -NoTypeInformation -Encoding ascii (Join-Path $PSScriptRoot $Out)
