.code32
.intel_syntax noprefix
.align 4

.section .text

.global i686_PIT_Initialize
i686_PIT_Initialize:
    // Set the programmable system timer to fire every 500 microseconds. This requires a divisor of 597.
    // Alternative value: 50 microseconds, divisor of 60
    mov dx, 0x43
    mov al, 0b00110100 // Channel 0, lo/hi byte access, operating mode 0, binary mode 0
    out dx, al

    mov dx, 0x40 // Channel 0
    mov ax, 597   // Value for divisor
    out dx, al   // Send the low byte first
    mov al, ah   // Move the high byte into al
    out dx, al   // Send the high byte next
    ret
