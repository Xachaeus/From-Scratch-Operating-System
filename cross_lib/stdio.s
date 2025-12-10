.code32
.intel_syntax noprefix
.align 4

.global puts
puts:
    mov ecx, [esp+4]
    mov eax, 0x1
    int 0x80
    ret


.global exit
exit:
    mov ecx, [esp+4]
    mov eax, 0x3C
    int 0x80

    ret


.global sleep
sleep:
    mov ecx, [esp+4]
    mov eax, 0x23
    int 0x80

    ret


.global getpid
getpid:
    mov eax, 0x27
    int 0x80
    ret


.global putd
putd:
    mov eax, 0x5
    mov ecx, [esp+4]
    int 0x80
    ret


.global fork
fork:
    mov eax, 0x39
    int 0x80
    ret