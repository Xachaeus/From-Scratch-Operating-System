#include "stdio.h"
#include <stdint.h>

int main() {
    uint32_t pid = getpid();
    puts("Process "); putd(pid); puts(" starting!\n");
    sleep(10000000);
    puts("10 second passed since program started!\n");
    puts("Process "); putd(pid); puts(" exiting!\n");
    exit(0);
}