"""make_plots.py - figures and processed data for Project 1 (SIMD advantage profiling)

Usage (from the SIMD folder):
    py -3.12 plots\\make_plots.py [--data data/raw]

Reads data/raw/*.csv and reports/vector_summary.csv, writes
    data/processed/*.csv   median / min / max / n across the repeated runs per configuration
    plots/*.png            one figure per required experiment

Central value = MEDIAN of the runs (R = 3 fresh processes), error bars = min..max. The
median keeps one anomalous process (see 10_bimodal.png) from moving a point; the bars
keep it visible. Needs numpy and matplotlib.
"""
import argparse
import csv
import os
from collections import defaultdict

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

# Categorical slots in fixed order (validated default palette); colour follows the build.
C = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100", "#e87ba4", "#008300", "#6250d6", "#e34948"]
INK, INK2, MUTED, GRID = "#0b0b0b", "#52514e", "#8a8984", "#e4e3df"
BUILDS = ["scalar", "auto", "native", "native256"]
BLABEL = {"scalar": "scalar (no vectorizer)", "auto": "auto (SSE2, 128-bit)",
          "native": "native (AVX2, GCC prefers 128-bit)", "native256": "native256 (AVX2 256-bit)"}
BCOL = {b: C[i] for i, b in enumerate(BUILDS)}
DCOL = {"f32": C[0], "f64": C[1], "i32": C[2]}
EDGES = [(32 * 1024, "L1d\n32K"), (512 * 1024, "L2\n512K"), (8 * 1024 * 1024, "L3 (CCX)\n8M")]

plt.rcParams.update({
    "figure.dpi": 100, "savefig.dpi": 200, "savefig.bbox": "tight",
    "font.size": 9, "axes.titlesize": 9.5, "axes.labelsize": 9,
    "axes.edgecolor": MUTED, "axes.labelcolor": INK2, "axes.titlecolor": INK,
    "xtick.color": INK2, "ytick.color": INK2, "text.color": INK,
    "axes.spines.top": False, "axes.spines.right": False,
    "axes.grid": True, "grid.color": GRID, "grid.linewidth": 0.6,
    "lines.linewidth": 1.6, "lines.markersize": 4.5,
    "legend.frameon": False, "legend.fontsize": 7.5, "errorbar.capsize": 2,
})

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PLOTS = os.path.join(ROOT, "plots")
PROC = os.path.join(ROOT, "data", "processed")


# ---------------------------------------------------------------------------
# Data helpers
# ---------------------------------------------------------------------------
def num(v):
    try:
        f = float(v)
        return int(f) if f.is_integer() and "." not in v and "e" not in v.lower() else f
    except (TypeError, ValueError):
        return v


def load(path):
    with open(path, newline="") as f:
        return [{k: num(v) for k, v in r.items()} for r in csv.DictReader(f)]


def agg(rows, keys, vals, out_name=None):
    """{key_tuple: {val: (median, min, max, n)}} across runs; optionally saved to data/processed."""
    g = defaultdict(lambda: defaultdict(list))
    for r in rows:
        k = tuple(r[c] for c in keys)
        for v in vals:
            g[k][v].append(float(r[v]))
    out = {k: {v: (float(np.median(x)), min(x), max(x), len(x)) for v, x in d.items()} for k, d in g.items()}
    if out_name:
        with open(os.path.join(PROC, out_name), "w", newline="") as f:
            w = csv.writer(f)
            w.writerow(list(keys) + [f"{v}_{s}" for v in vals for s in ("median", "min", "max")] + ["n_runs"])
            for k in sorted(out, key=lambda t: [(0, x, "") if isinstance(x, (int, float)) else (1, 0, x) for x in t]):
                w.writerow(list(k) + [f"{out[k][v][i]:.6g}" for v in vals for i in range(3)] + [out[k][vals[0]][3]])
    return out


def pick(s, match, xi, val):
    """Rows of summary s whose key matches {index: value}; sorted x, median, lower err, upper err."""
    pts = sorted((k[xi], d[val]) for k, d in s.items() if all(k[i] == v for i, v in match.items()))
    if not pts:
        return [np.array([])] * 4
    x = np.array([p[0] for p in pts])
    m = np.array([p[1][0] for p in pts])
    lo = m - np.array([p[1][1] for p in pts])
    hi = np.array([p[1][2] for p in pts]) - m
    return x, m, lo, hi


