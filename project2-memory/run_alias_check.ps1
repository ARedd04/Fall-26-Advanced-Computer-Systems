# run_alias_check.ps1 - tests the 4K-aliasing explanation for the bimodal small random SAXPY
#
# Observation (cachemiss_counters.csv): random SAXPY at 16-256 KB runs either ~0.7-0.9 or
# ~2.2 ns/elem in different processes, with the same instruction and refill counts.
# Hypothesis: it depends on where the heap places x and y, i.e. on (y - x) mod 4096.
#
# Test: many fresh processes per setting, each running "cachemiss.exe one":
#   heap      normal vectors; the program reports the offset it happened to get
#   forced N  x and y in one block with (y - x) mod 4096 = N bytes
# If the hypothesis holds, speed should follow the offset (e.g. slow at 0, fast elsewhere)
# and the heap runs should be slow exactly when their reported offset matches a slow one.
# If speed stays bimodal at a FIXED offset, the hypothesis is wrong.
# Output: data\alias_check.csv
#
#   powershell -ExecutionPolicy Bypass -File .\run_alias_check.ps1
param([int]$Reps = 8, [int[]]$Sizes = @(16, 64, 256),
      [int[]]$Offsets = @(0, 4, 64, 1024, 2048), [double]$Seconds = 1)

$exe = Join-Path $PSScriptRoot "bin\cachemiss.exe"
$rows = @()
foreach ($kb in $Sizes) {
    $settings = @(@{ name = "heap"; arg = "" }) + ($Offsets | ForEach-Object { @{ name = "forced"; arg = "$_" } })
    foreach ($s in $settings) {
        foreach ($rep in 1..$Reps) {
            $argList = @("one", $kb, "rand", $Seconds)
            if ($s.arg) { $argList += $s.arg }
            $out = & $exe @argList 2>$null
            $line = $out | Where-Object { $_ -like "RESULT,*" } | Select-Object -First 1
            if (-not $line) { Write-Warning "no RESULT for $kb KB $($s.name) $($s.arg)"; continue }
            $f = $line -split ","
            $m = @{}
            for ($i = 1; $i + 1 -lt $f.Count; $i += 2) { $m[$f[$i]] = $f[$i + 1] }
            $rows += [pscustomobject][ordered]@{
                footprint_KB = $kb; layout = $m["layout"]; rep = $rep
                xy_offset_mod4096 = [int]$m["xy_offset_mod4096"]; ns_per_elem = [double]$m["ns_per_elem"] }
            Write-Host ("{0,5} KB  {1,-6} offset {2,5}  {3,6:N3} ns/elem" -f $kb, $m["layout"], $m["xy_offset_mod4096"], [double]$m["ns_per_elem"])
        }
    }
}
$rows | Export-Csv -NoTypeInformation -Encoding ascii (Join-Path $PSScriptRoot "data\alias_check.csv")
