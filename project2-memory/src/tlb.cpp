// tlb.cpp - TLB-miss impact: page locality and 4 KB vs 2 MB pages
//
// Usage:
//   tlb.exe pages    [R]  > data/raw/tlb_pages.csv
//   tlb.exe locality [R]  > data/raw/tlb_locality.csv
//   tlb.exe one <pages> <lines_per_page> <4k|2m> <seconds>   (for run_tlb_pcm.ps1)
//
// Random pointer chase in both modes. Each run uses the SAME node layout on 4 KB pages
// and on 2 MB large pages, so the cache footprint is identical and the difference
// between the two rows is the address-translation cost.
//
// pages   : one node per 4 KB page, number of pages swept from 16 to 256K (64 KB to 1 GB
//           span). Zen+ data TLB: L1 64 entries (256 KB reach with 4 KB pages),
//           L2 1536 entries (6 MB reach). The node sits at a random line inside its page;
//           with a fixed offset every node would map to the same L1/L2 cache set.
// locality: fixed 16384 nodes (1 MB of lines, L2/L3-resident), packed L lines per page
//           (L = 1..64), so the span is 16384/L pages. More lines per page = fewer pages
//           to translate for the same data.
//
// Large pages need the "Lock pages in memory" right; without it only 4K rows are written.
#include "common.h"

using namespace std;
using namespace bench;

// Node offsets: 'per_page' lines in each of 'pages' 4 KB pages, spread over the page's
// 64 line slots with a per-page rotation, returned in random visit order.
vector<size_t> page_offsets(size_t pages, size_t per_page, unsigned seed) {
    mt19937_64 rng(seed);
    vector<size_t> off;
    off.reserve(pages * per_page);
    size_t step = 64 / per_page;
    for (size_t p = 0; p < pages; p++) {
        size_t rot = rng() % step;
        for (size_t j = 0; j < per_page; j++) off.push_back(p * PAGE_4K + (j * step + rot) * LINE);
    }
    shuffle(off.begin(), off.end(), rng);
    return off;
}

void measure_layout(int run, unsigned seed, double ghz, size_t pages, size_t per_page,
                    const vector<bool>& kinds, size_t& sink) {
    vector<size_t> off = page_offsets(pages, per_page, seed);
    size_t nodes = off.size();
    for (bool large : kinds) {
        Buffer buf(pages * PAGE_4K, large);
        if (!buf) continue;
        void* start = link_chain(buf.data(), off);
        if (!is_single_cycle(start, nodes)) { cerr << "bad chain\n"; exit(1); }
        Stats s = measure_chase(start, nodes, max<size_t>(hops_for(nodes * LINE) / 4, 4 * nodes), 7, sink);
        cout << run << "," << seed << "," << (large ? "2M" : "4K") << "," << pages << "," << per_page << ","
             << nodes << "," << pages * PAGE_4K / 1024 << "," << s.mean << "," << s.sd << "," << ghz << ","
             << s.mean * ghz << endl;
    }
}

// One layout on one page size, chased for 'seconds'. Prints READY after setup and then
// "RESULT,key,value,..." so run_tlb_pcm.ps1 can count TLB misses for the loop only.
int run_one(size_t pages, size_t per_page, bool large, double seconds, size_t& sink) {
    if (large && !enable_large_pages()) { cerr << "large pages unavailable\n"; return 1; }
    vector<size_t> off = page_offsets(pages, per_page, BASE_SEED);
    size_t nodes = off.size();
    Buffer buf(pages * PAGE_4K, large);
    if (!buf) return 1;
    void* p = link_chain(buf.data(), off);
    if (!is_single_cycle(p, nodes)) { cerr << "bad chain\n"; return 1; }
    chase_ns(p, 2 * nodes);                                   // warm-up
    cout << "READY" << endl;
    const size_t chunk = 1'000'000;
    size_t hops = 0;
    auto t0 = Clock::now();
    while (seconds_between(t0, Clock::now()) < seconds) { chase_ns(p, chunk); hops += chunk; }
    double sec = seconds_between(t0, Clock::now());
    sink ^= (size_t)(uintptr_t)p;
    cout << "RESULT,page," << (large ? "2M" : "4K") << ",pages_4K," << pages << ",lines_per_page," << per_page
         << ",span_KB," << pages * PAGE_4K / 1024 << ",hops," << hops << ",ns_per_hop," << sec * 1e9 / hops << endl;
    return 0;
}

int main(int argc, char** argv) {
    setup_process();
    if (argc < 2) { cerr << "usage: tlb (pages [R] | locality [R] | one <pages> <lines_per_page> <4k|2m> <seconds>)\n"; return 1; }
    if (!strcmp(argv[1], "one")) {
        if (argc < 6) { cerr << "usage: tlb one <pages> <lines_per_page> <4k|2m> <seconds>\n"; return 1; }
        size_t sink = 0;
        int rc = run_one(strtoull(argv[2], nullptr, 10), strtoull(argv[3], nullptr, 10),
                         !strcmp(argv[4], "2m"), atof(argv[5]), sink);
        cerr << "sink (ignore): " << sink << "\n";
        return rc;
    }
    int R = argc >= 3 ? max(1, atoi(argv[2])) : 3;
    vector<bool> kinds = {false};
    if (enable_large_pages()) kinds.push_back(true);
    else cerr << "large pages unavailable (need 'Lock pages in memory' + admin shell): 4K only\n";

    size_t sink = 0;
    cout << "run,seed,page,pages_4K,lines_per_page,nodes,span_KB,mean_ns,sd_ns,ghz,cycles\n";
    for (int run = 1; run <= R; run++) {
        unsigned seed = BASE_SEED + run;
        double ghz = calibrate_ghz(sink);
        cerr << argv[1] << " run " << run << ": clock " << ghz << " GHz\n";
        if (!strcmp(argv[1], "pages")) {
            for (size_t pages : {16, 32, 48, 64, 96, 128, 256, 512, 1024, 1536, 2048, 4096,
                                 8192, 16384, 32768, 65536, 131072, 262144})
                measure_layout(run, seed, ghz, pages, 1, kinds, sink);
        } else if (!strcmp(argv[1], "locality")) {
            const size_t nodes = 16384;
            for (size_t per_page : {1, 2, 4, 8, 16, 32, 64})
                measure_layout(run, seed, ghz, nodes / per_page, per_page, kinds, sink);
        } else { cerr << "unknown mode\n"; return 1; }
    }
    cerr << "sink (ignore): " << sink << "\n";
    return 0;
}
