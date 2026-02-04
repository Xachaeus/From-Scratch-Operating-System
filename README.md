# From-Scratch Operating System

## Requirements
To run, you'll need to either a) burn the OS image located at build/main_floppy.img onto a floppy disk and boot from that (not recommended) or b) Use Qemu's
builtin i386 simulator (qemu-system-i386) to emulate the image. To build the OS yourself, you'll need OpenWatcom, a GCC cross-compiler, and NASM 
(installation instructions can be found on the osdev wiki).
## Quickstart
To run the existing image without rebuilding (building again is not necessary as QEMU will support the existing image regardless of host system), you can navigate to the project directory and run:

```qemu-system-i386 -m 512M -no-shutdown -no-reboot -drive file=build/main_floppy.img,format=raw,index=0,if=floppy```

This project was inspired by the Nanobyte OS video tutorial available on Youtube. While this OS uses some code directly from the tutorial's example OS (particularly for the bootloader), the kernel for this OS is entirely original.

## Supported CLI Commands

 - ```ls``` : Lists the contents of the current directory
 - ```cd <path>``` : Changes the current directory to the specified path. Supports relative/absolute paths and multi-level paths (i.e. ```cd ../bin/./```)
 - ```exec <path> <flags>``` : Executes a .exe file specified by path. Supports relative/absolute paths and multi-level paths. Currently accepted flags are:
    - ```&``` : Launches process in background and returns to CLI. Current implementation does NOT support running additional commands after this flag.
    - ```-m```: Launches 5 copies of the program as multiple processes.
 - ```cat <path>``` : Prints contents of the file specified by path to the command line, assuming ASCII-formatting and null-termination.
 - ```ps```: Lists the PIDs and statuses of all currently active processes.
 - ```mem``` : Lists the total amount of memory currently in use.

## Supported System Calls for SolOS-Compiled Programs
 - ```exit(int exit_code)```: Stops the program with the provided exit code. MUST BE CALLED TO END PROGRAM EXECUTION CLEANLY.
 - ```puts(const char* str)```: Prints a literal string to the screen. Does NOT support formatting.
 - ```putd(int d)```: Prints a single number to the screen as a 32-bit integer.
 - ```sleep(int microseconds)```: Puts the process into standby mode for the provided number of microseconds.
 - ```getpid()```: Gets the process ID of the running program.
 - ```fork()```: Forks the currently-running process into a parent and child process. Returns 0 for the child process, returns child_pid for the parent process.
 - ```exec(const char* path)```: Executes the program at the provided path.

## Supported Standard Functions for SolOS-Compiled Programs
 - ```printf(const char* fmt, ...)```: A rudimentary implementation of printf.

### Notes for future changes:

#### ~~Physical Memory Allocation via bitmap with Available Spots Optimization~~ (Implemented)

Explanation: Initialize an array of N wedges, where each wedge contains a pointer to some block index, and a number representing
the total number of free blocks prior to that index. Have each wedge start at index 0 and count 0. When allocating a block or number
of blocks, begin wedge-checking at wedge n=0. Wedge-checking goes as follows:
 - If there are not enough total free blocks prior to wedge n,  begin first fit search at the index in wedge n, and when completed, 
 update all wedges prior to and including wedge n to point to the end of the found block (as appropriate; some wedges may not need pushing)
 - If there are enough total free blocks, restart wedge check at wedge n+1.
When freeing a region of blocks, update the "total free blocks" field of all wedges after the end of that region. If any
wedges align to the end of that region, relocate them to the beginning of that region.


#### ~~Virtual Memory Management~~ (Implemented)

For now, let's have an identity mapping for everything up to address 0x100000 (the first megabyte), and four additional mappings: one for the page directory, so the kernel can always access it, one for an active page table, which can be modified to point to any page table that the kernel may need to access, and two for DMA R/W operations, which can only be performed on physical addresses within the first 16MB of memory (address 0x00FFFFFF). That way, when an interrupt occurs, there's no inherent need to reset the kernel pages in order to run the interrupt handler. When I write the loader, I'll have it start all code at 0x104000, so user-space programs will be able to access the (virtual) address range 0x00104000 - 0xFFFFFFFF.


#### User-Space CLI

Currently, the CLI only works through the kernel directly, as system calls for executing other program or reading through the filesystem have not
been implemented yet. Using a CLI program that runs in user-space as a process would make process management much easier (as it would not require switching back to
ring 0 for long durations) and make it much easier to launch processes that run in the background.


#### Appropriate Handling of Page Faults

#### Loading more complex executables

#### Page-Swapping

#### Booting/Handling with Non-Floppy Disks

#### Supporting filesystems beyond FAT12

#### Changing VGA Display size

## Technical Details

 - Entrypoint for stage 1 of bootloader: src/bootloader/stage1/boot.asm
 - Entrypoint for stage 2 of bootloader: src/bootloader/stage2/main.asm and src/bootloader/stage2/main.c
 - Entrypoint for kernel: src/kernel/kernel.c

The bootloader uses Open Watcom as its C cross-compiler and NASM as its assembler to make it easier to write code for 16-bit real mode.
The kernel uses the GNU toolchain for its cross-compiler and assembler for ease of use and familiarity purposes.

The OS currently only supports loading from a floppy disk with the FAT12 file system format, and only supports graphics through VGA Text Mode. 
It utilizes the PIC8259 chip for its interrupt request controller,
the PIT8254 for its programmable system timer, and the 82077A floppy disk controller for I/O operations.