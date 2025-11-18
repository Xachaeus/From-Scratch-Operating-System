.intel_syntax noprefix
.align 4
.code32

.section .text

.global i686_call
i686_call:
    mov eax, [esp+4]
    jmp eax