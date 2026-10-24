# build.ps1 - compiles every benchmark in src\ into bin\
# Uses the MSYS2 UCRT64 g++; -static so the .exe files run without MSYS2 DLLs on PATH.
$gxx = "C:\msys64\ucrt64\bin\g++.exe"
if (-not (Test-Path $gxx)) { $gxx = "g++" }
$flags = @("-O2", "-std=c++20", "-Wall", "-static")

New-Item -ItemType Directory -Force bin | Out-Null
& $gxx --version | Select-Object -First 1 | Tee-Object -FilePath bin\compiler.txt
"flags: $flags" | Add-Content bin\compiler.txt

foreach ($src in Get-ChildItem src\*.cpp) {
    $exe = "bin\$($src.BaseName).exe"
    Write-Host "building $exe"
    & $gxx @flags -o $exe $src.FullName -ladvapi32
    if ($LASTEXITCODE -ne 0) { Write-Error "build failed: $($src.Name)"; exit 1 }
}
