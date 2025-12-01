.intel_syntax noprefix
.align 4
.code32

.section .text

.global syscall
syscall:
    mov eax, [esp+4]
    int 0x80
    ret