#ifndef FLOPPY_H
#define FLOPPY_H

#include <stdint.h>
#include <HAL/hal.h>


/*

   *** IMPORTANT CLARIFICATION ***

   This floppy driver is designed to perform the bare minimum amount
   of management necessary to interact with the floppy disk that the
   OS has been burned onto / booted from. It does NOT support multiple
   floppy disks, and it does NOT support removal or swapping  of
   floppy disks while the system is running. It assumes that there is
   exactly one floppy disk present at all times, and  it will NOT 
   support any modifications to this arrangement. Any and all additional
   storage should be provided to the machine in the form of Hard Disk
   Drives or USB media.

*/

enum FloppyRegisters
{
   STATUS_REGISTER_A                = 0x3F0, // read-only
   STATUS_REGISTER_B                = 0x3F1, // read-only
   DIGITAL_OUTPUT_REGISTER          = 0x3F2,
   TAPE_DRIVE_REGISTER              = 0x3F3,
   MAIN_STATUS_REGISTER             = 0x3F4, // read-only
   DATARATE_SELECT_REGISTER         = 0x3F4, // write-only
   DATA_FIFO                        = 0x3F5,
   DIGITAL_INPUT_REGISTER           = 0x3F7, // read-only
   CONFIGURATION_CONTROL_REGISTER   = 0x3F7  // write-only
};

enum FloppyCommands
{
   READ_TRACK =                 2,	// generates IRQ6
   SPECIFY =                    3,      // * set drive parameters
   SENSE_DRIVE_STATUS =         4,
   WRITE_DATA =                 5,      // * write to the disk
   READ_DATA =                  6,      // * read from the disk
   RECALIBRATE =                7,      // * seek to cylinder 0
   SENSE_INTERRUPT =            8,      // * ack IRQ6, get status of last command
   WRITE_DELETED_DATA =         9,
   READ_ID =                    10,	// generates IRQ6
   READ_DELETED_DATA =          12,
   FORMAT_TRACK =               13,     // *
   DUMPREG =                    14,
   SEEK =                       15,     // * seek both heads to cylinder X
   VERSION =                    16,	// * used during initialization, once
   SCAN_EQUAL =                 17,
   PERPENDICULAR_MODE =         18,	// * used during initialization, once, maybe
   CONFIGURE =                  19,     // * set controller parameters
   LOCK =                       20,     // * protect controller params from a reset
   VERIFY =                     22,
   SCAN_LOW_OR_EQUAL =          25,
   SCAN_HIGH_OR_EQUAL =         29
};

enum FloppyCommandBitflags {
   MT = 0x80, // Multitrack Mode - the controller will automatically switch from head 0 to head 1 at the end of a track
   MF = 0x40, // "MFM" Magnetic Encoding Mode - Always set it for read/write/format/verify operations.
   SK = 0x20  // Skip Mode - skips deleted sectors.
};

void DISK_Floppy_IRQ6Handler(Registers* regs);

int DISK_Floppy_Initialize(int drive_number);
int DISK_Floppy_IssueCommand(uint8_t command, uint8_t* results_buffer, uint8_t* params);

int DISK_Floppy_ReadSector(uint32_t lba);

#endif