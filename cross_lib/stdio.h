#ifndef STDIO_H
#define STDIO_H

#include <stdint.h>

void __attribute__((cdecl)) exit(int exit_code);
void __attribute__((cdecl)) sleep(long microseconds);
uint32_t __attribute__((cdecl)) getpid();
void __attribute__((cdecl)) puts(const char* str);
void __attribute__((cdecl)) putd(int d);
int __attribute__((cdecl)) fork();
int __attribute__((cdecl)) exec(const char* path);
#endif