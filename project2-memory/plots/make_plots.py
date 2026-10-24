"""make_plots.py - figures and processed data for Project 2 (cache & memory profiling)

Usage (from the project folder):
    python plots/make_plots.py [--data data/raw] [--compare data/hv_on]

Reads the raw CSVs in --data, writes
    data/processed/*.csv   mean, sd and n across runs for every configuration
    plots/*.png            one figure per experiment
and, if --compare points at a second data set (default data/hv_on), a hypervisor
on/off comparison (processed/hv_compare.csv + plots/hv_compare.png).

Error bars are +-1 sd across the repeated runs (R = 3), not within-run trial noise.
Needs numpy and matplotlib; everything else is the standard library.
"""
import argparse
import csv
import math
import os
from collections import defaultdict

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

# ---------------------------------------------------------------------------
# Style: categorical slots in fixed order (validated default palette), neutral ink
# for all text, recessive grid. Colour always follows the entity, never its rank.
# ---------------------------------------------------------------------------
C = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100", "#e87ba4", "#008300", "#6250d6", "#e34948"]
INK, INK2, MUTED, GRID = "#0b0b0b", "#52514e", "#8a8984", "#e4e3df"

plt.rcParams.update({
    "figure.dpi": 100, "savefig.dpi": 200, "savefig.bbox": "tight",
    "font.size": 9, "axes.titlesize": 10, "axes.labelsize": 9,
    "axes.edgecolor": MUTED, "axes.labelcolor": INK2, "axes.titlecolor": INK,
    "xtick.color": INK2, "ytick.color": INK2, "text.color": INK,
    "axes.spines.top": False, "axes.spines.right": False,
    "axes.grid": True, "grid.color": GRID, "grid.linewidth": 0.6,
    "lines.linewidth": 1.6, "lines.markersize": 5,
    "legend.frameon": False, "legend.fontsize": 8,
    "errorbar.capsize": 2,
})

# Cache / TLB geometry of the TR 2920X (per core unless noted)
EDGES_KB = [(32, "L1d\n32 KB"), (512, "L2\n512 KB"), (8192, "L3\n8 MB/CCX"), (32768, "L3\n32 MB chip")]
EDGES_SHORT = [(32, "L1d\n32K"), (512, "L2\n512K"), (8192, "L3 (own CCX)\n8M")]   # one core only fills its own CCX L3
TLB_REACH = [(256, "L1 DTLB\n256 KB"), (6144, "L2 DTLB\n6 MB")]

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PLOTS = os.path.join(ROOT, "plots")


# ---------------------------------------------------------------------------
# Data helpers
# ---------------------------------------------------------------------------
def num(v):
    try:
        f = float(v)
        return int(f) if f.is_integer() and "." not in v and "e" not in v.lower() else f
    except (TypeError, ValueError):
        return v


def load(data_dir, name):
    path = os.path.join(data_dir, name)
    if not os.path.exists(path):
        return None
    with open(path, newline="") as f:
        return [{k: num(v) for k, v in row.items()} for row in csv.DictReader(f)]


def summarize(rows, keys, vals, out_name=None, proc_dir=None):
    """Groups rows by 'keys' and returns {key_tuple: {val: (mean, sd, n)}}.
    Optionally writes the table to proc_dir/out_name."""
    groups = defaultdict(lambda: defaultdict(list))
    for r in rows:
        k = tuple(r[c] for c in keys)
        for v in vals:
            if isinstance(r.get(v), (int, float)):
                groups[k][v].append(float(r[v]))
    out = {}
    for k, d in groups.items():
        out[k] = {}
        for v, xs in d.items():
            a = np.array(xs)
            out[k][v] = (a.mean(), a.std(ddof=1) if len(a) > 1 else 0.0, len(a))
    if out_name and proc_dir:
        with open(os.path.join(proc_dir, out_name), "w", newline="") as f:
            w = csv.writer(f)
            w.writerow(list(keys) + [f"{v}_{s}" for v in vals for s in ("mean", "sd")] + ["n"])
            for k in sorted(out, key=lambda t: tuple(str(x).zfill(12) if isinstance(x, (int, float)) else x for x in t)):
                n = max((out[k][v][2] for v in vals if v in out[k]), default=0)
                w.writerow(list(k) + [f"{out[k][v][i]:.6g}" if v in out[k] else "" for v in vals for i in (0, 1)] + [n])
    return out


def series(summary, match, xkey_index, val):
    """Picks rows whose key matches 'match' (dict index->value); returns sorted x, mean, sd."""
    pts = []
    for k, d in summary.items():
        if all(k[i] == v for i, v in match.items()) and val in d:
            pts.append((k[xkey_index], d[val][0], d[val][1]))
    pts.sort()
    if not pts:
        return np.array([]), np.array([]), np.array([])
    x, m, s = zip(*pts)
    return np.array(x), np.array(m), np.array(s)


def kb_label(kb):
    kb = float(kb)
    if kb >= 1048576: return f"{kb / 1048576:g} GB"
    if kb >= 1024:    return f"{kb / 1024:g} MB"
    return f"{kb:g} KB"


