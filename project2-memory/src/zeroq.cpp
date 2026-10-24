// zeroq.cpp - zero-queue (unloaded) latency of each memory level
//
// One dependent pointer chain, random order, one node per 64 B line. Each load needs
// the previous load's result, so only one miss is ever in flight: no queueing, and
// hardware prefetchers cannot guess the next address.
//
// Usage:  zeroq.exe [R] [large]  > data/raw/zeroq.csv
//   R      repeats of the whole experiment (default 5); each rebuilds the chains
//          with a new seed and re-measures the clock
//   large  also run every level on 2 MB large pages (needs the "Lock pages in memory"
//          right). The DRAM point on 4 KB pages includes TLB misses / page walks;
//          the large-page row shows how much of it that is.
//
// Level sizes for the TR 2920X: L1d 32 KB, L2 512 KB per core, L3 8 MB per CCX.
//   L1   16 KB   half of L1d
//   L2   256 KB  8x L1, half of L2
//   L3   4 MB    8x L2, half of one CCX's L3
//   DRAM 1 GB    32x the whole chip's L3
#include "common.h"
#include <map>

using namespace std;
using namespace bench;

int main(int argc, char** argv) {
    setup_process();
    int R = argc >= 2 ? max(1, atoi(argv[1])) : 5;
    bool want_large = argc >= 3 && strcmp(argv[2], "large") == 0;
    bool have_large = want_large && enable_large_pages();
    if (want_large && !have_large) cerr << "large pages unavailable, running 4K only\n";

    struct Level { const char* name; size_t kb; };
    const Level levels[] = {{"L1", 16}, {"L2", 256}, {"L3", 4096}, {"DRAM", 1048576}};
    vector<bool> page_kinds = {false};
    if (have_large) page_kinds.push_back(true);

    size_t sink = 0;
    map<string, vector<double>> ns_by, cyc_by;      // for the summary table
    cout << "run,seed,level,size_KB,page,mean_ns,sd_ns,median_ns,ghz,cycles\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << "run " << run << " (seed " << seed << "): clock " << ghz << " GHz\n";
        for (bool large : page_kinds) {
            for (const Level& L : levels) {
                size_t bytes = L.kb * 1024, nodes = bytes / LINE;
                Buffer buf(bytes, large);
                if (!buf) continue;
                void* start = link_chain(buf.data(), strided_offsets(nodes, LINE, true, seed));
                if (!is_single_cycle(start, nodes)) { cerr << "bad chain at " << L.name << "\n"; return 1; }
                Stats s = measure_chase(start, nodes, hops_for(bytes), 10, sink);
                const char* page = large ? "2M" : "4K";
                cout << run << "," << seed << "," << L.name << "," << L.kb << "," << page << ","
                     << s.mean << "," << s.sd << "," << s.median << "," << ghz << ","
                     << s.mean * ghz << endl;                     // cycles = ns x GHz
                string key = string(L.name) + " (" + page + ")";
                ns_by[key].push_back(s.mean);
                cyc_by[key].push_back(s.mean * ghz);
            }
        }
        cerr << "run " << run << ": clock after run " << calibrate_ghz(sink) << " GHz\n";
    }

    // Human-readable table on stderr: mean over runs +- sd across runs
    cerr << "\nlevel          ns (mean +- sd over runs)   cycles\n";
    for (auto& [key, v] : ns_by) {
        Stats a = stats(v), c = stats(cyc_by[key]);
        fprintf(stderr, "%-12s %8.2f +- %-6.2f            %7.1f\n", key.c_str(), a.mean, a.sd, c.mean);
    }
    cerr << "sink (ignore): " << sink << "\n";
    return 0;
}