def size_label(b):
    b = float(b)
    if b >= 1 << 20: return f"{b / (1 << 20):g}M"
    if b >= 1 << 10: return f"{b / (1 << 10):g}K"
    return f"{b:g}"


def bytes_axis(ax, ticks=(4096, 16384, 65536, 262144, 1 << 20, 4 << 20, 16 << 20, 64 << 20, 256 << 20)):
    ax.set_xscale("log", base=2)
    ax.set_xticks(ticks)
    ax.set_xticklabels([size_label(t) for t in ticks], rotation=45, ha="right")
    ax.minorticks_off()


def edges(ax, labels=True):
    for b, name in EDGES:
        ax.axvline(b, color=MUTED, lw=0.8, ls="--", zorder=0)
        if labels:
            ax.text(b, 1.01, name, transform=ax.get_xaxis_transform(), ha="center", va="bottom",
                    fontsize=6.5, color=INK2)
    if labels:
        ax.set_title(ax.get_title(), pad=24)


def eline(ax, x, m, lo, hi, color, label, **kw):
    ax.errorbar(x, m, yerr=[lo, hi], color=color, ecolor=color, marker="o", label=label, elinewidth=1, **kw)


def save(fig, name):
    fig.savefig(os.path.join(PLOTS, name))
    plt.close(fig)
    print("wrote plots/" + name)


KERNELS = [("saxpy", "-", "SAXPY  y = a*x + y"), ("mul", "-", "Elementwise  z = x*y"),
           ("dot", "strict", "Dot, plain loop (strict FP order)"), ("dot", "simd_acc", "Dot, reassociation allowed (omp simd)")]