def log2_kb_axis(ax, ticks):
    ax.set_xscale("log", base=2)
    ax.set_xticks(ticks)
    ax.set_xticklabels([kb_label(t) for t in ticks], rotation=45, ha="right")
    ax.minorticks_off()


def cache_edges(ax, labels=True, edges=EDGES_KB):
    """Dashed verticals at cache/TLB limits; labels sit above the plot area, clear of data."""
    for kb, name in edges:
        ax.axvline(kb, color=MUTED, lw=0.8, ls="--", zorder=0)
        if labels:
            ax.text(kb, 1.01, name, transform=ax.get_xaxis_transform(),
                    va="bottom", ha="center", fontsize=7, color=INK2)
    if labels:
        ax.set_title(ax.get_title(), pad=28)


def line(ax, x, m, s, i, label, **kw):
    ax.errorbar(x, m, yerr=s, color=C[i], marker="o", label=label, ecolor=C[i], elinewidth=1, **kw)


def save(fig, name):
    path = os.path.join(PLOTS, name)
    fig.savefig(path)
    plt.close(fig)
    print("wrote", os.path.relpath(path, ROOT))


# ---------------------------------------------------------------------------
# Figures
# ---------------------------------------------------------------------------
def fig_zeroq(D, P):
    rows = load(D, "zeroq.csv")
    s = summarize(rows, ["level", "page"], ["mean_ns", "cycles"], "zeroq_summary.csv", P)
    levels = ["L1", "L2", "L3", "DRAM"]
    pages = [p for p in ("4K", "2M") if any(k[1] == p for k in s)]
    fig, ax = plt.subplots(figsize=(6.4, 3.6))
    w = 0.38
    for j, p in enumerate(pages):
        xs = np.arange(len(levels)) + (j - (len(pages) - 1) / 2) * w
        ms = [s[(L, p)]["mean_ns"][0] for L in levels]
        sd = [s[(L, p)]["mean_ns"][1] for L in levels]
        cyc = [s[(L, p)]["cycles"][0] for L in levels]
        ax.bar(xs, ms, w * 0.92, yerr=sd, color=C[j], label=f"{p} pages", zorder=2)
        for x, m, c in zip(xs, ms, cyc):
            ax.text(x, m * 1.15, f"{m:.3g} ns\n{c:.0f} cyc", ha="center", va="bottom", fontsize=7, color=INK)
    ax.set_yscale("log")
    ax.set_ylim(0.5, 2000)
    ax.set_xticks(range(len(levels)))
    ax.set_xticklabels(["L1 (16 KB)", "L2 (256 KB)", "L3 (4 MB)", "DRAM (1 GB)"])
    ax.set_ylabel("load-to-use latency (ns, log)")
    ax.set_title("Zero-queue latency per level (random pointer chase, 1 miss in flight)")
    ax.legend(loc="upper left")
    ax.grid(axis="x", visible=False)
    save(fig, "01_zeroq.png")


def fig_wss(D, P):
    lat = summarize(load(D, "wss_lat.csv"), ["size_KB"], ["mean_ns", "cycles"], "wss_lat_summary.csv", P)
    bw = summarize(load(D, "wss_bw.csv"), ["size_KB"], ["GBps", "bytes_per_cycle"], "wss_bw_summary.csv", P)
    fig, (a, b) = plt.subplots(2, 1, figsize=(7.2, 6.2), sharex=True)
    x, m, s = series(lat, {}, 0, "mean_ns")
    line(a, x, m, s, 0, "random pointer chase")
    a.set_yscale("log")
    a.set_ylabel("latency (ns, log)")
    a.set_title("Working-set sweep: latency (top) and sequential read bandwidth (bottom), 1 thread")
    cache_edges(a)
    x, m, s = series(bw, {}, 0, "GBps")
    line(b, x, m, s, 1, "sequential read")
    b.set_ylabel("bandwidth (GB/s)")
    b.set_ylim(bottom=0)
    cache_edges(b, labels=False)
    log2_kb_axis(b, [4, 16, 64, 256, 1024, 4096, 16384, 65536, 262144, 1048576])
    b.set_xlabel("working set")
    save(fig, "05_wss.png")


