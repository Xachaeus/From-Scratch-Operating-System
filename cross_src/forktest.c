#include <stdio.h>

int main() {
    puts("Starting process!\n");
    int rc = fork();
    int pid = getpid();
    if (rc == 0) {
        printf("[CHILD] Child process has pid %d!\n", pid);
    }
    else {
        printf("[PARENT] Self has pid %d; Child process has pid %d!\n", pid, rc);
    }
    return 0;
}