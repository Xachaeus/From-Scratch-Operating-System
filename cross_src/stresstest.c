#include <stdio.h>

int main() {
    int pid = getpid();
    printf("Process %d starting!\n", pid);
    for (int i = 0; i < 1000000000; i++) {
        if ((i % 100000000) == 0) {
            printf("Process %d did %d00 million iterations!\n", pid, (i/100000000)+1);
        }
    }
    exit(0);
}