# ---------------------------------------------------------------------------
# 1. Baseline speedup, 2. locality, 6. data types
# ---------------------------------------------------------------------------
def fig_baseline(base):
    s = agg(base, ["tag", "kernel", "variant", "dtype", "footprint_bytes"],
            ["gflops_median", "gibs_median", "ns_per_elem", "cycles_per_elem", "median_s"], "baseline_summary.csv")
    # Speedup per run-median vs the scalar build's median at the same configuration
    sp_rows = []
    for (tag, k, v, dt, fb), d in s.items():
        ref = s.get(("scalar", k, v, dt, fb))
        if ref:
            sp_rows.append({"tag": tag, "kernel": k, "variant": v, "dtype": dt, "footprint_bytes": fb,
                            "speedup": ref["median_s"][0] / d["median_s"][0]})
    sp = agg(sp_rows, ["tag", "kernel", "variant", "dtype", "footprint_bytes"], ["speedup"], "speedup_vs_scalar.csv")

    fig, axes = plt.subplots(2, 4, figsize=(15, 6.6), sharex=True)
    for j, (k, v, title) in enumerate(KERNELS):
        top, bot = axes[0, j], axes[1, j]
        sp_max = 1.0
        for b in BUILDS:
            x, m, lo, hi = pick(s, {0: b, 1: k, 2: v, 3: "f32"}, 4, "gflops_median")
            eline(top, x, m, lo, hi, BCOL[b], BLABEL[b])
            if b != "scalar":
                x, m, _, _ = pick(sp, {0: b, 1: k, 2: v, 3: "f32"}, 4, "speedup")
                bot.plot(x, m, color=BCOL[b], marker="o", label=BLABEL[b])
                sp_max = max(sp_max, float(np.max(m)))
        bot.axhline(1, color=INK2, lw=0.8)
        top.set_title(title)
        edges(top)
        edges(bot, labels=False)
        top.set_ylim(bottom=0)
        bot.set_ylim(0, sp_max * 1.12)          # headroom so the top points are not clipped
        bytes_axis(bot)
        bot.set_xlabel("footprint (all arrays)")
    axes[0, 0].set_ylabel("GFLOP/s (f32)")
    axes[1, 0].set_ylabel("speedup vs scalar build")
    axes[0, 3].annotate("native dips:\nslow-mode runs\n(10_bimodal)",
                        xy=(0.5, 0.3), xycoords="axes fraction", fontsize=7, color=INK2)
    fig.suptitle("Scalar vs auto-vectorized builds across working-set sizes (f32, 1 thread)", y=1.04)
    fig.tight_layout()
    h, l = axes[0, 0].get_legend_handles_labels()
    fig.legend(h, l, loc="lower center", ncol=4, bbox_to_anchor=(0.5, -0.04))
    save(fig, "01_baseline_speedup.png")

    # Locality: SAXPY throughput in GB/s with the speedup per cache region annotated
    fig, (a, b) = plt.subplots(2, 1, figsize=(7.5, 6.4), sharex=True)
    for bd in ("scalar", "native256"):
        x, m, lo, hi = pick(s, {0: bd, 1: "saxpy", 2: "-", 3: "f32"}, 4, "gibs_median")
        eline(a, x, m * 1.073741824, lo * 1.073741824, hi * 1.073741824, BCOL[bd], BLABEL[bd])
    a.set_ylabel("data moved (GB/s, 12 B per element)")
    a.set_title("SAXPY f32: bandwidth by working-set size")
    edges(a)
    a.legend(loc="upper right")
    x, m, _, _ = pick(sp, {0: "native256", 1: "saxpy", 2: "-", 3: "f32"}, 4, "speedup")
    b.plot(x, m, color=BCOL["native256"], marker="o")
    b.axhline(1, color=INK2, lw=0.8)
    regions = [("L1", 0, 32 << 10), ("L2", 32 << 10, 512 << 10), ("L3", 512 << 10, 8 << 20), ("DRAM", 16 << 20, 1 << 40)]
    for name, lo_b, hi_b in regions:
        sel = [mm for xx, mm in zip(x, m) if lo_b < xx <= hi_b]
        if sel:
            xs = [xx for xx in x if lo_b < xx <= hi_b]
            xc = np.exp(np.mean(np.log(xs)))
            b.annotate(f"{name}\n{np.median(sel):.1f}x", (xc, np.median(sel)), textcoords="offset points",
                       xytext=(0, 12), ha="center", fontsize=8, color=INK)
    b.set_ylabel("speedup, native256 / scalar")
    b.set_ylim(0, max(m) * 1.3)
    edges(b, labels=False)
    bytes_axis(b)
    b.set_xlabel("footprint (x + y)")
    b.set_title("SIMD gain compresses once the data comes from L3 / DRAM")
    save(fig, "02_locality_saxpy.png")

    # Data types: speedup in L1 per kernel x dtype, and GFLOP/s curves for native256
    fig, (a, b) = plt.subplots(1, 2, figsize=(12, 3.8))
    labels, w = [], 0.27
    fb_l1 = {}
    for (tag, k, v, dt, fb) in sp:
        if 12000 <= fb <= 16384:
            fb_l1[(k, v, dt)] = fb
    kk = [(k, v) for k, v, _ in KERNELS]
    for i, dt in enumerate(("f32", "f64", "i32")):
        vals = [sp.get(("native256", k, v, dt, fb_l1.get((k, v, dt))), {}).get("speedup", (np.nan,))[0] for k, v in kk]
        xs = np.arange(len(kk)) + (i - 1) * w
        a.bar(xs, vals, w * 0.92, color=DCOL[dt], label=dt, zorder=2)
        for x_, v_ in zip(xs, vals):
            a.text(x_, v_, f"{v_:.1f}", ha="center", va="bottom", fontsize=7)
    a.set_xticks(range(len(kk)))
    a.set_xticklabels(["SAXPY", "mul", "dot strict", "dot simd_acc"])
    a.axhline(1, color=INK2, lw=0.8)
    a.set_ylabel("speedup native256 / scalar")
    a.set_title("In L1 (16 KiB): lanes per 256-bit vector  f32 = 8, f64 = 4, i32 = 8")
    a.grid(axis="x", visible=False)
    a.legend()
    for dt in ("f32", "f64", "i32"):
        x, m, lo, hi = pick(s, {0: "native256", 1: "saxpy", 2: "-", 3: dt}, 4, "gflops_median")
        eline(b, x, m, lo, hi, DCOL[dt], dt)
    b.set_ylabel("G(FL)OP/s, SAXPY native256")
    b.set_title("SAXPY by data type: f64 has half the lanes and twice the bytes")
    edges(b)
    bytes_axis(b)
    b.set_ylim(bottom=0)
    b.legend()
    save(fig, "06_datatypes.png")
    return s, sp


