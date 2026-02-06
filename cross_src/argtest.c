#include <stdio.h>
#include <stdint.h>

int main(int argc, char** argv) {
    printf("Got argc: %d\n", argc);
    for (int i=0; i<argc; i++) {
        printf("ARGV[%d]: %s\n", i, argv[i]);
    }
    return 0;
}