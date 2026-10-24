// sysinfo.cpp - prints the machine facts the report's methodology section needs
//
// Usage:  sysinfo.exe > data/raw/sysinfo.txt
//   CPU brand, logical CPUs, physical cores and their SMT sibling CPUs, cache sizes,
//   NUMA nodes and their CPUs, large-page size and whether this account may use it,
//   and the measured core clock on the benchmark CPU.
#include "common.h"
#include <intrin.h>

using namespace std;
using namespace bench;

string mask_cpus(ULONG_PTR m) {
    string s;
    for (int i = 0; i < 64; i++) if (m >> i & 1) s += (s.empty() ? "" : ",") + to_string(i);
    return s;
}

int main() {
    setup_process();
    int r[4];
    char brand[49] = {};
    for (int i = 0; i < 3; i++) { __cpuid(r, 0x80000002 + i); memcpy(brand + 16 * i, r, 16); }
    cout << "cpu: " << brand << "\n";
    cout << "logical CPUs: " << GetActiveProcessorCount(ALL_PROCESSOR_GROUPS) << "\n";

    DWORD len = 0;
    GetLogicalProcessorInformation(nullptr, &len);
    vector<SYSTEM_LOGICAL_PROCESSOR_INFORMATION> info(len / sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION));
    GetLogicalProcessorInformation(info.data(), &len);
    int core = 0;
    for (auto& e : info) {
        if (e.Relationship == RelationProcessorCore)
            cout << "core " << core++ << ": logical CPUs " << mask_cpus(e.ProcessorMask)
                 << (e.ProcessorCore.Flags ? " (SMT)" : "") << "\n";
    }
    for (auto& e : info) {
        if (e.Relationship == RelationCache && e.Cache.Type != CacheInstruction)
            cout << "L" << (int)e.Cache.Level << (e.Cache.Type == CacheData ? "d" : "") << " "
                 << e.Cache.Size / 1024 << " KB, " << (int)e.Cache.Associativity << "-way, line "
                 << e.Cache.LineSize << " B, shared by CPUs " << mask_cpus(e.ProcessorMask) << "\n";
    }
    for (auto& e : info) {
        if (e.Relationship == RelationNumaNode)
            cout << "NUMA node " << e.NumaNode.NodeNumber << ": CPUs " << mask_cpus(e.ProcessorMask) << "\n";
    }

    MEMORYSTATUSEX ms{sizeof(ms)};
    GlobalMemoryStatusEx(&ms);
    cout << "physical memory: " << (ms.ullTotalPhys >> 20) << " MB\n";
    cout << "large page size: " << (GetLargePageMinimum() >> 10) << " KB\n";
    cout << "large pages usable by this process: " << (enable_large_pages() ? "yes" : "no") << "\n";
    size_t sink = 0;
    cout << "benchmark CPU: logical " << MAIN_CPU << ", measured clock " << calibrate_ghz(sink) << " GHz\n";
    cerr << "sink (ignore): " << sink << "\n";
    return 0;
}
