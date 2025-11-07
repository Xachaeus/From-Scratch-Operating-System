#include "floppy.h"

#include <hardware-io/io.h>
#include <arch/x86/PIC8259.h>
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <stdarg.h>
#include <memory-manager/FMM.h>
#include <delay.h>

#define MAX_SECTOR_REGIONS 16

#define HEADS_PER_CYLINDER 2
#define SECTORS_PER_TRACK 18

#define SRT 8
#define HLT 5
#define HUT 15

uint8_t volatile g_WaitingForIRQ6 = 0;
uint8_t g_FloppyNum;




int GetCommandParamCount(int command) {
    switch (command&0x1F) {
        case CONFIGURE:
            return 3;
        case VERSION:
            return 0;
        case 0x14: // Lock
            return 0;
        case SPECIFY:
            return 2;
        case SENSE_INTERRUPT:
            return 0;
        case RECALIBRATE:
            return 1;
        case SEEK:
            return 2;
        case READ_DATA:
        case WRITE_DATA:
            return 8;
        default:
            return 0;
    }
}

int GetCommandAwaitIRQ6(int command) {
    switch (command&0x1F) {
        case CONFIGURE:
            return 0;
        case VERSION:
            return 0;
        case 0x14: // Lock
            return 0;
        case SPECIFY:
            return 0;
        case SENSE_INTERRUPT:
            return 0;
        case RECALIBRATE:
            return 1;
        case SEEK:
            return 1;
        case READ_DATA:
        case WRITE_DATA:
            return 1;
        default:
            return 0;
    }
}

int GetCommandReturnCount(int command) {
    switch (command&0x1F) {
        case CONFIGURE:
            return 0;
        case VERSION:
            return 1;
        case 0x14: // Lock
            return 1;
        case SPECIFY:
            return 0;
        case SENSE_INTERRUPT:
            return 2;
        case RECALIBRATE:
            return 0;
        case SEEK:
            return 0;
        case READ_DATA:
        case WRITE_DATA:
            return 7;
        default:
            return 0;
    }
}

uint8_t* DISK_Floppy_GetSectorAddr(uint8_t sector) {
    return (uint8_t*)(FMM_GetDMAAddress() + 512*sector);
}




void DISK_Floppy_IRQ6Handler(Registers* regs) {
    g_WaitingForIRQ6 = 1;
    //printf("IRQ6\n");
    //printf("IRQ6: MRQ is 0x%hhx\n", i686_inb(MAIN_STATUS_REGISTER));
}



void lba2chs(uint32_t lba, uint8_t* cylinder, uint8_t* head, uint8_t* sector) {
    *cylinder = lba / (HEADS_PER_CYLINDER * SECTORS_PER_TRACK);
    *head = (lba % (HEADS_PER_CYLINDER * SECTORS_PER_TRACK)) / SECTORS_PER_TRACK;
    *sector = (lba % SECTORS_PER_TRACK) + 1;
}

void WaitForIRQ6() {
    //printf("Awaiting IRQ6...\n");
    uint64_t count = 0;
    while (!g_WaitingForIRQ6) {}
    g_WaitingForIRQ6 = 0;
}

int WaitForFIFO() {
    //printf("Awaiting FIFO...\n");
    uint8_t msr_val = i686_inb(MAIN_STATUS_REGISTER);
    while ((msr_val&0x80) != 0x80) {msr_val = i686_inb(MAIN_STATUS_REGISTER);}
    return msr_val;
}



void PrepareDMAForTransfer(uint32_t target_address, uint16_t count) {
    i686_outb(0x0a, 0x06); // Mask DMA channel 2

    i686_outb(0x0c, 0xff); // Reset the flip-flop
    i686_outb(0x04, target_address & 0xFF); // Send low byte of address
    i686_outb(0x04, (target_address >> 8) & 0xFF); // Send middle byte of address

    i686_outb(0x0c, 0xFF); // Reset the flip-flop
    i686_outb(0x05, (count-1)&0xFF); // Send low byte of count
    i686_outb(0x05, ((count-1)>>8)&0xFF); // Send high byte of count

    i686_outb(0x81, (target_address>>16)&0xFF); // Send high byte of address to the external page register
    i686_outb(0x0a, 0x02); // Unmask channel 2
}

