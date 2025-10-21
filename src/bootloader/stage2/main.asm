; org 0x20000


%define REAL(addr) Stage2_Load_Segment*16+addr
Stage2_Load_Segment     equ 0x2000
Kernel_Load_Address     equ 0x30000000 ; Address is segment-offset as SSSS:OOOO, so linear address 0x30000


section _ENTRY class=CODE

extern _cstart_
extern _printf
global entry


entry:
    [bits 16]
    ; setup stack
    mov ax, ds
    mov ss, ax
    mov sp, 0xFFF0
    mov bp, sp

    sti

    push edx ; Save dx for kernel

    ; expect boot drive in dl, send it as argument to cstart function
    push dword Kernel_Load_Address
    xor dh, dh
    push dx
    call _cstart_
    add sp, 6

    mov ax, Stage2_Load_Segment
    mov es, ax


; Time to do memory detection :)


    mov eax, 0xE820             ; E820 command
    mov ebx, 0                  ; Set EBX to 0
    mov edx, 0x534D4150         ; Magic number 0x534D4150, hell if I know why
    mov ecx, 24                 ; Number of bytes in our memory map buffer
    mov di, g_MemoryMapStruct
    int 0x15                    ; Int 0x15 for memory map


.MemoryLoop:

    jc .MemoryLoopDone          ; Carry flag will be set if read was not successful

    ;pushad
    ;mov ecx, [g_MemoryMapStruct+24]
    ;push ecx
    ;push debug_message
    ;call _printf
    ;add sp, 6
    ;popad

    test ebx, ebx
    jz .MemoryLoopDone
    cmp eax, 0x534D4150
    jnz .MemoryLoopDone

    add di, 24                  ; Increment di by the entry length
    ;mov eax, g_MemoryMapStruct
    ;mov cx, di
    ;sub ecx, eaxdi
    ;test ecx, (24*20)
    ;jz .MemoryLoopDone          ; If di has reached the end of the buffer, end the loop

    mov eax, 0xE820
    mov edx, 0x534D4150
    mov ecx, 24
    int 0x15
    jmp .MemoryLoop

.MemoryLoopDone:

    ;cli
    ;hlt

    push setup_message
    call _printf
    add sp, 2

    ; Disable BIOS cursor blinking so future kernel doesn't have to deal with it
    mov ah, 0x01
    mov ch, 0b00100000
    mov cl, 0b00000000
    int 0x10

    ; do setup to switch to protected mode
    cli
    call EnableA20
    call LoadGDT

    
    ;push dword [g_GDTDesc+2]
    ;push debug_message
    ;call _printf
    ;add sp, 6
    


    ; enable protected mode
    mov eax, cr0
    or al, 1
    mov cr0, eax

    ; far jump to 32-bit code segment
    jmp dword 0x08:REAL(.pmode)


.pmode:
    [bits 32]
    ; We are now in 32-bit protected mode!

    pop edx      ; Restore before we change stack setup

    mov ax, 0x10
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax

    ; Place kernel arguments back onto the stack
    push REAL(g_MemoryMapStruct)
    push edx

    mov esi, REAL(protected_message)
    mov edi, ScreenBuffer

    mov bl, 0x1F
    cld

.p_loop:
    lodsb
    or al, al
    jz .p_done

    mov [edi], al
    inc edi
    mov [edi], bl
    inc edi

    jmp .p_loop

.p_done:
    std
    pop edx ; Pop drive number
    pop ecx ; Pop memory map address
    mov esp, 0x2FFFF ; Byte just below where kernel is located
    push ecx ; Setup stack arguments for kernel start
    push edx
    jmp dword 0x8:0x30000 ; Kernel start
    cli
.p_halt: 
    jmp .p_halt





