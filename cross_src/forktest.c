#include <stdio.h>

int main() {
    puts("Starting process!\n");
    int rc = fork();
    int pid = getpid();
    if (rc == 0) {
        printf("[CHILD] Child process has pid %d!\n", pid);
    }
    else {
        printf("[PARENT] Child process has pid %d!\n", rc);
    }
    return 0;
}