def fig_pattern(D, P):
    lat = summarize(load(D, "pattern_lat.csv"), ["footprint_KB", "pattern", "stride_B"], ["mean_ns", "cycles"],
                    "pattern_lat_summary.csv", P)
    fps = sorted({k[0] for k in lat})
    names = {16: "L1-resident", 256: "L2-resident", 4096: "L3-resident", 65536: "DRAM"}
    fig, axes = plt.subplots(1, len(fps), figsize=(10, 3.2), sharey=True)
    for ax, fp in zip(axes, fps):
        for i, pat in enumerate(("sequential", "random")):
            x, m, s = series(lat, {0: fp, 1: pat}, 2, "mean_ns")
            line(ax, x, m, s, i, pat)
        ax.set_xscale("log", base=2)
        ax.set_xticks([64, 256, 1024]); ax.set_xticklabels(["64", "256", "1024"]); ax.minorticks_off()
        ax.set_title(f"{kb_label(fp)} of lines ({names.get(fp, '')})")
        ax.set_xlabel("stride (B)")
        ax.set_yscale("log")
    axes[0].set_ylabel("latency (ns, log)")
    axes[0].legend()
    fig.suptitle("Pattern x stride: pointer-chase latency (footprint = lines touched; array = lines x stride)", y=1.03)
    save(fig, "02a_pattern_latency.png")

    fig, axes = plt.subplots(1, 2, figsize=(8, 3.2), sharey=True)
    for ax, t in zip(axes, (1, 8)):
        rows = load(D, f"pattern_bw_t{t}.csv")
        s = summarize(rows, ["pattern", "stride_B"], ["line_GBps", "useful_GBps"], f"pattern_bw_t{t}_summary.csv", P)
        strides = [64, 256, 1024]
        w = 0.38
        for i, pat in enumerate(("sequential", "random")):
            ms = [s[(pat, st)]["line_GBps"][0] for st in strides]
            sd = [s[(pat, st)]["line_GBps"][1] for st in strides]
            xs = np.arange(3) + (i - 0.5) * w
            ax.bar(xs, ms, w * 0.92, yerr=sd, color=C[i], label=pat, zorder=2)
            for x_, m_, s_ in zip(xs, ms, sd):
                ax.text(x_, m_ + s_, f"{m_:.1f}", ha="center", va="bottom", fontsize=7)
        ax.set_xticks(range(3)); ax.set_xticklabels([f"{st} B" for st in strides])
        ax.set_title(f"{t} thread{'s' if t > 1 else ''}")
        ax.set_xlabel("stride (one 8 B load per stride)")
        ax.grid(axis="x", visible=False)
    axes[0].set_ylabel("cache-line bandwidth (GB/s)")
    axes[0].legend()
    fig.suptitle("Pattern x stride: DRAM read bandwidth (128 MB of lines)", y=1.03)
    save(fig, "02b_pattern_bandwidth.png")

    fig, axes = plt.subplots(1, 2, figsize=(8, 3.2))
    for ax, t in zip(axes, (1, 8)):
        s = summarize(load(D, f"pattern_gran_t{t}.csv"), ["pattern", "block_B"], ["GBps"],
                      f"pattern_gran_t{t}_summary.csv", P)
        for i, pat in enumerate(("sequential", "random")):
            x, m, sd = series(s, {0: pat}, 1, "GBps")
            line(ax, x, m, sd, i, pat)
        ax.set_xscale("log", base=2)
        ticks = [64, 256, 1024, 4096, 16384, 65536]
        ax.set_xticks(ticks); ax.set_xticklabels([f"{t_ // 1024} KB" if t_ >= 1024 else f"{t_} B" for t_ in ticks])
        ax.minorticks_off()
        ax.set_title(f"{t} thread{'s' if t > 1 else ''}")
        ax.set_xlabel("access granularity (contiguous block read)")
        ax.set_ylim(bottom=0)
    axes[0].set_ylabel("bandwidth (GB/s)")
    axes[0].legend()
    fig.suptitle("Granularity: bandwidth when 1 GB is read in blocks visited in order vs shuffled", y=1.03)
    save(fig, "02c_pattern_granularity.png")


def fig_rwmix(D, P):
    rows = load(D, "rwmix.csv")
    s = summarize(rows, ["mix", "threads"], ["app_GBps", "est_dram_GBps", "probe_ns"], "rwmix_summary.csv", P)
    mixes = ["100R", "70R30W", "50R50W", "100W"]
    fig, axes = plt.subplots(1, 3, figsize=(11, 3.4))
    for i, mx in enumerate(mixes):
        for ax, v in zip(axes, ("app_GBps", "est_dram_GBps", "probe_ns")):
            x, m, sd = series(s, {0: mx}, 1, v)
            line(ax, x, m, sd, i, mx)
    idle = s.get(("idle", 0), {}).get("probe_ns")
    if idle:
        axes[2].axhline(idle[0], color=MUTED, ls="--", lw=1)
        axes[2].text(1, idle[0], " idle", va="bottom", fontsize=7, color=INK2)
    titles = ["Bandwidth the program touched", "Estimated DRAM traffic (+1 RFO read per written line)",
              "Probe latency under that traffic"]
    ylabels = ["GB/s", "GB/s (estimate)", "probe latency (ns)"]
    for ax, t, yl in zip(axes, titles, ylabels):
        ax.set_title(t, fontsize=9)
        ax.set_xlabel("traffic threads (1 per core)")
        ax.set_ylabel(yl)
        ax.set_xticks([1, 2, 4, 8])
        ax.set_ylim(bottom=0)
    axes[0].legend(title="read/write mix")
    fig.suptitle("Read/write mix sweep (1 GB buffer, full-line reads and writes)", y=1.03)
    save(fig, "03_rwmix.png")


KNEE_FRAC = 0.9


def knee_index(bw, frac=KNEE_FRAC):
    """Knee = first point (in increasing load order) that reaches 'frac' of the peak
    throughput: past it, more concurrency buys little bandwidth and mostly adds latency."""
    peak = max(bw)
    for i, v in enumerate(bw):
        if v >= frac * peak:
            return i
    return None


