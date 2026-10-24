# run_all.ps1 - runs every experiment and writes raw CSVs + logs to data\raw\
#   .\build.ps1 ; .\run_all.ps1            (all experiments, R repeats each)
#   .\run_all.ps1 -R 1 -Only zeroq,tlb     (subset, quick)
# Output goes through cmd.exe so the CSVs stay plain ASCII (PowerShell 5.1's '>'
# would write UTF-16). stderr (clock readings, progress) goes to data\raw\<name>.log.
param([int]$R = 3, [string[]]$Only = @())

New-Item -ItemType Directory -Force data\raw | Out-Null

function Run($name, $exe, $argList) {
    if ($Only.Count -gt 0 -and -not ($Only | Where-Object { $name -like "$_*" })) { return }
    Write-Host "== $name : $exe $argList"
    $t = Measure-Command { cmd /c "bin\$exe.exe $argList > data\raw\$name.csv 2> data\raw\$name.log" }
    Write-Host ("   done in {0:N0} s" -f $t.TotalSeconds)
}

# Environment for the methodology section
cmd /c "bin\sysinfo.exe > data\raw\sysinfo.txt 2> nul"
powercfg /getactivescheme | Out-File -Encoding ascii -Append data\raw\sysinfo.txt
"hypervisor present: $((Get-CimInstance Win32_ComputerSystem).HypervisorPresent)" | Out-File -Encoding ascii -Append data\raw\sysinfo.txt
Get-Content bin\compiler.txt | Out-File -Encoding ascii -Append data\raw\sysinfo.txt

Run "zeroq"            "zeroq"     "$R large"
Run "pattern_lat"      "pattern"   "lat $R"
Run "pattern_bw_t1"    "pattern"   "bw $R 1"
Run "pattern_bw_t8"    "pattern"   "bw $R 8"
Run "pattern_gran_t1"  "pattern"   "gran $R 1"
Run "pattern_gran_t8"  "pattern"   "gran $R 8"
Run "rwmix"            "rwmix"     "$R 1,2,4,8"
Run "intensity_mlp_1GB_4k"  "intensity" "mlp $R 1024 4k"   # page walks limit concurrency
Run "intensity_mlp_1GB_2m"  "intensity" "mlp $R 1024 2m"   # same layout, almost no TLB misses
Run "intensity_mlp_64MB_4k" "intensity" "mlp $R 64 4k"
Run "intensity_mlp_64MB_2m" "intensity" "mlp $R 64 2m"
Run "intensity_loaded" "intensity" "loaded $R 10"
Run "wss_lat"          "wss"       "lat $R"
Run "wss_bw"           "wss"       "bw $R"
Run "cachemiss"        "cachemiss" "sweep $R"
Run "tlb_pages"        "tlb"       "pages $R"
Run "tlb_locality"     "tlb"       "locality $R"
Run "pitfall_reuse"    "pitfall"   "reuse $R"
Run "pitfall_pin"      "pitfall"   "pin $R 8"
Run "pitfall_freq"     "pitfall"   "freq"
Run "pitfall_addr"     "pitfall"   "addr $R"
