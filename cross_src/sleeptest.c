#include "stdio.h"
#include <stdint.h>

int main() {
    sleep(10000000);
    uint32_t pid = get_pid();
    puts("10 second passed since program started!\n");
    puts("Process "); putd(pid); puts(" exiting!\n");
    exit(0);
}