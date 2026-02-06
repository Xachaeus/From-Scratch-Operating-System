#include <stdio.h>
#include <stddef.h>

int main() {
    int my_pid = getpid();
    printf("[Parent] Starting from the parent with PID %d...\n", my_pid);
    int pid = exec("/bin/cross/exec_c.exe", 0, NULL);
    printf("[Parent] Ran child with pid %d\n", pid);
    return 0;
}