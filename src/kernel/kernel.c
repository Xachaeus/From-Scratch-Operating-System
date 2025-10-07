#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <HAL/hal.h>
#include <arch/x86/irq.h>
#include <hardware-io/io.h>
#include <keyboard/keyboard.h>
#include <memory-manager/FMM.h>
#include <memory-manager/PMM.h>

// Set the PIC timer delay to the number of microseconds between timer calls
#define PIC_TIMER_DELAY 500


void setup_timer(Registers* regs) {
    // Ignore timer interrupts until initialization is complete
}

void timer(Registers* regs) {
    ActiveContextTimerCursorHook(PIC_TIMER_DELAY);
}

void __attribute__((cdecl)) kernel_main(uint32_t boot_drive, uint32_t OriginalMemoryMapPtr){

    initialize_stdio(STD_HACKER_COLOR);

    printf("Kernel I/O Initialization Complete!\n");
    printf("Initializing HAL... ");
    i686_IRQ_RegisterHandler(0, setup_timer); // Do this so any initial timer interrupts are ignored
    HAL_Initialize();
    printf("Done!\nInitializing Memory Manager... ");
    uint64_t usable_ram = FMM_Initialize((AddressRangeDescriptor*)OriginalMemoryMapPtr);
    printf("Done!\nUsable Ram: %llu blocks, %llu bytes\nSystem initialization complete!\n", usable_ram/4096, usable_ram);

    i686_IRQ_RegisterHandler(0, timer);
    i686_IRQ_RegisterHandler(1, Keyboard_Handler);

    CFG_EnableCursorBlinking();
    CFG_SetCursorChar(0xDB);

    int index;

    while(true) {
        printf("user@machine:/$ ");
        scanf("%d", &index);
        PMM_PrintUsableRegionInfo(index);
    }

    /*
    __asm("cli");
    __asm("hlt");
    for(;;);
    */
}