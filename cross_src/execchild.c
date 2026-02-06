#include <stdio.h>

int main() {
    int pid = getpid();
    printf("[Child] Child process has pid %d\n", pid);
    return 0;
}