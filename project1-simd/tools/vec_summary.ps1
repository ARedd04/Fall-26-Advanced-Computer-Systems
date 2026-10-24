# vec_summary.ps1 - per-kernel arithmetic instruction mix from the built binaries
# (vectorization verification without pasting full dumps).
#
#   .\tools\vec_summary.ps1 -Binaries bin\bench_scalar.exe,bin\bench_native.exe -Out reports\vector_summary.csv
#
# For every kernel function (dot_*, saxpy*, vmul, peak_flops) in each binary, counts the
# ARITHMETIC instructions only (add/sub/mul/div/min/max and FMA), by width:
#   arith_256    packed arithmetic on ymm registers      -> 256-bit AVX/AVX2 SIMD
#   arith_128    packed arithmetic on xmm registers      -> 128-bit SSE/AVX SIMD
#   arith_scalar scalar FP arithmetic (..ss / ..sd)
#   fma          fused multiply-add instructions (any width)
#   gather       vgather.. instructions
#   widest       256 / 128 / scalar: widest arithmetic the function contains
# Register copies, zeroing idioms (xorps/pxor) and shuffles are not counted: scalar code
# uses xmm registers too, so "touches an xmm register" is not evidence of SIMD.
# Counts are static (instructions in the code), not executed counts: a vectorized
# function still contains a scalar tail loop, so it shows both kinds.
param([Parameter(Mandatory)][string[]]$Binaries, [Parameter(Mandatory)][string]$Out,
      [string]$Objdump = "C:\msys64\ucrt64\bin\objdump.exe")

$kernelRe = [regex]'(dot_strict|dot_multiacc|dot_simd_acc|dot_simd|saxpy_stride|saxpy_gather|saxpy|vmul|peak_flops)<(float|double|int)>'
$headRe   = [regex]'^[0-9a-f]+ <.*>:$'
$insRe    = [regex]'^\s+[0-9a-f]+:\t(\S+)\s*(.*)$'
$fpPacked = [regex]'^v?(add|sub|mul|div|min|max)p[sd]$|^vfn?m(add|sub)[0-9]*p[sd]$'
$intPack  = [regex]'^v?p(add|sub|mull|mulh|muludq|madd)[bwdq]'
$fpScalar = [regex]'^v?(add|sub|mul|div|min|max)s[sd]$|^vfn?m(add|sub)[0-9]*s[sd]$'

$rows = New-Object System.Collections.Generic.List[string]
$rows.Add("build,kernel,dtype,instr,arith_256,arith_128,arith_scalar,fma,gather,widest")
foreach ($bin in $Binaries) {
    $build = [IO.Path]::GetFileNameWithoutExtension($bin) -replace '^bench_', ''
    $cur = $null
    $flush = {
        if ($cur) {
            $w = if ($cur.a256 -gt 0) { "256" } elseif ($cur.a128 -gt 0) { "128" } else { "scalar" }
            $rows.Add(("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9}" -f $build, $cur.name, $cur.ty, $cur.n,
                       $cur.a256, $cur.a128, $cur.sc, $cur.fma, $cur.ga, $w))
        }
    }
    foreach ($line in (& $Objdump -d -C --no-show-raw-insn $bin)) {
        if ($headRe.IsMatch($line)) {
            . $flush
            $cur = $null
            $k = $kernelRe.Match($line)
            if ($k.Success) {
                $ty = switch ($k.Groups[2].Value) { "float" { "f32" } "double" { "f64" } default { "i32" } }
                $cur = @{ name = $k.Groups[1].Value; ty = $ty; n = 0; a256 = 0; a128 = 0; sc = 0; fma = 0; ga = 0 }
            }
            continue
        }
        if (-not $cur) { continue }
        $m = $insRe.Match($line)
        if (-not $m.Success) { continue }
        $mn = $m.Groups[1].Value; $ops = $m.Groups[2].Value
        $cur.n++
        if ($fpPacked.IsMatch($mn) -or $intPack.IsMatch($mn)) { if ($ops -match 'ymm') { $cur.a256++ } else { $cur.a128++ } }
        if ($fpScalar.IsMatch($mn)) { $cur.sc++ }
        if ($mn -match '^vfn?m(add|sub)') { $cur.fma++ }
        if ($mn -match 'gather') { $cur.ga++ }
    }
    . $flush
}
$rows | Set-Content -Encoding ascii $Out
