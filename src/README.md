### Operating System Source Code

This directory contains all of the source code that is actually compiled into the final operating system.
It is important to note that the build system for this source code is separated from the build system for external programs;
those programs are compiled into ELF32 executables and then loaded into the disk image containing the OS as FAT12 files,
and are NOT compiled into the same binary as the bootloader or kernel.

The bootloader contains two stages in order to support legacy booting:
 - Stage 1 is written entirely in NASM assembly, and creates a 512-byte executable cotnaining the FAT12 header and signature expected by the BIOS for legacy booting. Its sole purpose is to load Stage 2 of the bootloader into memory and transfer control to it, so as to not constrain the full boot process to only 512 bytes.
 - Stage 2 is a mixture of assembly and C, and is compiled with OpenWatcom so that it can be emitted as 16-bit Real-Mode-compatible instructions. Its job is to load the kernel into memory, establish a Global Descriptor Table (GDT), and switch the CPU into 32-bit Protected Mode.



The kernel is stored as a single raw binary and contains a great deal of subsections; each subsection of the kernel code has its own README, so explore the code to learn more about it.