def fig_intensity(D, P):
    variants = [("intensity_mlp_1GB_2m.csv", "1 GB, 2 MB pages"), ("intensity_mlp_64MB_2m.csv", "64 MB, 2 MB pages"),
                ("intensity_mlp_64MB_4k.csv", "64 MB, 4 KB pages"), ("intensity_mlp_1GB_4k.csv", "1 GB, 4 KB pages")]
    fig, (a, b) = plt.subplots(1, 2, figsize=(11, 4))
    notes = []
    for i, (fname, label) in enumerate(variants):
        rows = load(D, fname)
        if not rows:
            continue
        s = summarize(rows, ["chains"], ["latency_ns", "GBps"], fname.replace(".csv", "_summary.csv"), P)
        k, lat, lsd = series(s, {}, 0, "latency_ns")
        _, bw, bsd = series(s, {}, 0, "GBps")
        a.errorbar(bw, lat, xerr=bsd, yerr=lsd, color=C[i], marker="o", label=label, elinewidth=1)
        line(b, k, bw, bsd, i, label)
        j = knee_index(bw)
        if j is not None:
            a.plot(bw[j], lat[j], "o", ms=11, mfc="none", mec=C[i], mew=1.5)
            notes.append(f"{label}: knee at {k[j]:.0f} chains, {bw[j]:.1f} GB/s, {lat[j]:.0f} ns "
                         f"-> L = {bw[j]:.1f} GB/s / 64 B x {lat[j]:.0f} ns = {bw[j] / 64 * lat[j]:.1f}")
        if i == 0:
            for kk, x_, y_ in zip(k, bw, lat):
                if kk in (1, 8, 16, 24, 32):
                    a.annotate(f"{kk:.0f}", (x_, y_), textcoords="offset points", xytext=(4, -10), fontsize=7, color=INK2)
    a.set_xlabel("throughput (GB/s)")
    a.set_ylabel("latency per access (ns)")
    a.set_title(f"Latency vs throughput (labels: chains in flight; ring = knee, {KNEE_FRAC:.0%} of peak)", fontsize=9)
    a.set_yscale("log")
    a.legend(loc="upper right")
    b.set_xlabel("independent chains in flight (= concurrency L)")
    b.set_ylabel("throughput (GB/s)")
    b.set_title("Throughput vs concurrency: rises ~linearly until a limit", fontsize=9)
    b.set_ylim(bottom=0)
    fig.suptitle("Intensity sweep, one core (Little's Law: L = throughput x latency)", y=1.03)
    save(fig, "04a_intensity_mlp.png")
    with open(os.path.join(P, "intensity_knees.txt"), "w") as f:
        f.write("\n".join(notes) + "\n")
    for n in notes:
        print("  ", n)

    rows = load(D, "intensity_loaded.csv")
    if not rows:
        return
    s = summarize(rows, ["threads", "delay"], ["total_GBps", "probe_ns"], "intensity_loaded_summary.csv", P)
    tmax = max(k[0] for k in s)
    fig, ax = plt.subplots(figsize=(6.8, 4))
    idle = s[(0, 0)]
    pts_delay = sorted((s[k]["total_GBps"][0], s[k]["probe_ns"][0], s[k]["probe_ns"][1], k[1])
                       for k in s if k[0] == tmax)
    pts_thr = sorted((s[k]["total_GBps"][0], s[k]["probe_ns"][0], s[k]["probe_ns"][1], k[0])
                     for k in s if k[1] == 0 and 0 < k[0])
    for i, (pts, label) in enumerate(((pts_delay, f"{tmax} threads, delay swept"), (pts_thr, "delay 0, threads swept"))):
        x, y, e, _ = zip(*pts)
        ax.errorbar(x, y, yerr=e, color=C[i], marker="o", label=label, elinewidth=1)
    ax.plot(idle["total_GBps"][0], idle["probe_ns"][0], "s", color=INK2, label="idle (probe only)")
    # Knee on the delay-swept curve (one series, load rising monotonically)
    j = knee_index([p[0] for p in pts_delay])
    if j is not None:
        xk, yk = pts_delay[j][0], pts_delay[j][1]
        ax.plot(xk, yk, "o", ms=12, mfc="none", mec=INK, mew=1.2)
        note = (f"knee ({KNEE_FRAC:.0%} of peak) ~{xk:.0f} GB/s, {yk:.0f} ns\n"
                f"L = {xk:.0f} GB/s / 64 B x {yk:.0f} ns = {xk / 64 * yk:.0f} lines in flight")
        lo = idle["probe_ns"][0]                       # empty lower-right corner of the plot
        ax.annotate(note, (xk, yk), xytext=(0.97 * xk, lo + 0.12 * (yk - lo)), textcoords="data",
                    ha="right", fontsize=8, arrowprops=dict(arrowstyle="-", color=MUTED))
        with open(os.path.join(P, "intensity_knees.txt"), "a") as f:
            f.write("loaded: " + note.replace("\n", " ") + "\n")
        print("   loaded:", note.replace("\n", " "))
    ax.set_xlabel("total memory throughput (GB/s)")
    ax.set_ylabel("probe latency (ns)")
    ax.set_title("Loaded latency (MLC-style): probe chase while read streams add load")
    ax.legend(loc="upper left")
    save(fig, "04b_intensity_loaded.png")


