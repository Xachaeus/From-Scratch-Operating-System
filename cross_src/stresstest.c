#include <stdio.h>

int main() {
    int pid = get_pid();
    puts("Process "); putd(pid); puts(" starting!\n");
    for (int i = 0; i < 1000000000; i++) {
        if ((i % 100000000) == 0) {
            puts("Process "); putd(pid); puts(" did 100 million iterations!\n");
        }
    }
    exit(0);
}