void PrepareDMAForWrite(uint32_t target_address, uint16_t count) {
    PrepareDMAForTransfer(target_address, count);
    i686_outb(0x0a, 0x06); // Mask channel 2
    i686_outb(0x0b, 0b01011010); // Set bitflags: single tranfer, address increment, autoinit, write, channel 2
    i686_outb(0x0a, 0x02); // Unmask channel 2
}

void PrepareDMAForRead(uint32_t target_address, uint16_t count) {
    i686_outb(0x0a, 0x06); // Mask DMA channel 2

    i686_outb(0x0c, 0xFF); // Reset the flip-flop
    i686_outb(0x04, target_address & 0xFF); // Send low byte of address
    i686_outb(0x04, (target_address >> 8) & 0xFF); // Send middle byte of address

    i686_outb(0x81, (target_address>>16)&0xFF); // Send high byte of address to the external page register

    i686_outb(0x0c, 0xFF); // Reset the flip-flop
    i686_outb(0x05, (count-1)&0xFF); // Send low byte of count
    i686_outb(0x05, ((count-1)>>8)&0xFF); // Send high byte of count

    i686_outb(0x0b, 0b01010110); // Set bitflags: single tranfer, address increment, autoinit, read, channel 2

    i686_outb(0x0a, 0x02); // Unmask channel 2
}





void FDC_SetBit(uint16_t port, uint8_t bit, int val) {
    if (val) {i686_outb(port, i686_inb(port)|bit);}
    else {i686_outb(port, i686_inb(port)&(~bit));}
}


int DISK_Floppy_Reset() {

    // Perform a controller reset using the DSR register
    //FDC_SetBit(DATARATE_SELECT_REGISTER, 0x80, 1); // Generates IRQ 6
    //WaitForIRQ6();
    i686_outb(DIGITAL_OUTPUT_REGISTER, 0x0);
    sleep(20000);

    // Make sure the motor starts spinning
    i686_outb(DIGITAL_OUTPUT_REGISTER, 0x1C);
    sleep(500000);

    WaitForIRQ6();

    uint8_t int_results[2];
    i686_outb(DATA_FIFO, 0x08);
    WaitForFIFO();
    i686_inb(DATA_FIFO);
    i686_inb(DATA_FIFO);

    //printf("FDC Reset! 0x%hhx\n", i686_inb(MAIN_STATUS_REGISTER));

    return 0;
}


int DISK_Floppy_Initialize(int drive_number) {
    g_FloppyNum = drive_number;

    //DISK_Floppy_Reset();

    // Step 1: Check the version
    uint8_t version_num = 0xFF;
    DISK_Floppy_IssueCommand(VERSION, &version_num, NULL);
    //printf("FDC Version: 0x%x\n", version_num);
    if (version_num != 0x90) {printf("Warning: Unsupported floppy driver! Version 0x%hhx", version_num);}

    // Set the entire CCR to 0 for 1.44MB floppy disk
    i686_outb(CONFIGURATION_CONTROL_REGISTER, 0x0);

    // Step 2: Configure the drive
    uint8_t config_args[] = {0, ((1<<6)|(0<<5)|(1<<4)|(0x07)), 0};
    DISK_Floppy_IssueCommand(CONFIGURE, NULL, config_args); // Implied Seek On, FIFO On, Drive Polling Off, Threshold = 8
    uint8_t lock_return;
    DISK_Floppy_IssueCommand(LOCK, &lock_return, NULL);

    // Step 3: Do a controller reset
    DISK_Floppy_Reset();


    //Step 2.5: Specify the state of the floppy being used
    uint8_t specify_args[] = {((SRT << 4) | HUT), ((HLT << 1) | 0)};
    DISK_Floppy_IssueCommand(SPECIFY, NULL, specify_args);


    // Step 4: Send a recalibrate command to the floppy
    DISK_Floppy_IssueCommand(RECALIBRATE, NULL, &g_FloppyNum);

    // Step 5: Send a Sense Interrupt command since we ran a Recalibrate command
    uint8_t int_results[2];
    DISK_Floppy_IssueCommand(SENSE_INTERRUPT, int_results, NULL);
    //printf("Initialization results: 0x%hhx\n", int_results[0]);

    return 0;
}