def fig_cachemiss(D, P):
    t = summarize(load(D, "cachemiss.csv"), ["pattern", "footprint_KB"], ["ns_per_elem", "cycles_per_elem"],
                  "cachemiss_summary.csv", P)
    rows = load(D, "cachemiss_counters.csv") or []
    for r in rows:
        r["pattern"] = {"seq": "sequential", "rand": "random"}.get(r["pattern"], r["pattern"])
        # L2 misses not explained by data refills from L3 or DRAM (candidate: page-table loads)
        r["walk_l2_excess_per_elem"] = (r["l2_misses_from_l1d_per_elem"] - r["l1d_refills_from_dram_g1_per_elem"]
                                        - r["l1d_refills_from_l3_or_other_ccx_per_elem"])
    cv = ["ns_per_elem", "l1d_refills_from_l2_per_elem", "l1d_refills_from_l3_or_other_ccx_per_elem",
          "l1d_refills_from_dram_g1_per_elem", "l1_dtlb_misses_per_elem", "l2_dtlb_misses_per_elem",
          "l2_misses_from_l1d_per_elem", "walk_l2_excess_per_elem", "ipc"]
    c = summarize(rows, ["pattern", "footprint_KB"], cv, "cachemiss_counters_summary.csv", P)

    fig, axes = plt.subplots(1, 3, figsize=(13, 3.8))
    a, b, d = axes
    for i, pat in enumerate(("sequential", "random")):
        x, m, s = series(t, {0: pat}, 1, "ns_per_elem")
        line(a, x, m, s, i, pat)
    a.set_yscale("log"); a.set_ylabel("ns per element (log)")
    a.set_title("SAXPY runtime vs footprint", fontsize=9)
    cache_edges(a, edges=EDGES_SHORT)
    for i, (v, lab) in enumerate((("l1d_refills_from_l2_per_elem", "L1 refill from L2"),
                                  ("l1d_refills_from_l3_or_other_ccx_per_elem", "L1 refill from L3"),
                                  ("l1d_refills_from_dram_g1_per_elem", "L1 refill from DRAM"),
                                  ("l2_dtlb_misses_per_elem", "L2 DTLB miss (page walk)"))):
        x, m, s = series(c, {0: "random"}, 1, v)
        line(b, x, m, s, i, lab)
    b.set_ylabel("events per element")
    b.set_title("Random: where each miss is served (PCM)", fontsize=9)
    b.legend(loc="upper left")
    cache_edges(b, edges=EDGES_SHORT)
    for ax in (a, b):
        log2_kb_axis(ax, [16, 64, 256, 1024, 4096, 16384, 65536, 262144, 1048576])
        ax.set_xlabel("footprint of x + y")
    # Page-walk evidence: L2 misses beyond DRAM refills vs page walks
    _, ex, exs = series(c, {0: "random"}, 1, "walk_l2_excess_per_elem")
    fp, wk, wks = series(c, {0: "random"}, 1, "l2_dtlb_misses_per_elem")
    d.errorbar(wk, ex, xerr=wks, yerr=exs, color=C[0], marker="o", ls="none", elinewidth=1)
    lim = max(1.0, float(np.nanmax(np.r_[wk, ex])) * 1.1)
    d.plot([0, lim], [0, lim], color=MUTED, ls="--", lw=1, label="y = x")
    for f_, x_, y_ in zip(fp, wk, ex):
        if x_ > 0.05:
            d.annotate(kb_label(f_), (x_, y_), textcoords="offset points", xytext=(5, -10), fontsize=7, color=INK2)
    d.set_xlabel("L2 DTLB misses per element")
    d.set_ylabel("L2 misses - (L3 + DRAM refills), per element")
    d.set_title("Excess L2 misses = page walks", fontsize=9, pad=28)
    d.legend(loc="upper left")
    fig.suptitle("Cache-miss impact: runtime tracks where misses are served "
                 "(random also streams an index array = +50% footprint)", y=1.08)
    save(fig, "06_cachemiss.png")


