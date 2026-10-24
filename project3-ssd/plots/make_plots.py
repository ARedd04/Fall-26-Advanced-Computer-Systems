"""make_plots.py - parse fio output and plot every Project 3 (SSD profiling) experiment

Usage (from the Project3 folder):
    py -3.12 plots\\make_plots.py

Reads data/raw/<section>/*.json (fio --output-format=json) and the per-second logs of the
state section, and writes
    data/processed/parsed.csv        one row per job x run x direction (read/write)
    data/processed/*_summary.csv     median / min / max across runs per configuration
    data/processed/littles_law.csv   QD vs IOPS x mean latency
    plots/*.png                      one figure per required experiment
Central value = median of the runs, error bars = min..max. Latency percentiles are fio's
completion-latency (clat) percentiles; "mean latency" is fio's total latency (submit +
completion), which is what Little's Law relates to queue depth.
"""
import csv
import glob
import json
import os
import re
from collections import defaultdict

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

C = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100", "#e87ba4", "#008300", "#6250d6", "#e34948"]
INK, INK2, MUTED, GRID = "#0b0b0b", "#52514e", "#8a8984", "#e4e3df"
PCTS = ["50", "95", "99", "99.9", "99.99"]
KNEE_FRAC = 0.9
# Interface / device ceilings for annotation: PCIe 3.0 x4 payload ~3.94 GB/s; 970 EVO Plus 1TB
# datasheet: 3500 MB/s sequential read, 3300 MB/s sequential write (in the SLC cache)
PCIE3X4_MBPS = 3940

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
RAW = os.path.join(ROOT, "data", "raw")
PROC = os.path.join(ROOT, "data", "processed")
PLOTS = os.path.join(ROOT, "plots")


# ---------------------------------------------------------------------------
# Parsing
# ---------------------------------------------------------------------------
def size_bytes(s):
    m = re.fullmatch(r"(\d+)([kmg]?)", str(s).strip().lower())
    return int(m.group(1)) * {"": 1, "k": 1024, "m": 1 << 20, "g": 1 << 30}[m.group(2)] if m else None


