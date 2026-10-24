# pcm_common.ps1 - shared helper for the hardware-counter scripts (dot-source it)
#
# Invoke-PcmMeasurement starts one benchmark process in its "one" mode, waits for the
# READY line (setup finished), counts events on logical CPU 2 with AMDuProfPcm for
# $Window seconds while only the measured loop runs, then waits for the program to
# print its "RESULT,key,value,..." line. Returns an ordered table with the RESULT fields
# followed by the counter totals named in tools\pcm_events.conf.
#
# The program must run for longer than $Window seconds after READY.
# Needs the Hyper-V hypervisor off; with it on, the core counters are not available.

$PcmExe  = "C:\Program Files\AMD\AMDuProf\bin\AMDuProfPcm.exe"
$PcmConf = Join-Path $PSScriptRoot "pcm_events.conf"

function Invoke-PcmMeasurement {
    param([string]$Exe, [string]$ArgLine, [int]$Window, [string]$Tag, [string]$OutDir)

    $appOut = Join-Path $OutDir "$Tag.app.txt"
    $p = Start-Process -FilePath $Exe -ArgumentList $ArgLine -NoNewWindow -PassThru `
                       -RedirectStandardOutput $appOut -RedirectStandardError "$appOut.err"
    while (-not ((Test-Path $appOut) -and (Select-String -Path $appOut -Pattern READY -Quiet))) {
        if ($p.HasExited) { Write-Warning "$Tag exited before READY"; return $null }
        Start-Sleep -Milliseconds 100
    }

    $pcmDir = Join-Path $OutDir $Tag
    if (Test-Path $pcmDir) { Remove-Item -Recurse -Force $pcmDir }      # stale report from an earlier run
    & $PcmExe -i $PcmConf -c core=2 -d $Window -C -q -O $pcmDir | Out-Null
    $p.WaitForExit()

    $res = [ordered]@{}
    $line = Get-Content $appOut | Where-Object { $_ -like "RESULT,*" } | Select-Object -First 1
    if (-not $line) { Write-Warning "$Tag printed no RESULT line"; return $null }
    $f = $line -split ","
    for ($i = 1; $i + 1 -lt $f.Count; $i += 2) { $res[$f[$i]] = $f[$i + 1] }

    $csv = Get-ChildItem $pcmDir -Recurse -Filter "report-cumulative.csv" | Select-Object -First 1
    if (-not $csv) { Write-Warning "$Tag produced no PCM report"; return $null }
    foreach ($l in Get-Content $csv.FullName) {
        $c = $l -split ","
        $v = 0.0
        if ($c.Count -ge 2 -and $c[0] -match "^[a-z0-9_]+$" -and [double]::TryParse($c[1], [ref]$v)) {
            $res[$c[0]] = $v
        }
    }
    return $res
}

# Divides every counter in $m by $units (elements, hops, ...) and returns a row object
function ConvertTo-PerUnitRow {
    param($Head, $m, [double]$units, [string]$suffix)
    $row = [ordered]@{}
    foreach ($k in $Head.Keys) { $row[$k] = $Head[$k] }
    foreach ($k in ($m.Keys | Where-Object { $m[$_] -is [double] } | Sort-Object)) {
        $row["${k}_per_$suffix"] = $m[$k] / $units
    }
    $row["ipc"] = $m["instructions_g1"] / $m["cycles_g1"]
    return [pscustomobject]$row
}
