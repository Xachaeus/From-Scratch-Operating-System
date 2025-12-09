#include <stdio.h>

int main() {
    puts("Starting process!\n");
    int rc = fork();
    int pid = getpid();
    if (rc == 0) {
        puts("[CHILD] Child process has pid "); putd(pid); puts("!\n");
    }
    else {
        puts("[PARENT] child process has pid "); putd(rc); puts("; parent has pid "); putd(pid); puts("!\n");
    }
    exit(0);
}