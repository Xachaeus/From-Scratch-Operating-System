#include <stdio.h>

int main() {
    int my_pid = getpid();
    puts("[Parent] Starting from the parent with PID "); putd(my_pid); puts("...\n");
    int pid = exec("/bin/cross/exec_c.exe");
    puts("[Parent] Ran child with PID "); putd(pid); puts("\n");
    exit(0);
}