def fig_tlb(D, P):
    pg = summarize(load(D, "tlb_pages.csv"), ["page", "span_KB"], ["mean_ns", "cycles"], "tlb_pages_summary.csv", P)
    cnt = load(D, "tlb_counters.csv") or []
    cv = ["ns_per_hop", "l1_dtlb_misses_per_hop", "l2_dtlb_misses_per_hop", "l2_misses_from_l1d_per_hop",
          "l1d_refills_from_dram_g1_per_hop"]
    c = summarize(cnt, ["page", "span_KB"], cv, "tlb_counters_summary.csv", P)
    reach = TLB_REACH

    fig, axes = plt.subplots(1, 3, figsize=(13, 3.8))
    a, b, d = axes
    for i, p in enumerate(("4K", "2M")):
        x, m, s = series(pg, {0: p}, 1, "mean_ns")
        line(a, x, m, s, i, f"{p} pages")
    a.set_yscale("log"); a.set_ylabel("ns per hop (log)")
    a.set_title("Chase with one line per 4 KB page", fontsize=9)
    a.legend(loc="upper left")
    cache_edges(a, edges=reach)
    labels = [("l1_dtlb_misses_per_hop", "4K", "L1 DTLB miss, 4K"), ("l2_dtlb_misses_per_hop", "4K", "L2 DTLB miss, 4K"),
              ("l2_dtlb_misses_per_hop", "2M", "L2 DTLB miss, 2M")]
    for i, (v, p, lab) in enumerate(labels):
        x, m, s = series(c, {0: p}, 1, v)
        line(b, x, m, s, [0, 2, 1][i], lab, ls="-" if p == "4K" else ":")
    b.set_ylabel("misses per hop")
    b.set_title("DTLB misses (PCM counters)", fontsize=9)
    b.legend(loc="upper left")
    cache_edges(b, edges=reach)
    x4, m4, s4 = series(pg, {0: "4K"}, 1, "mean_ns")
    x2, m2, s2 = series(pg, {0: "2M"}, 1, "mean_ns")
    common = sorted(set(x4) & set(x2))
    diff = [m4[list(x4).index(x)] - m2[list(x2).index(x)] for x in common]
    err = [math.hypot(s4[list(x4).index(x)], s2[list(x2).index(x)]) for x in common]
    line(d, np.array(common), np.array(diff), np.array(err), 0, "4K - 2M")
    d.axhline(0, color=MUTED, lw=0.8)
    d.set_ylabel("extra ns per hop on 4 KB pages")
    d.set_title("Translation cost = 4K latency - 2M latency", fontsize=9)
    cache_edges(d, edges=reach)
    for ax in axes:
        log2_kb_axis(ax, [64, 256, 1024, 4096, 16384, 65536, 262144, 1048576])
        ax.set_xlabel("span (pages x 4 KB); lines touched = span / 64")
    fig.suptitle("TLB-miss impact: same nodes on 4 KB vs 2 MB pages", y=1.08)
    save(fig, "07a_tlb_pages.png")

    loc = summarize(load(D, "tlb_locality.csv"), ["page", "lines_per_page"], ["mean_ns"], "tlb_locality_summary.csv", P)
    fig, ax = plt.subplots(figsize=(5.6, 3.6))
    for i, p in enumerate(("4K", "2M")):
        x, m, s = series(loc, {0: p}, 1, "mean_ns")
        line(ax, x, m, s, i, f"{p} pages")
    ax.set_xscale("log", base=2)
    ax.set_xticks([1, 2, 4, 8, 16, 32, 64]); ax.set_xticklabels(["1", "2", "4", "8", "16", "32", "64"]); ax.minorticks_off()
    ax.set_xlabel("lines used per 4 KB page (16384 lines total)")
    ax.set_ylabel("ns per hop")
    ax.set_ylim(bottom=0)
    ax.set_title("Page locality: same 1 MB of lines packed into fewer pages")
    ax.legend()
    save(fig, "07b_tlb_locality.png")