int DISK_Floppy_IssueCommand(uint8_t command, uint8_t* results_buffer, uint8_t* params) {
    uint8_t failure_count = 0;
    uint8_t* argv;

    int await_irq6 = GetCommandAwaitIRQ6(command);
    int argc = GetCommandParamCount(command);

    
    for (int failure_count = 0; failure_count < 3; failure_count++) {


        argv = params;

        // Step 1: Verify that RQM = 1 and DIO = 0 before issuing command
        uint8_t msr_byte = i686_inb(MAIN_STATUS_REGISTER);
        //rintf("MSR Byte: 0x%hhx, iteration %d\n", msr_byte, failure_count);

        if (!((WaitForFIFO() & 0xC0) == 0x80)) {
            printf("Floppy: Error, for cmd 0x%hhx MSR does not match expected! 0x%hhx\n", command, msr_byte);
            //DISK_Floppy_Reset();
            sleep(300000);
            continue;
        }

        // Step 2: Send command to the FIFO port and wait for confirmation
        i686_outb(DATA_FIFO, command);
        if ((argc > 0) && ((WaitForFIFO()&0xC0) != 0x80)) {printf("Floppy: Error sending command!\n"); continue;}

        // Step 3: Send parameters to the FIFO port and await confirmation
        for (int i=0; i<argc; i++) {
            if ((WaitForFIFO()&0xC0) != 0x80) { printf("Floppy: Error sending parameter %d: 0x%hhx!\n", i, i686_inb(MAIN_STATUS_REGISTER)); continue; }
            //if ((command&0x6) == 0x6) {printf("Sending param 0x%hhx\n", *argv);}
            i686_outb(DATA_FIFO, *argv);
            argv++;
        }

        // Step 4: Wait for results to be ready
        if (await_irq6) {WaitForIRQ6();}

        // Step 5: Read results into results buffer
        for (int i = 0; i < GetCommandReturnCount(command); i++) {
            while ((WaitForFIFO()&0xD0) != 0xD0) {}
            results_buffer[i] = i686_inb(DATA_FIFO);
        }

        // Step 6: Check results for error codes
        if ((WaitForFIFO()&0x50) != 0x0) {printf("Floppy: Error getting command results!\n"); continue;}

        return 0;


    }

    printf("Floppy: Catastrophic Failure issuing command!\n");
    return 1;
}




int DISK_Floppy_ReadSector(uint32_t lba) {

    uint32_t destination_address = FMM_GetDMAPhysAddress(); // Always returns 0x102000
    uint32_t virtual_destination_address = FMM_GetDMAAddress();

    //printf("Dest Address: 0x%x : 0x%x\n", destination_address, virtual_destination_address);

    //printf("Memory contents before read: ");
    //for (int i = 0; i<0x10; i++) {
    //    printf("%x ", ((uint8_t*)virtual_destination_address)[i]);
    //}
    //printf("\n");

    uint8_t cylinder, head, sector;
    lba2chs(lba, &cylinder, &head, &sector);
    PrepareDMAForRead(destination_address, 512);

    //printf("Seeking...\n");
    uint8_t seek_args[] = {(uint8_t)((head<<2) | g_FloppyNum), cylinder};
    DISK_Floppy_IssueCommand(SEEK, NULL, seek_args);
    uint16_t int_results;
    DISK_Floppy_IssueCommand(SENSE_INTERRUPT, (uint8_t*)&int_results, NULL);
    //printf("Seek results: 0x%hx\n", int_results);

    //printf("Performing read...\n");
    //printf("\nREAD DEBUG:\nWeird Head Thing: 0x%hhx\nExact Command: 0x%hhx\nDMA mode: 0x%hhx\n\n", (uint8_t)((head<<2) | g_FloppyNum), (uint8_t)(0x06 | MF), 0b01010110);

    uint8_t results[7];
    uint8_t read_args[] = {
        (uint8_t)((head<<2) | g_FloppyNum),  // (Head_number << 2) | drive
        cylinder,           // Cylinder number
        head,               // Head number
        sector,             // Starting sector number
        (uint8_t)2,         // 2 (all floppies have 512 byte sectors)
        (uint8_t)18,        // Last sector number on track
        (uint8_t)0x1b,      // 1B (gap number)
        (uint8_t)0xff       // FF (data length)
    };

    DISK_Floppy_IssueCommand((READ_DATA | MT | MF), results, read_args);

    //printf("st0: 0x%hhx   st1: 0x%hhx   st2: 0x%hhx\n", results[0], results[1], results[2]);
    //printf("cyl: 0x%hhx   head: 0x%hhx  sector: 0x%hhx\n", results[3], results[4], results[5]);
    //printf("Memory contents after read: ");
    //for (int i = 0; i<0x10; i++) {
    //    printf("%x ", ((uint8_t*)virtual_destination_address)[i]);
    //}
    //printf("\n");
    return 0;
}


