# From-Scratch Operating System

## Requirements
To run, you'll need to either a) burn the OS image located at build/main_floppy.img onto a floppy disk and boot from that (not recommended) or b) Use Qemu's
builtin i386 simulator (qemu-system-i386) to emulate the image. To build the OS yourself, you'll need OpenWatcom, a GCC cross-compiler, and NASM 
(installation instructions can be found on the osdev wiki).
## Quickstart
To run the existing image without building, you can navigate to the project directory and run:

```qemu-system-i386 -m 512M -no-shutdown -no-reboot -drive file=$(BUILD_DIR)/main_floppy.img,format=raw,index=0,if=floppy```

This project was inspired by the Nanobyte OS video tutorial available on Youtube.
