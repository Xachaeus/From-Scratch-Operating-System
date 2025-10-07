.code32
.intel_syntax noprefix
.align 4

.extern kernel_main

.equ VGA_Width, 80
.equ ScreenBuffer, 0xB8000 + VGA_Width*2



.section .text
.global kernel_start

kernel_start:
    cli

    call kernel_main
    /* Everything past this point shouldn't matter */

    sti

loop:
    jmp loop

end_of_loop:
    cli
    hlt

    /* print hello world message */
    lea esi, msg_hello
    mov edi, ScreenBuffer
    cld


p_loop:
    lodsb
    or al, al
    jz p_done
    
    mov byte ptr [edi], al
    inc edi
    mov byte ptr [edi], 0x2F
    inc edi

    jmp p_loop

p_done:
    cli
p_halt: 
    jmp p_halt

.section .data
msg_hello:  .string "Hello World! This is for DEBUG purposes only, and should NEVER be visible!"