# ---------------------------------------------------------------------------
# 3. Alignment
# ---------------------------------------------------------------------------
def fig_align(rows):
    for r in rows:
        ox, oy = r["offset_x_elems"], r["offset_y_elems"]
        r["case"] = str(ox) if ox == oy else f"x{ox}/y{oy}"
    s = agg(rows, ["tag", "kernel", "variant", "n", "case"], ["ns_per_elem"], "align_summary.csv")
    cases = ["0", "1", "2", "4", "8", "15", "x0/y1", "x1/y0"]
    kern = [("saxpy", "-", "SAXPY"), ("mul", "-", "mul"), ("dot", "simd_acc", "dot simd_acc")]
    ns = sorted({k[3] for k in s if k[1] == "saxpy"})
    fig, axes = plt.subplots(len(kern), 3, figsize=(13, 8.5))
    for i, (k, v, kl) in enumerate(kern):
        nk = sorted({key[3] for key in s if key[1] == k and key[2] == v})
        for j, n in enumerate(nk):
            ax = axes[i, j]
            for bi, b in enumerate(("auto", "native", "native256")):
                m = [s.get((b, k, v, n, c), {}).get("ns_per_elem", (np.nan, np.nan, np.nan))[0] for c in cases]
                lo = [mm - s.get((b, k, v, n, c), {}).get("ns_per_elem", (0, np.nan, 0))[1] for mm, c in zip(m, cases)]
                hi = [s.get((b, k, v, n, c), {}).get("ns_per_elem", (0, 0, np.nan))[2] - mm for mm, c in zip(m, cases)]
                xs = np.arange(len(cases)) + (bi - 1) * 0.22
                ax.errorbar(xs, m, yerr=[lo, hi], color=BCOL[b], marker="o", ls="none", label=BLABEL[b], elinewidth=1)
            ax.set_xticks(range(len(cases)))
            ax.set_xticklabels(cases, fontsize=7.5)
            ax.set_ylim(bottom=0)
            fb = n * (12 if k == "mul" else 8)
            ax.set_title(f"{kl}, footprint {size_label(round(fb / 1024) * 1024)}B", fontsize=9)
            if j == 0:
                ax.set_ylabel("ns per element")
            if i == len(kern) - 1:
                ax.set_xlabel("array start offset (f32 elements; 4 = 16 B, 8 = 32 B)")
    axes[0, 0].legend(loc="lower left")
    fig.suptitle("Alignment: arrays shifted from a 64 B boundary (median of 3 runs, bars = min..max)", y=1.0)
    fig.tight_layout()
    save(fig, "03_alignment.png")


# ---------------------------------------------------------------------------
# 4. Tail
# ---------------------------------------------------------------------------
def fig_tail(rows):
    for r in rows:
        r["ns_call"] = r["median_s"] * 1e9
    s = agg(rows, ["tag", "kernel", "variant", "n"], ["ns_call", "ns_per_elem", "cycles_per_elem"], "tail_summary.csv")
    kern = [("saxpy", "-", "SAXPY"), ("mul", "-", "mul"), ("dot", "simd_acc", "dot simd_acc")]
    fig, axes = plt.subplots(len(kern), 2, figsize=(12, 9))
    for i, (k, v, kl) in enumerate(kern):
        for j, (lo_n, hi_n) in enumerate(((1, 64), (1024, 1056))):
            ax = axes[i, j]
            for b in BUILDS:
                x, m, lo, hi = pick(s, {0: b, 1: k, 2: v}, 3, "ns_call")
                sel = (x >= lo_n) & (x <= hi_n)
                ax.plot(x[sel], m[sel], color=BCOL[b], marker="o", ms=3, label=BLABEL[b])
            for g in range(lo_n - lo_n % 8 + 8, hi_n + 1, 8):
                ax.axvline(g, color=GRID, lw=0.8, zorder=0)
            ax.set_title(f"{kl}: N = {lo_n}..{hi_n} (grey lines every 8 elements = one 256-bit f32 vector)", fontsize=8.5)
            ax.set_ylim(bottom=0)
            if j == 0:
                ax.set_ylabel("ns per call")
            if i == len(kern) - 1:
                ax.set_xlabel("N (elements)")
    axes[0, 0].legend(loc="upper left")
    fig.suptitle("Tail handling: time per call vs N, f32 (steps = vector-width remainders, prologue/epilogue cost)", y=1.0)
    fig.tight_layout()
    save(fig, "04_tail.png")


