### Kernel Source Code

The entrypoint of the kernel which is immediately jumped to upon the conclusion of Stage 2 of the bootloader is located in the main.s file;
however, this is simply to ensure that all symbols are aligned with the beginning of the emitted kernel binary as would generally be expected,
and main.s immediately transfers control to the kernel.c file. Kernel.c is responsible for initializing all of the submodules of the kernel, and then
launching the CLI for user input and operation. The rest of the files at this level are either SolOS-specific implementations of C standard libraries,
general-purpose libraries used across submodules, or critical primary functions of the OS, such as the CLI or syscall implementations.