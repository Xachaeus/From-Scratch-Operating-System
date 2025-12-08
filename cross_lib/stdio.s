.code32
.intel_syntax noprefix
.align 4

.global puts
puts:
    mov ecx, [esp+4]
    mov ebx, 0
    len_loop:
        inc ebx
        mov eax, [ecx]
        inc ecx
        cmp eax, 0x0
        jne len_loop
    dec ebx
    mov ecx, [esp+4]
    mov eax, 0x4
    int 0x80
    ret


.global exit
exit:
    mov ecx, [esp+4]
    mov eax, 0x1
    int 0x80

    ret


.global sleep
sleep:
    mov ecx, [esp+4]
    mov eax, 0x2
    int 0x80

    ret


.global get_pid
get_pid:
    mov eax, 0x3
    int 0x80
    ret


.global putd
putd:
    mov eax, 0x5
    mov ecx, [esp+4]
    int 0x80
    ret
