#include <stdio.h>
#include <stdint.h>

int main() {
    uint32_t pid = getpid();
    printf("Process %d starting!\n", pid);
    sleep(10000000);
    printf("10 second passed since program started!\n");
    printf("Process %d exiting!\n");
    return 0;
}