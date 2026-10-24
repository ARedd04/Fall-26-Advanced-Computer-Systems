# build.ps1 - four builds of the SAME sources; only the flags differ.
#   scalar    : vectorizer off, OpenMP-SIMD pragmas ignored -> true scalar baseline
#   auto      : default -O3 + honor `omp simd` pragmas      -> baseline ISA (SSE2 on x86-64)
#   native    : -march=native + honor `omp simd` pragmas    -> this CPU's ISA, GCC's preferred width
#   native256 : native + force 256-bit vectors              -> compare 128- vs 256-bit on Zen+
#
#   powershell -ExecutionPolicy Bypass -File .\build.ps1            # build the 4 binaries into bin\
#   powershell -ExecutionPolicy Bypass -File .\build.ps1 -Verify    # + reports\ (see below)
#
# -Verify writes vectorization evidence to reports\:
#   vec_<build>.txt / missed_<build>.txt   GCC -fopt-info: loops vectorized / not vectorized
#   kernels_<build>.s                      assembly of kernels.cpp (Intel syntax)
#   vector_summary.csv                     per-kernel arithmetic instruction mix (tools\vec_summary.ps1)
# Uses the MSYS2 UCRT64 g++ and objdump by full path, so no MSYS2 shell is needed.
param([switch]$Verify)
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$bin = "C:\msys64\ucrt64\bin"
$gxx = Join-Path $bin "g++.exe"
# -static: the .exe files run from any shell without MSYS2's DLLs on PATH
$common = @("-std=c++17", "-O3", "-g", "-Wall", "-Wextra", "-Wno-unknown-pragmas", "-static")
$flags = [ordered]@{
    # BUILD_SCALAR also keeps the peak-FLOP kernel (written with vector extensions) scalar.
    scalar    = @("-fno-tree-vectorize", "-fno-tree-slp-vectorize", "-DBUILD_SCALAR")
    auto      = @("-fopenmp-simd")
    native    = @("-fopenmp-simd", "-march=native")
    # GCC's tuning for Zen/Zen+ (znver1) defaults to 128-bit vectors because those cores
    # execute 256-bit AVX2 ops as two 128-bit halves. This build forces 256-bit so the
    # two widths can be compared directly.
    native256 = @("-fopenmp-simd", "-march=native", "-mprefer-vector-width=256")
}

New-Item -ItemType Directory -Force bin | Out-Null
foreach ($name in $flags.Keys) {
    Write-Host "building bin\bench_$name.exe"
    & $gxx @common @($flags[$name]) src\bench.cpp src\kernels.cpp -o "bin\bench_$name.exe"
    if ($LASTEXITCODE -ne 0) { throw "build failed: $name" }
}

if ($Verify) {
    New-Item -ItemType Directory -Force reports | Out-Null
    foreach ($name in $flags.Keys) {
        $f = @($flags[$name])
        # GCC honors only one -fopt-info file per run, so optimized/missed are separate runs.
        & $gxx @common @f -c src\kernels.cpp -o reports\_discard.o "-fopt-info-vec-optimized=reports\vec_$name.txt"
        & $gxx @common @f -c src\kernels.cpp -o reports\_discard.o "-fopt-info-vec-missed=reports\missed_$name.txt"
        & $gxx @common @f -S -masm=intel src\kernels.cpp -o "reports\kernels_$name.s"
        if ($LASTEXITCODE -ne 0) { throw "report generation failed: $name" }
    }
    Remove-Item reports\_discard.o -ErrorAction SilentlyContinue
    & (Join-Path $PSScriptRoot "tools\vec_summary.ps1") -Binaries ($flags.Keys | ForEach-Object { "bin\bench_$_.exe" }) `
        -Out reports\vector_summary.csv
    Write-Host "wrote reports\ (vec_*, missed_*, kernels_*.s, vector_summary.csv)"
}

# Record compiler and flags for the methodology section
$lines = @((& $gxx --version)[0], "common: $common")
foreach ($name in $flags.Keys) { $lines += "${name}: $($flags[$name])" }
$lines | Set-Content -Encoding ascii bin\compiler.txt
