// common.h - helpers shared by every Project 2 benchmark (Windows + MSYS2 g++)
//
// Contents
//   - process / thread pinning (CPU layout of the TR 2920X used for this project)
//   - core-clock calibration (dependent integer adds)
//   - page-backed buffers, optionally with 2 MB large pages
//   - pointer-chase chains (build, validate, measure)
//   - full-cache-line read / write kernels
//   - pinned worker threads: timed passes (run_pinned) and background traffic (Background)
//   - small statistics helper
#pragma once
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#include <immintrin.h>

#include <algorithm>
#include <atomic>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <numeric>
#include <random>
#include <string>
#include <thread>
#include <vector>

namespace bench {

constexpr size_t LINE = 64;
constexpr size_t PAGE_4K = 4096;
constexpr unsigned BASE_SEED = 12345;

// ---------------------------------------------------------------------------
// CPU layout
// Windows numbers SMT siblings next to each other: logical CPUs 2k and 2k+1 are
// physical core k (check with sysinfo.exe). The main / latency-probe thread runs
// on core 1 (logical CPU 2, the same CPU the original chase.cpp used). Worker
// threads get one physical core each, in the order below. On the 2920X, cores
// 0-5 are die 0 and cores 6-11 are die 1, so more than 4 workers crosses dies.
// ---------------------------------------------------------------------------
constexpr int MAIN_CPU = 2;
constexpr int MAX_WORKERS = 11;

inline int worker_cpu(int i) {
    static const int cores[MAX_WORKERS] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0};
    return 2 * cores[i % MAX_WORKERS];
}
inline DWORD_PTR cpu_mask(int cpu) { return (DWORD_PTR)1 << cpu; }

inline std::vector<DWORD_PTR> default_masks(int n) {
    std::vector<DWORD_PTR> m(n);
    for (int i = 0; i < n; i++) m[i] = cpu_mask(worker_cpu(i));
    return m;
}

inline void pin_this_thread(DWORD_PTR mask) {
    if (mask) SetThreadAffinityMask(GetCurrentThread(), mask);
}

// Pins only the main thread (not the process, so worker threads can go elsewhere)
inline void setup_process() {
    SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);
    pin_this_thread(cpu_mask(MAIN_CPU));
}

// Keeps a value alive so the compiler cannot delete the loop that produced it
template <class T> inline void keep(T const& v) { asm volatile("" : : "r,m"(v) : "memory"); }

using Clock = std::chrono::steady_clock;
inline double seconds_between(Clock::time_point a, Clock::time_point b) {
    return std::chrono::duration<double>(b - a).count();
}

// ---------------------------------------------------------------------------
// Statistics
// ---------------------------------------------------------------------------
struct Stats { double mean = 0, sd = 0, median = 0, min = 0; };

inline Stats stats(std::vector<double> v) {
    Stats s;
    if (v.empty()) return s;
    std::sort(v.begin(), v.end());
    s.min = v.front();
    s.median = v[v.size() / 2];
    s.mean = std::accumulate(v.begin(), v.end(), 0.0) / v.size();
    double var = 0;
    for (double x : v) var += (x - s.mean) * (x - s.mean);
    s.sd = v.size() > 1 ? std::sqrt(var / (v.size() - 1)) : 0.0;   // sample sd
    return s;
}

// ---------------------------------------------------------------------------
// Frequency calibration
// A chain of dependent integer adds: each add needs the previous result and takes
// 1 cycle, so adds / elapsed_time = the core clock actually running right now
// (unlike RDTSC, which ticks at a fixed rate on Zen). The empty asm forces x into
// a register after every add so the 8 adds cannot be folded together.
// Returns the median of several trials (GHz).
// ---------------------------------------------------------------------------
inline double ghz_once(long iters, size_t& sink) {
    unsigned long long x = 0;
    auto start = Clock::now();
    for (long i = 0; i < iters; i++) {
#define DEP_ADD x += 1; asm volatile("" : "+r"(x));
        DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD DEP_ADD
#undef DEP_ADD
    }
    double ns = std::chrono::duration<double, std::nano>(Clock::now() - start).count();
    sink ^= (size_t)x;
    return 8.0 * iters / ns;                        // adds per ns == GHz
}

