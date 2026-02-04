#include <stdio.h>

int main() {
    int my_pid = getpid();
    printf("[Parent] Starting from the parent with PID %d...\n", my_pid);
    int pid = exec("/bin/cross/exec_c.exe");
    printf("[Parent] Ran child with pid %d\n", pid);
    exit(0);
}