EnableA20:
    [bits 16]
    ; disable keyboard
    call A20WaitInput
    mov al, KbdControllerDisableKeyboard
    out KbdControllerCommandPort, al

    ; read control output port
    call A20WaitInput
    mov al, KbdControllerReadCtrlOutputPort
    out KbdControllerCommandPort, al

    call A20WaitOutput
    in al, KbdControllerDataPort
    push eax

    ; write control output port
    call A20WaitInput
    mov al, KbdControllerWriteCtrlOutputPort
    out KbdControllerCommandPort, al
    
    call A20WaitInput
    pop eax
    or al, 2                                    ; bit 2 = A20 bit
    out KbdControllerDataPort, al

    ; enable keyboard
    call A20WaitInput
    mov al, KbdControllerEnableKeyboard
    out KbdControllerCommandPort, al

    call A20WaitInput
    ret


A20WaitInput:
    [bits 16]
    ; wait until status bit 2 (input buffer) is 0
    ; by reading from command port, we read status byte
    in al, KbdControllerCommandPort
    test al, 2
    jnz A20WaitInput
    ret

A20WaitOutput:
    [bits 16]
    ; wait until status bit 1 (output buffer) is 1 so it can be read
    in al, KbdControllerCommandPort
    test al, 1
    jz A20WaitOutput
    ret



LoadGDT:
    [bits 16]
    lgdt [g_GDTDesc]
    ret




KbdControllerDataPort               equ 0x60
KbdControllerCommandPort            equ 0x64
KbdControllerDisableKeyboard        equ 0xAD
KbdControllerEnableKeyboard         equ 0xAE
KbdControllerReadCtrlOutputPort     equ 0xD0
KbdControllerWriteCtrlOutputPort    equ 0xD1

ScreenBuffer                        equ 0xB8000


section _GDT

g_GDT:      ; NULL descriptor
            dq 0

            ; 32-bit code segment
            dw 0FFFFh                   ; limit (bits 0-15) = 0xFFFFF for full 32-bit range
            dw 0                        ; base (bits 0-15) = 0x0
            db 0                        ; base (bits 16-23)
            db 10011010b                ; access (present, ring 0, code segment, executable, direction 0, readable)
            db 11001111b                ; granularity (4k pages, 32-bit pmode) + limit (bits 16-19)
            db 0                        ; base high

            ; 32-bit data segment
            dw 0FFFFh                   ; limit (bits 0-15) = 0xFFFFF for full 32-bit range
            dw 0                        ; base (bits 0-15) = 0x0
            db 0                        ; base (bits 16-23)
            db 10010010b                ; access (present, ring 0, data segment, executable, direction 0, writable)
            db 11001111b                ; granularity (4k pages, 32-bit pmode) + limit (bits 16-19)
            db 0                        ; base high

            ; 16-bit code segment
            dw 0FFFFh                   ; limit (bits 0-15) = 0xFFFFF
            dw 0                        ; base (bits 0-15) = 0x0
            db 0                        ; base (bits 16-23)
            db 10011010b                ; access (present, ring 0, code segment, executable, direction 0, readable)
            db 00001111b                ; granularity (1b pages, 16-bit pmode) + limit (bits 16-19)
            db 0                        ; base high

            ; 16-bit data segment
            dw 0FFFFh                   ; limit (bits 0-15) = 0xFFFFF
            dw 0                        ; base (bits 0-15) = 0x0
            db 0                        ; base (bits 16-23)
            db 10010010b                ; access (present, ring 0, data segment, executable, direction 0, writable)
            db 00001111b                ; granularity (1b pages, 16-bit pmode) + limit (bits 16-19)
            db 0                        ; base high

g_GDTDesc:  dw g_GDTDesc - g_GDT - 1            ; limit = size of GDT
            dd g_GDT + Stage2_Load_Segment*16   ; address of GDT


debug_message:          db "32-bit Reg Value: 0x%lx", 0xD, 0xA, 0
debug_memory_message:   db "Boot drive: 0x%hx, Map Address: 0x%lx", 0xD, 0xA, 0
setup_message:          db "Begining setup for transition to 32-bit protected mode...", 0xD, 0xA, 0
protected_message:      db "Hello World from 32-bit protected mode!", 0

section .bss
g_MemoryMapStruct: times (24*20) db 0  ; Guarantee space for 20 entries for our memory map