# ---------------------------------------------------------------------------
# 5. Stride / gather
# ---------------------------------------------------------------------------
def fig_stride(rows):
    for r in rows:
        r["access"] = f"stride {r['stride']}" if r["kernel"] == "saxpy_stride" else f"gather {r['gather']}"
        r["useful_GBps"] = r["gibs_median"] * 1.073741824
    s = agg(rows, ["tag", "dtype", "n", "access"], ["ns_per_elem", "useful_GBps"], "stride_summary.csv")
    acc = ["stride 1", "stride 2", "stride 4", "stride 8", "stride 16", "gather seq", "gather rand"]
    fig, axes = plt.subplots(2, 2, figsize=(12, 7))
    for i, dt in enumerate(("f32", "f64")):
        for j, n in enumerate((4096, 2097152)):
            ax = axes[i, j]
            for bi, b in enumerate(BUILDS):
                m = [s.get((b, dt, n, a), {}).get("ns_per_elem", (np.nan,))[0] for a in acc]
                ax.plot(range(len(acc)), m, color=BCOL[b], marker="o", label=BLABEL[b])
            ax.set_yscale("log")
            ax.set_xticks(range(len(acc)))
            ax.set_xticklabels(acc, rotation=30, ha="right")
            span = {4096: "cache-resident (N = 4096)", 2097152: "DRAM (N = 2M)"}[n]
            ax.set_title(f"{dt}, {span}", fontsize=9)
            ax.axvline(4.5, color=MUTED, lw=0.8, ls="--")
            if j == 0:
                ax.set_ylabel("ns per element updated (log)")
    axes[0, 0].legend(loc="upper left")
    fig.suptitle("Stride / gather: same work per element, more cache lines per element as stride grows "
                 "(f32 stride 16 = one element per 64 B line)", y=1.0)
    fig.tight_layout()
    save(fig, "05_stride_gather.png")


