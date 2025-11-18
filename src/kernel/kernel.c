
#include <HAL/hal.h>
#include <hardware-io/io.h>
#include <keyboard/keyboard.h>
#include <memory-manager/FMM.h>
#include <memory-manager/PMM.h>
#include <disk/floppy.h>
#include <filesys/fat12.h>
#include <syscall.h>
#include <CLI.h>

#include <delay.h>
#include <memory.h>
#include <string.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <proc/proc.h>
#include <proc/load.h>

// Set the PIC timer delay to the number of microseconds between timer calls
#define PIC_TIMER_DELAY 100


uint32_t CurrentAvailablePID = 0;


void setup_timer(Registers* regs) {
    // Ignore timer interrupts until initialization is complete
}

void timer(Registers* regs) {
    ActiveContextTimerCursorHook(PIC_TIMER_DELAY);
    ActiveContextTimerSleepHook(PIC_TIMER_DELAY);

    SchedulerHook(PIC_TIMER_DELAY, (Context*)regs);
}

void __attribute__((cdecl)) kernel_main(uint32_t boot_drive, uint32_t OriginalMemoryMapPtr){

    initialize_stdio(STD_HACKER_COLOR);

    printf("Kernel I/O Initialization Complete!\nBooted from drive: %lu\n", boot_drive);
    printf("Initializing HAL... ");
    i686_IRQ_RegisterHandler(0, setup_timer); // Do this so any initial timer interrupts are ignored
    HAL_Initialize();
    i686_ISR_RegisterHandler(0x80, SyscallEntrypoint);

    printf("Done!\nInitializing Memory Manager...");
    uint64_t usable_ram = FMM_Initialize((AddressRangeDescriptor*)OriginalMemoryMapPtr);
    printf("Done!\nUsable Ram: %llu blocks, %llu bytes\n", usable_ram/4096, usable_ram);
    i686_IRQ_RegisterHandler(0, timer);
    i686_IRQ_RegisterHandler(1, Keyboard_Handler);

    printf("Initializing Floppy Disk Controller...");
    i686_IRQ_RegisterHandler(6, DISK_Floppy_IRQ6Handler);
    DISK_Floppy_Initialize(boot_drive);
    printf("Done!\n");

    printf("Initializing filesystem... ");
    FAT12_Initialize();
    printf("Done!\n");

    printf("System initialization complete!\n");

    CFG_EnableCursorBlinking();
    CFG_SetCursorChar(0xDB);

    ProcessControlBlock test;
    test.pid = CurrentAvailablePID++;
    LoadProc("/cross/hello", &test);
    //printf("DEBUG: state of proc: 0x%x\n", test.proc_state);
    //printf("DEBUG: Text virtual address: 0x%x\n", test.text_section.BaseAddress);
    //printf("DEBUG: Text section active: %d\n", test.text_section.isActive);

    printf("Executing process...\n");
    ExecProc(&test);

    CLI_Mainloop();

}