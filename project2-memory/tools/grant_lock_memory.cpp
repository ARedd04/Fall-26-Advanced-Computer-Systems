// grant_lock_memory.cpp - gives the current user the "Lock pages in memory" right
// (SeLockMemoryPrivilege), which VirtualAlloc(MEM_LARGE_PAGES) needs.
// Windows 10 Home has no secpol.msc, so this calls the LSA API directly.
//
// Build:  g++ -O2 -static tools/grant_lock_memory.cpp -o tools/grant_lock_memory.exe -ladvapi32
// Run ONCE from an Administrator shell, then sign out and back in (rights are read at logon).
// Check afterwards with:  whoami /priv   (look for SeLockMemoryPrivilege)
#include <windows.h>
#include <ntsecapi.h>
#include <sddl.h>
#include <cstdio>
#include <cwchar>
#include <vector>

int main() {
    // SID of the user running this program
    HANDLE tok;
    if (!OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, &tok)) { printf("OpenProcessToken failed\n"); return 1; }
    DWORD len = 0;
    GetTokenInformation(tok, TokenUser, nullptr, 0, &len);
    std::vector<char> buf(len);
    if (!GetTokenInformation(tok, TokenUser, buf.data(), len, &len)) { printf("GetTokenInformation failed\n"); return 1; }
    PSID sid = ((TOKEN_USER*)buf.data())->User.Sid;
    LPSTR sid_str;
    ConvertSidToStringSidA(sid, &sid_str);
    printf("user SID: %s\n", sid_str);

    LSA_OBJECT_ATTRIBUTES oa{};
    LSA_HANDLE policy;
    NTSTATUS st = LsaOpenPolicy(nullptr, &oa, POLICY_CREATE_ACCOUNT | POLICY_LOOKUP_NAMES, &policy);
    if (st != 0) {
        printf("LsaOpenPolicy failed (error %lu) - run this from an Administrator shell\n", LsaNtStatusToWinError(st));
        return 1;
    }
    wchar_t name[] = L"SeLockMemoryPrivilege";
    LSA_UNICODE_STRING right;
    right.Buffer = name;
    right.Length = (USHORT)(wcslen(name) * sizeof(wchar_t));
    right.MaximumLength = right.Length + sizeof(wchar_t);
    st = LsaAddAccountRights(policy, sid, &right, 1);
    LsaClose(policy);
    if (st != 0) { printf("LsaAddAccountRights failed (error %lu)\n", LsaNtStatusToWinError(st)); return 1; }

    printf("Granted SeLockMemoryPrivilege. Sign out and back in for it to take effect.\n");
    return 0;
}