def fig_pitfalls(D, P):
    fig, axes = plt.subplots(2, 3, figsize=(13, 7))
    reuse = summarize(load(D, "pitfall_reuse.csv"), ["test", "config"], ["value"], "pitfall_reuse_summary.csv", P)

    def hbars(ax, keys, labels, colors, unit, title):
        ms = [reuse[k]["value"][0] for k in keys]
        sd = [reuse[k]["value"][1] for k in keys]
        y = np.arange(len(keys))
        ax.barh(y, ms, xerr=sd, color=colors, height=0.6, zorder=2)
        ax.set_yticks(y); ax.set_yticklabels(labels)
        for y_, m_, s_ in zip(y, ms, sd):
            ax.text(m_ + s_, y_, f"  {m_:.3g} {unit}", va="center", fontsize=8)
        ax.set_title(title, fontsize=9)
        ax.grid(axis="y", visible=False)
        ax.set_xlim(0, max(m_ + s_ for m_, s_ in zip(ms, sd)) * 1.4)

    hbars(axes[0, 0], [("bandwidth", "naive_4MB_reused"), ("bandwidth", "correct_1GB_single_pass")],
          ["re-read 4 MB\n(naive)", "1 GB, one pass\n(correct)"], [C[1], C[0]], "GB/s", "Cache reuse: 'DRAM' bandwidth")
    hbars(axes[0, 1], [("latency", "naive_sequential_chain_1GB"), ("latency", "naive_random_chain_4MB"),
                       ("latency", "correct_random_chain_1GB")],
          ["sequential chain\n1 GB (naive)", "random chain\n4 MB (naive)", "random chain\n1 GB (correct)"],
          [C[1], C[1], C[0]], "ns", "Cache reuse / prefetch: 'DRAM' latency")

    pin = summarize(load(D, "pitfall_pin.csv"), ["config"], ["GBps"], "pitfall_pin_summary.csv", P)
    order = ["one_cpu", "smt_pairs", "spread", "os"]
    names = ["all on 1 CPU\n(old dram.cpp)", "2 per core\n(SMT siblings)", "1 per core\n(pinned)", "Windows\nchooses"]
    ax = axes[0, 2]
    ms = [pin[(o,)]["GBps"][0] for o in order]
    sd = [pin[(o,)]["GBps"][1] for o in order]
    ax.bar(range(4), ms, yerr=sd, color=[C[1], C[1], C[0], C[2]], zorder=2)
    for i, (m, s_) in enumerate(zip(ms, sd)):
        ax.text(i, m + s_ + 0.5, f"{m:.1f}", ha="center", va="bottom", fontsize=8)
    ax.set_xticks(range(4)); ax.set_xticklabels(names, fontsize=7)
    ax.set_ylabel("read bandwidth, 8 threads (GB/s)")
    ax.set_title("Thread placement", fontsize=9)
    ax.grid(axis="x", visible=False)

    addr = summarize(load(D, "pitfall_addr.csv"), ["size_KB", "mode"], ["cycles", "mean_ns"], "pitfall_addr_summary.csv", P)
    ax = axes[1, 0]
    sizes = sorted({k[0] for k in addr})
    w = 0.38
    for i, mode in enumerate(("ptr", "idx")):
        ms = [addr[(sz, mode)]["cycles"][0] for sz in sizes]
        xs = np.arange(len(sizes)) + (i - 0.5) * w
        ax.bar(xs, ms, w * 0.92, color=C[i], label={"ptr": "p = *p (address)", "idx": "i = a[i] (index)"}[mode], zorder=2)
        for x_, m_ in zip(xs, ms):
            ax.text(x_, m_, f"{m_:.3g}", ha="center", va="bottom", fontsize=7)
    ax.set_yscale("log")
    ax.set_xticks(range(len(sizes))); ax.set_xticklabels([kb_label(s_) for s_ in sizes])
    ax.set_ylabel("cycles per hop (log)")
    ax.set_title("Chase encoding: index form adds a cycle at L1/L2", fontsize=9)
    ax.legend(loc="upper left")
    ax.grid(axis="x", visible=False)

    fr = load(D, "pitfall_freq.csv")
    t = np.array([r["t_ms"] for r in fr])
    for ax, v, lab, i in ((axes[1, 1], "ghz", "measured core clock (GHz)", 0),
                          (axes[1, 2], "l1_chase_ns", "L1 chase latency (ns)", 1)):
        ax.plot(t, [r[v] for r in fr], color=C[i], lw=1)
        ax.set_xlabel("time after 3 s idle (ms)")
        ax.set_ylabel(lab)
    axes[1, 1].set_title("Clock right after idle", fontsize=9)
    axes[1, 2].set_title("Same window: L1 latency in ns follows the clock", fontsize=9)
    fig.suptitle("Benchmark pitfalls (orange = misleading setup, blue = correct)", y=1.0)
    fig.tight_layout()
    save(fig, "08_pitfalls.png")


def fig_alias(D, P):
    rows = load(D, "alias_check.csv")
    if not rows:
        return
    summarize(rows, ["footprint_KB", "layout", "xy_offset_mod4096"], ["ns_per_elem"], "alias_check_summary.csv", P)
    sizes = sorted({r["footprint_KB"] for r in rows})
    fig, axes = plt.subplots(1, len(sizes), figsize=(4 * len(sizes), 3.4), sharey=True)
    rng = np.random.default_rng(0)
    for ax, sz in zip(np.atleast_1d(axes), sizes):
        cats = []
        for r in rows:
            if r["footprint_KB"] != sz:
                continue
            cat = f"heap ({r['xy_offset_mod4096']})" if r["layout"] == "heap" else f"{r['xy_offset_mod4096']}"
            if cat not in cats:
                cats.append(cat)
            xi = cats.index(cat)
            ax.plot(xi + rng.uniform(-0.15, 0.15), r["ns_per_elem"], "o", color=C[0] if r["layout"] == "heap" else C[1],
                    ms=5, alpha=0.85)
        ax.set_xticks(range(len(cats))); ax.set_xticklabels(cats, rotation=30)
        ax.set_xlabel("(y - x) mod 4096 (bytes)")
        ax.set_title(f"{kb_label(sz)} random SAXPY", fontsize=9)
        ax.set_ylim(0, 1.1 * max(r["ns_per_elem"] for r in rows))
    np.atleast_1d(axes)[0].set_ylabel("ns per element (one dot = one process)")
    fig.suptitle("Bimodal speed persists at every fixed x/y offset: 4K aliasing is ruled out", y=1.03)
    save(fig, "09_alias_check.png")


# ---------------------------------------------------------------------------
# Hypervisor on vs off
# ---------------------------------------------------------------------------
def metric(data_dir, fname, match, val):
    rows = load(data_dir, fname)
    if not rows:
        return None
    xs = [float(r[val]) for r in rows if all(r.get(k) == v for k, v in match.items())]
    return (float(np.mean(xs)), float(np.std(xs, ddof=1)) if len(xs) > 1 else 0.0) if xs else None


