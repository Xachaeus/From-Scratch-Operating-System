#ifndef STDIO_H
#define STDIO_H

#include <stdint.h>

// GCC Helper functions
uint64_t __udivdi3(uint64_t, uint64_t);
uint64_t __umoddi3(uint64_t, uint64_t);

void __attribute__((cdecl)) exit(int exit_code);
void __attribute__((cdecl)) sleep(long microseconds);
uint32_t __attribute__((cdecl)) getpid();
void __attribute__((cdecl)) puts(const char* str);
void __attribute__((cdecl)) __putsk(const char* str, uint32_t k);
void __attribute__((cdecl)) putd(int d);
int __attribute__((cdecl)) fork();
int __attribute__((cdecl)) exec(const char* path, int argc, const char** argv);

void __attribute__((cdecl)) printf(const char* fmt, ...);

#endif