# ---------------------------------------------------------------------------
# 7. Roofline
# ---------------------------------------------------------------------------
def fig_roofline(s, peak_rows):
    pk = agg(peak_rows, ["tag", "dtype"], ["gflops_median"], "peak_summary.csv")
    # Measured single-thread bandwidth ceilings (GB/s, useful bytes) from the baseline
    def best_bw(lo_b, hi_b):
        v = [d["gibs_median"][0] * 1.073741824 for (tag, k, var, dt, fb), d in s.items()
             if lo_b <= fb <= hi_b and k in ("saxpy", "mul", "dot")]
        return max(v)
    bw = {"L1": best_bw(4096, 24576), "L2": best_bw(65536, 393216), "DRAM": best_bw(64 << 20, 1 << 40)}
    ai = {("saxpy", "f32"): 2 / 12, ("saxpy", "f64"): 2 / 24, ("mul", "f32"): 1 / 12, ("mul", "f64"): 1 / 24,
          ("dot", "f32"): 2 / 8, ("dot", "f64"): 2 / 16}
    fig, ax = plt.subplots(figsize=(8, 5.4))
    xs = np.logspace(-2, 1.5, 200)
    peaks = [("native256", "f32", "peak f32 FMA 256-bit"), ("native256", "f64", "peak f64"),
             ("scalar", "f32", "peak scalar")]
    for tag, dt, lab in peaks:
        p = pk[(tag, dt)]["gflops_median"][0]
        ax.axhline(p, color=INK2, lw=1, ls="-" if tag != "scalar" else ":")
        ax.text(xs[-1], p, f"{lab}: {p:.1f} GFLOP/s ", ha="right", va="bottom", fontsize=7.5, color=INK2)
    ptop = pk[("native256", "f32")]["gflops_median"][0]
    # L1 and L2 deliver the same ~32 B/cycle on Zen+, so they share one line
    for label, b_, ls, xr in ((f"L1/L2 ~{max(bw['L1'], bw['L2']):.0f} GB/s", max(bw["L1"], bw["L2"]), "-", 0.012),
                              (f"DRAM {bw['DRAM']:.0f} GB/s (1 thread)", bw["DRAM"], ":", 0.035)):
        ax.plot(xs, np.minimum(xs * b_, ptop), color=MUTED, ls=ls, lw=1)
        ax.text(xr, xr * b_ * 1.25, label, fontsize=7.5, color=INK2)
    rows_out = []
    for i, (k, v) in enumerate((("saxpy", "-"), ("mul", "-"), ("dot", "simd_acc"))):
        for dt, mk in (("f32", "o"), ("f64", "s")):
            for where, fb_lo, fb_hi, fill in (("L1", 8192, 24576, True), ("DRAM", 64 << 20, 1 << 40, False)):
                cand = [(fb, d) for (tag, kk, vv, dd, fb), d in s.items()
                        if tag == "native256" and kk == k and vv == v and dd == dt and fb_lo <= fb <= fb_hi]
                if not cand:
                    continue
                fb, d = max(cand, key=lambda t: t[0]) if where == "DRAM" else cand[len(cand) // 2]
                g = d["gflops_median"][0]
                a_ = ai[(k, dt)]
                ax.plot(a_, g, mk, color=C[i], ms=8, mfc=C[i] if fill else "white", mew=1.5,
                        label=f"{k}{'' if v == '-' else ' ' + v} {dt}" if where == "L1" else None)
                rows_out.append([k, v, dt, where, size_label(fb), f"{a_:.4f}", f"{g:.3f}",
                                 f"{min(ptop, a_ * bw[where]):.3f}"])
    with open(os.path.join(PROC, "roofline_points.csv"), "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["kernel", "variant", "dtype", "level", "footprint", "AI_flop_per_byte", "gflops", "roof_gflops"])
        w.writerows(rows_out)
        w.writerow([]); w.writerow(["ceiling", "GBps"])
        for k_, v_ in bw.items():
            w.writerow([k_, f"{v_:.2f}"])
    ax.set_xscale("log"); ax.set_yscale("log")
    ax.set_xlim(xs[0], xs[-1]); ax.set_ylim(0.5, 150)
    ax.set_xlabel("arithmetic intensity (FLOP per byte of useful traffic)")
    ax.set_ylabel("GFLOP/s")
    ax.set_title("Roofline, native256 build, 1 thread (filled = 16 KiB / L1, open = 256 MiB / DRAM)")
    ax.legend(loc="lower right", ncol=2)
    save(fig, "07_roofline.png")
    print("   bandwidth ceilings (GB/s):", {k: round(v, 1) for k, v in bw.items()})


# ---------------------------------------------------------------------------
# 8. Verification + negative example
# ---------------------------------------------------------------------------
def fig_verify_negative(s, vs_path):
    vs = load(vs_path)
    kern = ["saxpy", "vmul", "dot_strict", "dot_simd_acc"]
    fig, axes = plt.subplots(1, 2, figsize=(13, 4))
    a, b = axes
    w = 0.2
    cats = [("arith_256", "256-bit packed", C[3]), ("arith_128", "128-bit packed", C[2]), ("arith_scalar", "scalar", C[0])]
    xt, xl = [], []
    for i, k in enumerate(kern):
        for j, bd in enumerate(BUILDS):
            r = next(r for r in vs if r["kernel"] == k and r["dtype"] == "f32" and r["build"] == bd)
            x0 = i * 5 + j
            bottom = 0
            for col, lab, colr in cats:
                a.bar(x0, r[col], 0.8, bottom=bottom, color=colr, label=lab if (i == 0 and j == 0) else None, zorder=2)
                bottom += r[col]
            xt.append(x0); xl.append(bd)
    a.set_xticks(xt); a.set_xticklabels(xl, rotation=60, ha="right", fontsize=7)
    for i, k in enumerate(kern):
        a.text(i * 5 + 1.5, -0.3, k, transform=a.get_xaxis_transform(), ha="center", va="top", fontsize=8.5)
    a.set_ylabel("arithmetic instructions in the function (static)")
    a.set_title("Vectorization evidence from the disassembly (f32)")
    a.legend(loc="upper left")
    a.grid(axis="x", visible=False)

    variants = [("strict", "plain loop"), ("simd", "omp simd (1 acc)"), ("multiacc", "8 scalar accs"), ("simd_acc", "omp simd, 8 vector accs")]
    for bi, bd in enumerate(BUILDS):
        vals = []
        for v, _ in variants:
            cand = [d for (tag, k, vv, dt, fb), d in s.items() if tag == bd and k == "dot" and vv == v and dt == "f32" and fb == 16384]
            vals.append(cand[0]["gflops_median"][0] if cand else np.nan)
        xs = np.arange(len(variants)) + (bi - 1.5) * w
        b.bar(xs, vals, w * 0.92, color=BCOL[bd], label=BLABEL[bd], zorder=2)
        for x_, v_ in zip(xs, vals):
            b.text(x_, v_, f"{v_:.1f}", ha="center", va="bottom", fontsize=6.5)
    b.set_xticks(range(len(variants))); b.set_xticklabels([l for _, l in variants])
    b.set_ylabel("GFLOP/s, f32 dot, 16 KiB (L1)")
    b.set_title("Negative example: the plain dot loop is 'vectorized' per GCC yet never speeds up")
    b.legend(loc="upper left")
    b.grid(axis="x", visible=False)
    fig.tight_layout()
    save(fig, "08_verification_negative.png")


# ---------------------------------------------------------------------------
# 10. Anomaly: bimodal native dot_simd_acc
# ---------------------------------------------------------------------------
def fig_bimodal(align_rows, tail_rows):
    fig, ax = plt.subplots(figsize=(7.5, 3.6))
    rng = np.random.default_rng(1)
    for i, b in enumerate(("auto", "native", "native256")):
        # cache-resident sizes only: DRAM-sized runs form their own (expected) slower cluster
        v = [r["ns_per_elem"] for r in align_rows
             if r["tag"] == b and r["kernel"] == "dot" and r["footprint_bytes"] <= (1 << 20)]
        ax.plot(i + rng.uniform(-0.2, 0.2, len(v)), v, "o", color=BCOL[b], ms=4, alpha=0.75)
    ax.set_xticks(range(3)); ax.set_xticklabels([BLABEL[b] for b in ("auto", "native", "native256")])
    ax.set_ylabel("ns per element (one dot = one process)")
    ax.set_ylim(bottom=0)
    ax.set_title("dot simd_acc, 16 KiB and 256 KiB (all offsets): native has a 4x slower mode in some processes")
    save(fig, "10_bimodal.png")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", default=os.path.join(ROOT, "data", "raw"))
    args = ap.parse_args()
    os.makedirs(PLOTS, exist_ok=True)
    os.makedirs(PROC, exist_ok=True)
    D = args.data
    base = load(os.path.join(D, "baseline.csv"))
    bad = [r for r in base if r["ok"] != 1]
    with open(os.path.join(PROC, "correctness_failures.csv"), "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["tag", "run", "kernel", "variant", "dtype", "n", "rel_err"])
        for r in bad:
            w.writerow([r[c] for c in ("tag", "run", "kernel", "variant", "dtype", "n", "rel_err")])
    print(f"correctness: {len(base) - len(bad)}/{len(base)} baseline rows within tolerance "
          f"(failures listed in data/processed/correctness_failures.csv)")
    s = sp = None
    try:
        s, sp = fig_baseline(base)
    except Exception as e:
        print(f"!! baseline failed: {type(e).__name__}: {e}")
    for name, fn in (("align", lambda: fig_align(load(os.path.join(D, "align.csv")))),
                     ("tail", lambda: fig_tail(load(os.path.join(D, "tail.csv")))),
                     ("stride", lambda: fig_stride(load(os.path.join(D, "stride.csv")))),
                     ("roofline", lambda: fig_roofline(s, load(os.path.join(D, "peak.csv")))),
                     ("verify", lambda: fig_verify_negative(s, os.path.join(ROOT, "reports", "vector_summary.csv"))),
                     ("bimodal", lambda: fig_bimodal(load(os.path.join(D, "align.csv")), None))):
        try:
            fn()
        except Exception as e:
            import traceback
            traceback.print_exc()
            print(f"!! {name} failed: {type(e).__name__}: {e}")


if __name__ == "__main__":
    main()