def fig_hv(D, B, P):
    # (label, file in new set, file in old set, match, value, higher_is_better)
    M = [
        ("L1 latency (ns)", "zeroq.csv", "zeroq.csv", {"level": "L1", "page": "4K"}, "mean_ns", False),
        ("L3 latency (ns)", "zeroq.csv", "zeroq.csv", {"level": "L3", "page": "4K"}, "mean_ns", False),
        ("DRAM latency, 4K pages (ns)", "zeroq.csv", "zeroq.csv", {"level": "DRAM", "page": "4K"}, "mean_ns", False),
        ("DRAM latency, 2M pages (ns)", "zeroq.csv", "zeroq.csv", {"level": "DRAM", "page": "2M"}, "mean_ns", False),
        ("TLB chase 1 GB, 4K (ns/hop)", "tlb_pages.csv", "tlb_pages.csv", {"page": "4K", "pages_4K": 262144}, "mean_ns", False),
        ("TLB chase 1 GB, 2M (ns/hop)", "tlb_pages.csv", "tlb_pages.csv", {"page": "2M", "pages_4K": 262144}, "mean_ns", False),
        ("Seq read 1 thread (GB/s)", "pattern_bw_t1.csv", "pattern_bw_t1.csv", {"pattern": "sequential", "stride_B": 64}, "line_GBps", True),
        ("Random read 1 thread (GB/s)", "pattern_bw_t1.csv", "pattern_bw_t1.csv", {"pattern": "random", "stride_B": 64}, "line_GBps", True),
        ("Read 8 threads (GB/s)", "rwmix.csv", "rwmix.csv", {"mix": "100R", "threads": 8}, "app_GBps", True),
        ("Write 8 threads (GB/s)", "rwmix.csv", "rwmix.csv", {"mix": "100W", "threads": 8}, "app_GBps", True),
        ("MLP 1 GB 2M, 32 chains (GB/s)", "intensity_mlp_1GB_2m.csv", "intensity_mlp_1GB.csv", {"chains": 32}, "GBps", True),
        ("SAXPY random 1 GB (ns/elem)", "cachemiss.csv", "cachemiss.csv", {"pattern": "random", "footprint_KB": 1048576}, "ns_per_elem", False),
        ("SAXPY random 4 MB (ns/elem)", "cachemiss.csv", "cachemiss.csv", {"pattern": "random", "footprint_KB": 4096}, "ns_per_elem", False),
    ]
    out = []
    for label, fn_new, fn_old, match, val, hib in M:
        new, old = metric(D, fn_new, match, val), metric(B, fn_old, match, val)
        if new and old:
            pct = 100 * (new[0] - old[0]) / old[0]
            out.append((label, old[0], old[1], new[0], new[1], pct, hib))
    with open(os.path.join(P, "hv_compare.csv"), "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["metric", "hv_on_mean", "hv_on_sd", "hv_off_mean", "hv_off_sd", "change_pct", "higher_is_better"])
        for r in out:
            w.writerow([r[0]] + [f"{v:.6g}" for v in r[1:6]] + [r[6]])
    if not out:
        return
    fig, ax = plt.subplots(figsize=(7.5, 0.38 * len(out) + 1.2))
    y = np.arange(len(out))[::-1]
    pct = [r[5] for r in out]
    ax.barh(y, pct, color=C[0], height=0.6, zorder=2)
    ax.axvline(0, color=INK2, lw=0.8)
    for y_, r in zip(y, out):
        ax.text(r[5], y_, f" {r[5]:+.1f}%  ({r[1]:.3g} -> {r[3]:.3g})", va="center",
                ha="left" if r[5] >= 0 else "right", fontsize=7)
    ax.set_yticks(y); ax.set_yticklabels([r[0] for r in out])
    lim = max(10, max(abs(p) for p in pct) * 1.8)
    ax.set_xlim(-lim, lim)
    ax.set_xlabel("change with hypervisor OFF vs ON (%)")
    ax.set_title("Hypervisor (VBS / WSL2) on vs off: same binaries, same machine")
    ax.grid(axis="y", visible=False)
    save(fig, "10_hv_compare.png")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", default=os.path.join(ROOT, "data", "raw"))
    ap.add_argument("--compare", default=os.path.join(ROOT, "data", "hv_on"))
    args = ap.parse_args()
    P = os.path.join(ROOT, "data", "processed")
    os.makedirs(P, exist_ok=True)
    os.makedirs(PLOTS, exist_ok=True)
    for f in (fig_zeroq, fig_pattern, fig_rwmix, fig_intensity, fig_wss, fig_cachemiss, fig_tlb, fig_pitfalls, fig_alias):
        try:
            f(args.data, P)
        except Exception as e:                       # one bad file should not stop the rest
            print(f"!! {f.__name__} failed: {type(e).__name__}: {e}")
    if os.path.isdir(args.compare):
        try:
            fig_hv(args.data, args.compare, P)
        except Exception as e:
            print(f"!! fig_hv failed: {type(e).__name__}: {e}")


if __name__ == "__main__":
    main()