int DISK_Floppy_ReadSectors(uint32_t lba, uint8_t sector_count) {

    if (sector_count > MAX_SECTOR_REGIONS) {return 1;}

    uint32_t destination_address = FMM_GetDMAPhysAddress(); // Always returns 0x102000
    uint32_t virtual_destination_address = FMM_GetDMAAddress();

    uint8_t cylinder, head, sector;
    lba2chs(lba, &cylinder, &head, &sector);
    PrepareDMAForRead(destination_address, 512*sector_count);

    //printf("Seeking...\n");
    uint8_t seek_args[] = {(uint8_t)((head<<2) | g_FloppyNum), cylinder};
    DISK_Floppy_IssueCommand(SEEK, NULL, seek_args);
    uint16_t int_results;
    DISK_Floppy_IssueCommand(SENSE_INTERRUPT, (uint8_t*)&int_results, NULL);

    uint8_t results[7];
    uint8_t read_args[] = {
        (uint8_t)((head<<2) | g_FloppyNum),  // (Head_number << 2) | drive
        cylinder,           // Cylinder number
        head,               // Head number
        sector,             // Starting sector number
        (uint8_t)2,         // 2 (all floppies have 512 byte sectors)
        (uint8_t)18,        // Last sector number on track
        (uint8_t)0x1b,      // 1B (gap number)
        (uint8_t)0xff       // FF (data length)
    };

    DISK_Floppy_IssueCommand((READ_DATA | MT | MF), results, read_args);

    return 0;
}

int DISK_Floppy_ReadSectorsTo(uint32_t lba, uint8_t sector_start, uint8_t sector_count) {

    if (sector_start + sector_count - 1 > MAX_SECTOR_REGIONS) {return 1;}

    uint32_t destination_address = FMM_GetDMAPhysAddress() + 512 * sector_start; // Always returns 0x102000
    uint32_t virtual_destination_address = FMM_GetDMAAddress() + 512 * sector_start;

    uint8_t cylinder, head, sector;
    lba2chs(lba, &cylinder, &head, &sector);
    PrepareDMAForRead(destination_address, 512*sector_count);

    //printf("Seeking...\n");
    uint8_t seek_args[] = {(uint8_t)((head<<2) | g_FloppyNum), cylinder};
    DISK_Floppy_IssueCommand(SEEK, NULL, seek_args);
    uint16_t int_results;
    DISK_Floppy_IssueCommand(SENSE_INTERRUPT, (uint8_t*)&int_results, NULL);

    uint8_t results[7];
    uint8_t read_args[] = {
        (uint8_t)((head<<2) | g_FloppyNum),  // (Head_number << 2) | drive
        cylinder,           // Cylinder number
        head,               // Head number
        sector,             // Starting sector number
        (uint8_t)2,         // 2 (all floppies have 512 byte sectors)
        (uint8_t)18,        // Last sector number on track
        (uint8_t)0x1b,      // 1B (gap number)
        (uint8_t)0xff       // FF (data length)
    };

    DISK_Floppy_IssueCommand((READ_DATA | MT | MF), results, read_args);

    return 0;
}