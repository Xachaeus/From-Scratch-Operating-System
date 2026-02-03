#include <stdio.h>

int main() {
    int pid = getpid();
    puts("[Child] Child process has PID "); putd(pid); puts("\n");
    exit(0);
}