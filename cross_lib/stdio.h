#ifndef STDIO_H
#define STDIO_H

void __attribute__((cdecl)) puts(const char* str);
void __attribute__((cdecl)) exit(int exit_code);

#endif