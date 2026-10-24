# run_tlb_pcm.ps1 - hardware counters for the TLB experiment (4 KB vs 2 MB pages)
#
# Same node layout as "tlb.exe pages" (one node per 4 KB page at a random line, random
# visit order), run as separate "tlb.exe one" processes on 4 KB and on 2 MB pages.
# AMDuProfPcm counts on CPU 2 during the chase loop only (tools\pcm_common.ps1); counts
# are divided by the hops made in the counting window. With 2 MB pages the cache
# footprint is identical, so the counter difference is the translation work.
# Output: data\raw\tlb_counters.csv (per-hop values) + raw PCM folders in data\pcm\
#
#   powershell -ExecutionPolicy Bypass -File .\run_tlb_pcm.ps1
param([int]$window = 4, [int]$R = 3,
      [int[]]$Pages = @(16, 64, 128, 512, 1536, 4096, 8192, 16384, 65536, 262144),
      [string]$Out = "data\raw\tlb_counters.csv")

. (Join-Path $PSScriptRoot "tools\pcm_common.ps1")
$exe  = Join-Path $PSScriptRoot "bin\tlb.exe"
$outd = Join-Path $PSScriptRoot "data\pcm"
New-Item -ItemType Directory -Force $outd | Out-Null

$rows = @()
foreach ($run in 1..$R) {
  foreach ($pg in $Pages) {
    foreach ($page in "4k", "2m") {
        $tag = "tlb_${pg}pages_${page}_r$run"
        $m = Invoke-PcmMeasurement -Exe $exe -ArgLine "one $pg 1 $page $($window + 2)" -Window $window -Tag $tag -OutDir $outd
        if (-not $m) { continue }
        $ns = [double]$m["ns_per_hop"]
        $head = [ordered]@{ run = $run; page = $m["page"]; pages_4K = $pg; span_KB = $m["span_KB"]; ns_per_hop = $ns }
        $row = ConvertTo-PerUnitRow -Head $head -m $m -units ($window * 1e9 / $ns) -suffix "hop"
        $rows += $row
        Write-Host ("{0,-24} ns/hop {1,8:N2}  L1TLBmiss/hop {2,6:N3}  L2TLBmiss/hop {3,6:N3}  DRAMrefill/hop {4,6:N3}" -f `
            $tag, $ns, $row.l1_dtlb_misses_per_hop, $row.l2_dtlb_misses_per_hop, $row.l1d_refills_from_dram_g1_per_hop)
    }
  }
}
$rows | Export-Csv -NoTypeInformation -Encoding ascii (Join-Path $PSScriptRoot $Out)
