#include <stdio.h>
#include <stddef.h>

int main() {
    int my_pid = getpid();
    printf("[Parent] Starting from the parent with PID %d...\n", my_pid);
    int pid = exec("/bin/cross/exec_c.exe", 0, NULL);
    my_pid = getpid();
    printf("[Parent] Self has pid %d; Ran child with pid %d\n", my_pid, pid);
    return 0;
}