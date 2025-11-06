.intel_syntax noprefix

.global i686_outb
i686_outb:
    .code32
    mov dx, [esp + 4]
    mov al, [esp + 8]
    out dx, al
    ret

.global i686_outw
i686_outw:
    .code32
    mov dx, [esp + 4]
    mov ax, [esp + 8]
    out dx, ax
    ret

.global i686_inb
i686_inb:
    .code32
    mov dx, [esp + 4]
    xor eax, eax
    in al, dx
    ret

.global i686_EnableInterrupts
i686_EnableInterrupts:
    .code32
    sti
    ret

.global i686_DisableInterrupts
i686_DisableInterrupts:
    .code32
    cli
    ret