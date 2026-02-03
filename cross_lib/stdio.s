.code32
.intel_syntax noprefix
.align 4

.global puts
puts:
    mov ebx, [esp+4]
    mov edx, 0
    .strlen:
        mov eax, [ebx]
        add edx, 0x1
        add ebx, 0x1
        cmp eax, 0x0
        jne .strlen
    sub edx, 1          // Length of string
    mov ecx, [esp+4]    // Address of string start
    mov ebx, 0          // File to write to (STDOUT)
    mov eax, 0x4        // System call (write)
    int 0x80
    ret


.global exit
exit:
    mov ebx, [esp+4]    // Exit code
    mov eax, 0x1        // System call (exit)
    int 0x80
    ret


.global sleep
sleep:
    mov ebx, [esp+4]    // Microseconds to sleep
    mov eax, 0xa2       // System call (microsleep)
    int 0x80
    ret


.global getpid
getpid:
    mov eax, 0x14
    int 0x80
    ret


.global putd
putd:
    mov eax, 0x7
    mov ecx, [esp+4]
    int 0x80
    ret


.global fork
fork:
    mov eax, 0x2
    int 0x80
    ret

.global exec
exec:
    mov eax, 0xb
    mov ebx, [esp+4]
    int 0x80
    ret