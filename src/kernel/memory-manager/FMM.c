
#include <stdint.h>
#include <HAL/hal.h>
#include "FMM.h"
#include "PMM.h"
#include "VMM.h"

uint64_t FMM_Initialize(AddressRangeDescriptor* mem) {
    uint64_t available_memory = PMM_Initialize(mem);
    uint32_t kernel_page_directory_block = PMM_AllocateBlocks(1);
    uint32_t kernel_page_table_block = PMM_AllocateBlocks(1);
    VMM_Initialize(kernel_page_directory_block, kernel_page_table_block);

    i686_ISR_RegisterHandler(0xe, PageFaultHandler);

    return available_memory;
}

void PageFaultHandler(Registers* saved_state) {
    uint32_t invalid_address;
    asm volatile("mov %%cr2, %0" : "=r"(invalid_address));
    if (!(saved_state->error & 1)) {
        printf("Page Fault: Mapping not found for virtual address 0x%x!\n", invalid_address);
    }
    else {
        printf("Page fault for address 0x%x!\n", invalid_address);
    }
    printf("  interrupt=0x%x  error_code=0x%x  \n", saved_state->interrupt, saved_state->error);
    printf("  eax=%d  ebx=%d  ecx=%d  edx=%d  esi=%d  edi=%d\n", saved_state->eax, saved_state->ebx, saved_state->ecx, saved_state->edx, saved_state->esi, saved_state->edi);
    printf("  kernel_esp=%d  ebp=%d  eip=%d  cs=%d\n  eflags=%d  esp=%d  ss=%d  \n", saved_state->kernel_esp, saved_state->ebp, saved_state->eip, saved_state->cs, saved_state->eflags, saved_state->esp, saved_state->ss);
    for (;;);
}