inline double calibrate_ghz(size_t& sink) {
    std::vector<double> g;
    for (int t = 0; t < 5; t++) g.push_back(ghz_once(100'000'000, sink));   // ~0.2 s each
    return stats(g).median;
}

// ---------------------------------------------------------------------------
// Memory
// ---------------------------------------------------------------------------

// Large pages need the "Lock pages in memory" user right (secpol.msc -> Local
// Policies -> User Rights Assignment), a log-off/on, and usually an elevated shell.
inline bool enable_large_pages() {
    HANDLE tok;
    if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &tok))
        return false;
    TOKEN_PRIVILEGES tp{};
    tp.PrivilegeCount = 1;
    tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
    bool ok = LookupPrivilegeValueA(nullptr, "SeLockMemoryPrivilege", &tp.Privileges[0].Luid);
    if (ok) {
        AdjustTokenPrivileges(tok, FALSE, &tp, 0, nullptr, nullptr);
        ok = (GetLastError() == ERROR_SUCCESS);     // ERROR_NOT_ALL_ASSIGNED if right is missing
    }
    CloseHandle(tok);
    return ok && GetLargePageMinimum() != 0;
}

// Page-aligned buffer from VirtualAlloc. Every page is written once at allocation
// so no page fault (first touch) lands inside a timed region.
class Buffer {
public:
    Buffer() = default;
    Buffer(size_t bytes, bool large) : large_(large) {
        if (large) {
            size_t lp = GetLargePageMinimum();
            if (lp == 0) return;
            bytes = (bytes + lp - 1) / lp * lp;
            p_ = (char*)VirtualAlloc(nullptr, bytes, MEM_RESERVE | MEM_COMMIT | MEM_LARGE_PAGES,
                                     PAGE_READWRITE);
        } else {
            p_ = (char*)VirtualAlloc(nullptr, bytes, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
        }
        if (!p_) {
            std::cerr << "VirtualAlloc of " << (bytes >> 20) << " MB (" << (large ? "large" : "4K")
                      << " pages) failed, error " << GetLastError() << "\n";
            return;
        }
        bytes_ = bytes;
        std::memset(p_, 0, bytes_);
    }
    ~Buffer() { if (p_) VirtualFree(p_, 0, MEM_RELEASE); }
    Buffer(Buffer&& o) noexcept : p_(o.p_), bytes_(o.bytes_), large_(o.large_) { o.p_ = nullptr; }
    Buffer& operator=(Buffer&& o) noexcept {
        if (this != &o) { this->~Buffer(); p_ = o.p_; bytes_ = o.bytes_; large_ = o.large_; o.p_ = nullptr; }
        return *this;
    }
    Buffer(const Buffer&) = delete;
    Buffer& operator=(const Buffer&) = delete;

    char* data() const { return p_; }
    uint64_t* words() const { return (uint64_t*)p_; }
    size_t size() const { return bytes_; }
    bool large() const { return large_; }
    explicit operator bool() const { return p_ != nullptr; }

private:
    char* p_ = nullptr;
    size_t bytes_ = 0;
    bool large_ = false;
};

// Buffer for a DRAM-sized random chase: 2 MB pages when this process may use them,
// otherwise 4 KB pages. With 4 KB pages every random hop over a large span is also a
// TLB miss, and Zen+ can only run a few page walks at once, so walks (not DRAM)
// can become the limit. Record page_name() with every result.
inline Buffer chase_buffer(size_t bytes) {
    static const bool lp = enable_large_pages();
    if (lp) { Buffer b(bytes, true); if (b) return b; }
    return Buffer(bytes, false);
}
inline const char* page_name(const Buffer& b) { return b.large() ? "2M" : "4K"; }

// ---------------------------------------------------------------------------
// Pointer chase
// Each node stores the ADDRESS of the next node; the chase is p = *p, so every
// load depends on the previous one and at most one miss is in flight.
// ---------------------------------------------------------------------------

// Byte offsets of n nodes spaced 'stride' apart, in visit order
inline std::vector<size_t> strided_offsets(size_t n, size_t stride, bool random, unsigned seed) {
    std::vector<size_t> off(n);
    for (size_t i = 0; i < n; i++) off[i] = i * stride;
    if (random) {
        std::mt19937_64 rng(seed);
        std::shuffle(off.begin(), off.end(), rng);
    }
    return off;
}

// Links the nodes into one cycle that visits off[0], off[1], ... and wraps. Returns the start.
inline void* link_chain(char* base, const std::vector<size_t>& off, size_t first = 0, size_t count = SIZE_MAX) {
    if (count == SIZE_MAX) count = off.size() - first;
    for (size_t i = 0; i < count; i++)
        *(void**)(base + off[first + i]) = base + off[first + (i + 1) % count];
    return base + off[first];
}

// Validation: the chain must return to its start after exactly n hops
inline bool is_single_cycle(void* start, size_t n) {
    void* p = *(void**)start;
    size_t count = 1;
    while (p != start && count <= n) { p = *(void**)p; count++; }
    return count == n;
}

// ns per hop for 'hops' dependent loads starting at p; p is advanced
inline double chase_ns(void*& p, size_t hops) {
    void* q = p;
    auto start = Clock::now();
    for (size_t h = 0; h < hops; h++) q = *(void**)q;
    auto end = Clock::now();
    p = q;
    return std::chrono::duration<double, std::nano>(end - start).count() / hops;
}

// Fewer hops for big footprints so DRAM points do not take minutes
inline size_t hops_for(size_t footprint_bytes) {
    if (footprint_bytes <= (1u << 20))  return 100'000'000;
    if (footprint_bytes <= (16u << 20)) return 20'000'000;
    return 5'000'000;
}

// Warms up (walks the chain up to twice), then times 'trials' runs of 'hops' hops
inline Stats measure_chase(void* start, size_t nodes, size_t hops, int trials, size_t& sink) {
    void* p = start;
    chase_ns(p, std::min(2 * nodes, hops));
    std::vector<double> v;
    for (int t = 0; t < trials; t++) v.push_back(chase_ns(p, hops));
    sink ^= (size_t)(uintptr_t)p;
    return stats(v);
}

// ---------------------------------------------------------------------------
// Full-cache-line kernels. Each touches all 64 bytes of every line so the bytes
// counted equal the bytes the core actually asked for.
// ---------------------------------------------------------------------------
inline uint64_t read_lines(const uint64_t* p, size_t nlines) {
    uint64_t s0 = 0, s1 = 0;
    for (size_t i = 0; i < nlines; i++) {
        const uint64_t* q = p + 8 * i;
        s0 += q[0] + q[2] + q[4] + q[6];
        s1 += q[1] + q[3] + q[5] + q[7];
    }
    return s0 ^ s1;
}

inline void write_lines(uint64_t* p, size_t nlines, uint64_t v) {
    for (size_t i = 0; i < nlines; i++) {
        uint64_t* q = p + 8 * i;
        q[0] = v; q[1] = v + 1; q[2] = v + 2; q[3] = v + 3;
        q[4] = v + 4; q[5] = v + 5; q[6] = v + 6; q[7] = v + 7;
    }
}

// Read/write mix in groups of 10 lines: the first read_tenths lines of each group
// are read, the rest are written (read_tenths = 7 -> 70/30). The pattern is fixed,
// so there is no random-number work and no unpredictable branch in the timed loop.
// nlines should be a multiple of 10.
inline uint64_t mix_lines(uint64_t* p, size_t nlines, int read_tenths, uint64_t v) {
    uint64_t s = 0;
    for (size_t i = 0; i + 10 <= nlines; i += 10) {
        s += read_lines(p + 8 * i, read_tenths);
        write_lines(p + 8 * (i + read_tenths), 10 - read_tenths, v + i);
    }
    return s;
}

// ---------------------------------------------------------------------------
// Worker threads
// ---------------------------------------------------------------------------

// Spinning barrier; yields after a while so it still works when threads share a CPU
class SpinBarrier {
public:
    explicit SpinBarrier(int n) : n_(n) {}
    void wait() {
        int gen = gen_.load(std::memory_order_acquire);
        if (arrived_.fetch_add(1, std::memory_order_acq_rel) + 1 == n_) {
            arrived_.store(0, std::memory_order_relaxed);
            gen_.fetch_add(1, std::memory_order_release);
            return;
        }
        for (int spins = 0; gen_.load(std::memory_order_acquire) == gen; spins++) {
            if (spins < 4000) _mm_pause(); else SwitchToThread();
        }
    }
private:
    const int n_;
    std::atomic<int> arrived_{0};
    std::atomic<int> gen_{0};
};

// Runs body(tid, rep) on masks.size() threads (thread i pinned to masks[i]; mask 0 =
// let Windows schedule it) for 'reps' repetitions. Threads are created once, before
// timing. Each repetition starts all threads together. Every thread stamps its own
// start and end, and a repetition lasts from the earliest start to the latest end.
// (Timing from the main thread breaks when threads share a CPU with it: the workers
// can finish before the main thread is even scheduled to read the clock.)
// Returns seconds per repetition.
template <class F>
std::vector<double> run_pinned(const std::vector<DWORD_PTR>& masks, int reps, F body) {
    const int n = (int)masks.size();
    SpinBarrier bar(n);
    std::vector<Clock::time_point> t_start(n * reps), t_end(n * reps);
    std::vector<std::thread> th;
    for (int t = 0; t < n; t++) {
        th.emplace_back([&, t] {
            pin_this_thread(masks[t]);
            for (int r = 0; r < reps; r++) {
                bar.wait();
                t_start[r * n + t] = Clock::now();
                body(t, r);
                t_end[r * n + t] = Clock::now();
            }
        });
    }
    for (auto& x : th) x.join();
    std::vector<double> secs;
    for (int r = 0; r < reps; r++) {
        auto a = *std::min_element(t_start.begin() + r * n, t_start.begin() + (r + 1) * n);
        auto b = *std::max_element(t_end.begin() + r * n, t_end.begin() + (r + 1) * n);
        secs.push_back(seconds_between(a, b));
    }
    return secs;
}

// Background load: threads run body(tid, stop) until 'stop' is set. body returns how
// many cache lines it moved. Used to load the memory system while the main thread
// measures latency with a pointer chase.
class Background {
public:
    template <class F>
    Background(const std::vector<DWORD_PTR>& masks, F body) : lines_(masks.size() * 8, 0) {
        for (size_t t = 0; t < masks.size(); t++) {
            th_.emplace_back([&, body, t, mask = masks[t]] {
                pin_this_thread(mask);
                ready_.fetch_add(1);
                while (!go_.load(std::memory_order_acquire)) _mm_pause();
                lines_[t * 8] = body((int)t, stop_);     // padded: one cache line per thread
            });
        }
        while (ready_.load() < (int)masks.size()) _mm_pause();
    }
    void start() { t0_ = Clock::now(); go_.store(true, std::memory_order_release); }

    // Stops the workers; returns aggregate GB/s (1e9 bytes) over the active period
    double finish() {
        stop_.store(true, std::memory_order_release);
        auto t1 = Clock::now();
        for (auto& x : th_) x.join();
        uint64_t total = 0;
        for (size_t t = 0; t < th_.size(); t++) total += lines_[t * 8];
        return th_.empty() ? 0.0 : total * (double)LINE / seconds_between(t0_, t1) / 1e9;
    }
    ~Background() { if (!stop_) { stop_ = true; go_ = true; for (auto& x : th_) if (x.joinable()) x.join(); } }

private:
    std::vector<std::thread> th_;
    std::vector<uint64_t> lines_;
    std::atomic<int> ready_{0};
    std::atomic<bool> go_{false}, stop_{false};
    Clock::time_point t0_;
};

// Parses "1,2,4,8" -> {1,2,4,8}
inline std::vector<int> parse_list(const char* s) {
    std::vector<int> v;
    for (const char* p = s; *p;) {
        v.push_back(atoi(p));
        while (*p && *p != ',') p++;
        if (*p == ',') p++;
    }
    return v;
}

}  // namespace bench
