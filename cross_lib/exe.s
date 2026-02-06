.code32
.intel_syntax noprefix
.align 4

.extern main

.global _start
_start:
    call main
    push eax
    call exit