def parse_all():
    rows = []
    for path in sorted(glob.glob(os.path.join(RAW, "*", "*.json"))):
        section = os.path.basename(os.path.dirname(path))
        m = re.match(r"(.+)_r(\d+)\.json$", os.path.basename(path))
        if not m:
            continue
        job_name, run = m.group(1), int(m.group(2))
        with open(path) as f:
            text = f.read()
        text = text[text.find("{"):]                  # fio may print notes before the JSON
        try:
            d = json.loads(text)
        except json.JSONDecodeError:
            print("!! unreadable:", path)
            continue
        opts = dict(d.get("global options", {}))
        job = d["jobs"][0]
        opts.update(job.get("job options", {}))
        for direction in ("read", "write"):
            r = job[direction]
            if r.get("io_bytes", 0) == 0:
                continue
            pct = r.get("clat_ns", {}).get("percentile", {})
            row = {
                "section": section, "job": job_name, "run": run, "dir": direction,
                "rw": opts.get("rw"), "bs": opts.get("bs"), "bs_bytes": size_bytes(opts.get("bs")),
                "iodepth": int(opts.get("iodepth", 1)), "numjobs": int(opts.get("numjobs", 1)),
                "rwmixread": opts.get("rwmixread", ""), "size": opts.get("size"),
                "ioengine": opts.get("ioengine"), "direct": opts.get("direct"),
                "iops": r["iops"], "MBps": r["bw_bytes"] / 1e6,
                "lat_mean_us": r["lat_ns"]["mean"] / 1e3, "clat_mean_us": r["clat_ns"]["mean"] / 1e3,
                "lat_max_us": r["lat_ns"]["max"] / 1e3,
            }
            for p in PCTS:
                key = next((k for k in pct if abs(float(k) - float(p)) < 1e-6), None)
                row[f"p{p}_us"] = pct[key] / 1e3 if key else np.nan
            rows.append(row)
    os.makedirs(PROC, exist_ok=True)
    if rows:
        with open(os.path.join(PROC, "parsed.csv"), "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
            w.writeheader()
            w.writerows(rows)
    print(f"parsed {len(rows)} job/run/direction rows -> data/processed/parsed.csv")
    return rows


def agg(rows, keys, vals, out_name=None):
    g = defaultdict(lambda: defaultdict(list))
    for r in rows:
        k = tuple(r[c] for c in keys)
        for v in vals:
            if r.get(v) is not None and not (isinstance(r[v], float) and np.isnan(r[v])):
                g[k][v].append(float(r[v]))
    out = {k: {v: (float(np.median(x)), min(x), max(x), len(x)) for v, x in d.items()} for k, d in g.items()}
    if out_name:
        with open(os.path.join(PROC, out_name), "w", newline="") as f:
            w = csv.writer(f)
            w.writerow(list(keys) + [f"{v}_{s}" for v in vals for s in ("median", "min", "max")] + ["n_runs"])
            for k in sorted(out, key=lambda t: [str(x).zfill(12) for x in t]):
                w.writerow(list(k) + [f"{out[k][v][i]:.6g}" if v in out[k] else "" for v in vals for i in range(3)]
                           + [max(out[k][v][3] for v in out[k])])
    return out


def sel(rows, **kw):
    return [r for r in rows if all(r.get(k) == v for k, v in kw.items())]


def med(s, k, v):
    return s[k][v] if k in s and v in s[k] else (np.nan, np.nan, np.nan, 0)


def err(t):
    return [[t[0] - t[1]], [t[2] - t[0]]]


def save(fig, name):
    fig.savefig(os.path.join(PLOTS, name))
    plt.close(fig)
    print("wrote plots/" + name)


def bs_label(b):
    return f"{b // (1 << 20)}M" if b >= 1 << 20 else f"{b // 1024}K"


def knee_index(values, frac=KNEE_FRAC):
    peak = max(values)
    return next(i for i, v in enumerate(values) if v >= frac * peak)


# ---------------------------------------------------------------------------
# Figures
# ---------------------------------------------------------------------------
def fig_qd1(rows):
    q = sel(rows, section="qd1")
    s = agg(q, ["job", "dir"], ["lat_mean_us"] + [f"p{p}_us" for p in PCTS] + ["iops", "MBps"], "qd1_summary.csv")
    jobs = [("randread_4k_qd1", "read", "4K random read"), ("randwrite_4k_qd1", "write", "4K random write"),
            ("seqread_128k_qd1", "read", "128K seq read"), ("seqwrite_128k_qd1", "write", "128K seq write")]
    stats = [("lat_mean_us", "mean"), ("p50_us", "p50"), ("p95_us", "p95"), ("p99_us", "p99"), ("p99.9_us", "p99.9")]
    fig, ax = plt.subplots(figsize=(9, 4))
    w = 0.16
    for i, (v, lab) in enumerate(stats):
        xs = np.arange(len(jobs)) + (i - 2) * w
        vals = [med(s, (j, d), v) for j, d, _ in jobs]
        ax.bar(xs, [t[0] for t in vals], w * 0.92, color=C[i], label=lab, zorder=2,
               yerr=[[t[0] - t[1] for t in vals], [t[2] - t[0] for t in vals]])
        for x_, t in zip(xs, vals):
            ax.text(x_, t[2] * 1.05, f"{t[0]:.0f}", ha="center", va="bottom", fontsize=6.5, rotation=90)
    ax.set_yscale("log")
    top = max(med(s, (j, d), "p99.9_us")[2] for j, d, _ in jobs)
    ax.set_ylim(top=top * 4)                          # room for the rotated value labels and legend
    ax.set_xticks(range(len(jobs)))
    ax.set_xticklabels([f"{lab}\n{med(s, (j, d), 'iops')[0]:,.0f} IOPS" for j, d, lab in jobs])
    ax.set_ylabel("latency (us, log)")
    ax.set_title("QD=1 latency (1 job, direct I/O): mean and completion-latency percentiles")
    ax.legend(ncol=5, loc="upper left")
    ax.grid(axis="x", visible=False)
    save(fig, "01_qd1_latency.png")


def fig_bs(rows):
    b = sel(rows, section="bs")
    s = agg(b, ["rw", "bs_bytes"], ["MBps", "iops", "lat_mean_us", "p99_us"], "bs_summary.csv")
    fig, axes = plt.subplots(1, 3, figsize=(14, 3.9))
    for i, (rw, lab) in enumerate((("randread", "random read"), ("read", "sequential read"))):
        xs = sorted(k[1] for k in s if k[0] == rw)
        for ax, v in zip(axes, ("MBps", "iops", "lat_mean_us")):
            t = [s[(rw, x)][v] for x in xs]
            ax.errorbar(xs, [a[0] for a in t], yerr=[[a[0] - a[1] for a in t], [a[2] - a[0] for a in t]],
                        color=C[i], marker="o", label=lab, elinewidth=1)
            if v == "lat_mean_us":
                ax.plot(xs, [s[(rw, x)]["p99_us"][0] for x in xs], color=C[i], ls="--", marker=".", label=f"{lab} p99")
    axes[0].axhline(PCIE3X4_MBPS, color=MUTED, ls=":", lw=1)
    axes[0].text(4096, PCIE3X4_MBPS, " PCIe 3.0 x4 ceiling ~3.9 GB/s", va="bottom", fontsize=7, color=INK2)
    for ax, yl, t in zip(axes, ("MB/s", "IOPS", "latency (us)"),
                         ("Throughput", "IOPS", "Mean latency (solid) and p99 (dashed)")):
        ax.set_xscale("log", base=2)
        ticks = [4096 << i for i in range(9)]
        ax.set_xticks(ticks); ax.set_xticklabels([bs_label(x) for x in ticks]); ax.minorticks_off()
        ax.set_xlabel("block size"); ax.set_ylabel(yl); ax.set_title(t)
    axes[1].set_yscale("log"); axes[2].set_yscale("log")
    axes[0].set_ylim(0, PCIE3X4_MBPS * 1.12)
    axes[0].legend(loc="lower right"); axes[2].legend(loc="upper left")
    fig.suptitle("Block-size sweep, reads, 4 jobs x QD 8 (throughput and latency from the same runs)", y=1.03)
    save(fig, "02_blocksize.png")


def fig_mix(rows):
    m = sel(rows, section="mix")
    for r in m:
        r["mix"] = int(r["rwmixread"])
    s = agg(m, ["mix", "dir"], ["iops", "MBps", "lat_mean_us", "p99_us"], "mix_summary.csv")
    mixes = [100, 70, 50, 0]
    labels = ["100R", "70R/30W", "50R/50W", "100W"]
    fig, (a, b) = plt.subplots(1, 2, figsize=(11, 3.8))
    bottom = np.zeros(len(mixes))
    for i, d in enumerate(("read", "write")):
        v = np.array([med(s, (x, d), "iops")[0] if (x, d) in s else 0 for x in mixes])
        a.bar(range(len(mixes)), v / 1e3, 0.6, bottom=bottom / 1e3, color=C[i], label=d, zorder=2)
        bottom += v
    for x_, t in enumerate(bottom):
        a.text(x_, t / 1e3, f"{t / 1e3:.0f}K", ha="center", va="bottom", fontsize=8)
    a.set_xticks(range(len(mixes))); a.set_xticklabels(labels)
    a.set_ylabel("IOPS (thousands)"); a.set_title("Total IOPS (stacked read + write)")
    a.legend(); a.grid(axis="x", visible=False)
    for i, d in enumerate(("read", "write")):
        xs = [j for j, x in enumerate(mixes) if (x, d) in s]
        b.plot(xs, [s[(mixes[j], d)]["lat_mean_us"][0] for j in xs], color=C[i], marker="o", label=f"{d} mean")
        b.plot(xs, [s[(mixes[j], d)]["p99_us"][0] for j in xs], color=C[i], marker=".", ls="--", label=f"{d} p99")
    b.set_xticks(range(len(mixes))); b.set_xticklabels(labels)
    b.set_ylabel("latency (us)"); b.set_title("Latency per direction"); b.legend(); b.set_ylim(bottom=0)
    fig.suptitle("Read/write mix, 4K random, 4 jobs x QD 8", y=1.03)
    save(fig, "03_rwmix.png")


def fig_qd(rows):
    q = sel(rows, section="qd")
    for r in q:
        r["total_qd"] = r["iodepth"] * r["numjobs"]
        r["littles_L"] = r["iops"] * r["lat_mean_us"] * 1e-6     # IOPS x mean latency (s) = I/Os in flight
    vals = ["iops", "MBps", "lat_mean_us", "littles_L"] + [f"p{p}_us" for p in PCTS]
    s1 = agg([r for r in q if "_T" in r["job"]], ["total_qd"], vals + ["numjobs"], "qd_sweep_summary.csv")
    s2 = agg([r for r in q if "_1job_" in r["job"]], ["total_qd"], vals, "qd_single_job_summary.csv")
    fig, (a, b, c) = plt.subplots(1, 3, figsize=(15, 4.2))
    qds = sorted(k[0] for k in s1)
    iops = [s1[(x,)]["iops"][0] for x in qds]
    lat = [s1[(x,)]["lat_mean_us"][0] for x in qds]
    a.errorbar(np.array(iops) / 1e3, lat, xerr=[[(s1[(x,)]["iops"][0] - s1[(x,)]["iops"][1]) / 1e3 for x in qds],
                                                 [(s1[(x,)]["iops"][2] - s1[(x,)]["iops"][0]) / 1e3 for x in qds]],
               color=C[0], marker="o", label="up to 8 jobs (SSD-limited)", elinewidth=1)
    for x, i_, l_ in zip(qds, iops, lat):
        nj = int(s1[(x,)]["numjobs"][0])
        a.annotate(f"{nj}x{x // nj}", (i_ / 1e3, l_), textcoords="offset points", xytext=(4, 4), fontsize=7, color=INK2)
    q1 = sorted(k[0] for k in s2)
    if q1:
        a.plot([s2[(x,)]["iops"][0] / 1e3 for x in q1], [s2[(x,)]["lat_mean_us"][0] for x in q1], color=C[1],
               marker="s", label="1 job (host-limited)")
        for x in q1:
            a.annotate(f"QD{x}", (s2[(x,)]["iops"][0] / 1e3, s2[(x,)]["lat_mean_us"][0]), textcoords="offset points",
                       xytext=(4, -10), fontsize=7, color=C[1])
    j = knee_index(iops)
    a.plot(iops[j] / 1e3, lat[j], "o", ms=13, mfc="none", mec=INK, mew=1.2)
    L = iops[j] * lat[j] * 1e-6
    a.annotate(f"knee ({KNEE_FRAC:.0%} of peak): {qds[j]} outstanding\n{iops[j] / 1e3:.0f}K IOPS x {lat[j]:.0f} us = {L:.1f} in flight",
               (iops[j] / 1e3, lat[j]), xytext=(0.36, 0.8), textcoords="axes fraction", fontsize=8,
               arrowprops=dict(arrowstyle="-", color=MUTED))
    a.set_yscale("log")
    a.set_xlabel("throughput (thousand IOPS)"); a.set_ylabel("mean latency (us, log)")
    a.set_title("Throughput vs latency, 4K random read (labels: jobs x iodepth)")
    a.legend(loc="upper left", bbox_to_anchor=(0.36, 0.62))       # empty middle region between the curves

    b.plot(qds, np.array(iops) / 1e3, color=C[0], marker="o", label="up to 8 jobs")
    if q1:
        b.plot(q1, [s2[(x,)]["iops"][0] / 1e3 for x in q1], color=C[1], marker="s", label="1 job")
    b.axvline(qds[j], color=MUTED, ls="--", lw=1)
    b.set_xscale("log", base=2); b.set_xticks(qds); b.set_xticklabels(qds); b.minorticks_off()
    b.set_xlabel("outstanding I/Os (iodepth x jobs)"); b.set_ylabel("thousand IOPS")
    b.set_title("Diminishing returns past the knee"); b.legend()

    lim = max(qds) * 1.3
    c.plot([1, lim], [1, lim], color=MUTED, ls="--", lw=1, label="y = x")
    c.plot(qds, [s1[(x,)]["littles_L"][0] for x in qds], color=C[0], marker="o", label="up to 8 jobs")
    if q1:
        c.plot(q1, [s2[(x,)]["littles_L"][0] for x in q1], color=C[1], marker="s", label="1 job")
    c.set_xscale("log", base=2); c.set_yscale("log", base=2)
    c.set_xticks(qds); c.set_xticklabels(qds); c.set_yticks(qds); c.set_yticklabels(qds); c.minorticks_off()
    c.set_xlabel("configured outstanding I/Os"); c.set_ylabel("IOPS x mean latency")
    c.set_title("Little's Law check: L = lambda x W"); c.legend()
    fig.suptitle("Queue-depth / parallelism sweep", y=1.03)
    save(fig, "04_qd_knee.png")
    with open(os.path.join(PROC, "littles_law.csv"), "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["config", "outstanding_ios", "iops", "mean_latency_us", "iops_x_latency"])
        for x in qds:
            nj = int(s1[(x,)]["numjobs"][0])
            w.writerow([f"{nj} jobs x QD{x // nj}", x, f"{s1[(x,)]['iops'][0]:.0f}",
                        f"{s1[(x,)]['lat_mean_us'][0]:.2f}", f"{s1[(x,)]['littles_L'][0]:.2f}"])
        for x in q1:
            w.writerow([f"1 job x QD{x}", x, f"{s2[(x,)]['iops'][0]:.0f}", f"{s2[(x,)]['lat_mean_us'][0]:.2f}",
                        f"{s2[(x,)]['littles_L'][0]:.2f}"])
    print(f"   knee: {qds[j]} outstanding, {iops[j]:.0f} IOPS, {lat[j]:.0f} us, IOPS x latency = {L:.1f}")
    return qds, s1


def fig_tail(rows, qd_info):
    t = sel(rows, section="tail")
    for r in t:
        r["total_qd"] = r["iodepth"] * r["numjobs"]
    s = agg(t, ["total_qd"], ["lat_mean_us"] + [f"p{p}_us" for p in PCTS], "tail_summary.csv")
    fig, (a, b) = plt.subplots(1, 2, figsize=(12, 4))
    qds = sorted(k[0] for k in s)
    w = 0.35
    for i, q in enumerate(qds):
        vals = [s[(q,)][f"p{p}_us"] for p in PCTS]
        xs = np.arange(len(PCTS)) + (i - 0.5) * w
        a.bar(xs, [v[0] for v in vals], w * 0.92, color=C[i], label=f"{q} outstanding", zorder=2,
              yerr=[[v[0] - v[1] for v in vals], [v[2] - v[0] for v in vals]])
        for x_, v in zip(xs, vals):
            a.text(x_, v[2] * 1.05, f"{v[0]:.0f}", ha="center", va="bottom", fontsize=7)
    a.set_yscale("log")
    a.set_xticks(range(len(PCTS))); a.set_xticklabels([f"p{p}" for p in PCTS])
    a.set_ylabel("completion latency (us, log)")
    a.set_title("Tail latency, 4K random read (longer runs)"); a.legend(); a.grid(axis="x", visible=False)
    if qd_info:
        qd_list, s1 = qd_info
        for i, p in enumerate(PCTS):
            b.plot(qd_list, [s1[(x,)][f"p{p}_us"][0] for x in qd_list], color=C[i], marker="o", label=f"p{p}")
        b.set_xscale("log", base=2); b.set_yscale("log")
        b.set_xticks(qd_list); b.set_xticklabels(qd_list); b.minorticks_off()
        b.set_xlabel("outstanding I/Os (up to 8 jobs)"); b.set_ylabel("completion latency (us, log)")
        b.set_title("Percentiles vs queue depth (QD sweep runs)"); b.legend(ncol=2)
    save(fig, "05_tail_latency.png")


def fig_lba(rows):
    l = sel(rows, section="lba")
    for r in l:
        r["range_gb"] = size_bytes(r["size"]) / (1 << 30)
    s = agg(l, ["range_gb"], ["iops", "lat_mean_us", "p99_us"], "lba_summary.csv")
    xs = sorted(k[0] for k in s)
    fig, ax = plt.subplots(figsize=(6.5, 3.6))
    t = [s[(x,)]["iops"] for x in xs]
    ax.errorbar(range(len(xs)), [v[0] / 1e3 for v in t], yerr=[[(v[0] - v[1]) / 1e3 for v in t], [(v[2] - v[0]) / 1e3 for v in t]],
                color=C[0], marker="o", elinewidth=1)
    for i, x in enumerate(xs):
        ax.annotate(f"p99 {s[(x,)]['p99_us'][0]:.0f} us", (i, t[i][0] / 1e3), textcoords="offset points", xytext=(0, 8),
                    ha="center", fontsize=7.5, color=INK2)
    ax.set_xticks(range(len(xs))); ax.set_xticklabels([f"{x:g} GiB" for x in xs])
    ax.set_ylim(0, max(v[2] for v in t) / 1e3 * 1.2)
    ax.set_xlabel("LBA range read (from offset 0)"); ax.set_ylabel("thousand IOPS")
    ax.set_title("Working set / LBA range, 4K random read, 4 jobs x QD 8")
    save(fig, "06a_lba_range.png")


def read_log(prefix_glob, combine="sum"):
    """fio per-interval logs (time_ms, value, direction, bs, ...), one file per job.
    Values of all jobs are combined per whole second: summed (IOPS, bandwidth) or averaged (latency)."""
    files = sorted(glob.glob(prefix_glob))
    if not files:
        return np.array([]), np.array([])
    per_t = defaultdict(list)
    for fn in files:
        with open(fn) as f:
            for line in f:
                p = [x.strip() for x in line.split(",")]
                if len(p) >= 2:
                    per_t[round(int(p[0]) / 1000)].append(float(p[1]))
    t = np.array(sorted(per_t))
    v = np.array([(np.sum if combine == "sum" else np.mean)(per_t[k]) for k in t])
    return t, v


def fig_state():
    d = os.path.join(RAW, "state")
    t1, bw = read_log(os.path.join(d, "seqwrite_bw*.log"))
    t2, iops = read_log(os.path.join(d, "randwrite_iops*.log"))
    t3, lat = read_log(os.path.join(d, "randwrite_lat*.log"), combine="mean")
    if t1.size == 0 and t2.size == 0:
        return
    fig, axes = plt.subplots(1, 2, figsize=(13, 3.8))
    a, b = axes
    if t1.size:
        mbps = bw * 1024 / 1e6                            # KiB/s -> MB/s
        cum_gb = np.cumsum(mbps) / 1e3                    # 1 s intervals
        a.plot(t1, mbps, color=C[0], lw=1.2)
        a2_lbl = None
        early, late = np.median(mbps[: max(3, len(mbps) // 10)]), np.median(mbps[-max(3, len(mbps) // 4):])
        drop = np.argmax(mbps < (early + late) / 2) if late < 0.8 * early else None
        if drop:
            a.axvline(t1[drop], color=MUTED, ls="--", lw=1)
            a.annotate(f"cache full after ~{cum_gb[drop]:.0f} GB written\n{early:.0f} -> {late:.0f} MB/s",
                       (t1[drop], (early + late) / 2), textcoords="offset points", xytext=(8, 10), fontsize=8)
        a.set_ylim(0, max(mbps) * 1.15)
        with open(os.path.join(PROC, "state_seqwrite.csv"), "w", newline="") as f:
            w = csv.writer(f); w.writerow(["t_s", "MBps", "cumulative_GB"])
            w.writerows(zip(t1, np.round(mbps, 1), np.round(cum_gb, 2)))
    a.set_xlabel("time (s)"); a.set_ylabel("MB/s (1 s average)")
    a.set_title("Sustained 128K sequential write, QD 32, from an idle drive")
    if t2.size:
        b.plot(t2, iops / 1e3, color=C[1], lw=1.2, label="IOPS")
        b.set_ylabel("thousand IOPS (1 s average)")
        b.set_ylim(bottom=0)
        if t3.size:
            b.text(0.98, 0.95, f"mean latency first 10 s {np.mean(lat[:10]) / 1e3:.0f} us, last 10 s {np.mean(lat[-10:]) / 1e3:.0f} us",
                   transform=b.transAxes, ha="right", va="top", fontsize=8, color=INK2)
    b.set_xlabel("time (s)"); b.set_title("Sustained 4K random write, 4 jobs x QD 8")
    fig.suptitle("Device state: burst vs steady state (per-second fio logs)", y=1.03)
    save(fig, "06b_device_state.png")


def fig_pattern(rows):
    p = sel(rows, section="pattern")
    s = agg(p, ["job"], ["MBps", "lat_mean_us"], "pattern_summary.csv")
    jobs = [("seqwrite_128k_incompressible", "incompressible\n(random, refilled)"),
            ("seqwrite_128k_compress50", "50% compressible"), ("seqwrite_128k_zeros", "all zeros")]
    fig, ax = plt.subplots(figsize=(6.5, 3.6))
    vals = [med(s, (j,), "MBps") for j, _ in jobs]
    ax.bar(range(3), [v[0] for v in vals], 0.6, color=C[0], yerr=[[v[0] - v[1] for v in vals], [v[2] - v[0] for v in vals]], zorder=2)
    for i, v in enumerate(vals):
        ax.text(i, v[2], f"{v[0]:.0f}", ha="center", va="bottom", fontsize=8)
    ax.set_xticks(range(3)); ax.set_xticklabels([l for _, l in jobs])
    ax.set_ylabel("MB/s"); ax.set_title("Data pattern, 128K sequential write, QD 32")
    ax.grid(axis="x", visible=False)
    save(fig, "08_data_pattern.png")


def fig_pitfall(rows):
    p = sel(rows, section="pitfall")
    s = agg(p, ["job"], ["iops", "lat_mean_us"], "pitfall_summary.csv")
    fig, (a, b) = plt.subplots(1, 2, figsize=(11, 3.8))
    pairs = [(a, [("randread_4k_qd1_1g_direct", "direct=1\n(SSD)"), ("randread_4k_qd1_1g_buffered", "direct=0\n(OS file cache)")],
              "Buffered I/O: 4K random read, QD 1, 1 GiB range"),
             (b, [("randread_4k_windowsaio_qd1", "windowsaio\niodepth=1"), ("randread_4k_windowsaio_qd32", "windowsaio\niodepth=32"),
                  ("randread_4k_sync_qd32", "sync engine\niodepth=32")],
              "Wrong effective queue depth: 'QD 32' on a sync engine is QD 1")]
    for ax, jobs, title in pairs:
        jobs = [(j, l) for j, l in jobs if (j,) in s]
        vals = [med(s, (j,), "iops") for j, _ in jobs]
        ax.bar(range(len(jobs)), [v[0] / 1e3 for v in vals], 0.55, color=C[:len(jobs)], zorder=2,
               yerr=[[(v[0] - v[1]) / 1e3 for v in vals], [(v[2] - v[0]) / 1e3 for v in vals]])
        for i, (j, _) in enumerate(jobs):
            ax.text(i, vals[i][2] / 1e3, f"{vals[i][0] / 1e3:.0f}K IOPS\n{med(s, (j,), 'lat_mean_us')[0]:.1f} us",
                    ha="center", va="bottom", fontsize=8)
        ax.set_xticks(range(len(jobs))); ax.set_xticklabels([l for _, l in jobs])
        ax.set_ylabel("thousand IOPS"); ax.set_title(title, fontsize=9)
        ax.set_ylim(0, max(v[2] for v in vals) / 1e3 * 1.3); ax.grid(axis="x", visible=False)
    fig.suptitle("Misleading setups", y=1.03)
    save(fig, "07_pitfalls.png")


def main():
    os.makedirs(PLOTS, exist_ok=True)
    rows = parse_all()
    qd_info = None
    for name, fn in (("qd1", lambda: fig_qd1(rows)), ("bs", lambda: fig_bs(rows)), ("mix", lambda: fig_mix(rows))):
        try:
            fn()
        except Exception as e:
            print(f"!! {name} failed: {type(e).__name__}: {e}")
    try:
        qd_info = fig_qd(rows)
    except Exception as e:
        print(f"!! qd failed: {type(e).__name__}: {e}")
    for name, fn in (("tail", lambda: fig_tail(rows, qd_info)), ("lba", lambda: fig_lba(rows)), ("state", fig_state),
                     ("pattern", lambda: fig_pattern(rows)), ("pitfall", lambda: fig_pitfall(rows))):
        try:
            fn()
        except Exception as e:
            print(f"!! {name} failed: {type(e).__name__}: {e}")


if __name__ == "__main__":
    main()
