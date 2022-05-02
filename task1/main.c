#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void printBinary(int num);
extern int convert2num(char *str);

int main(int argc, char **argv) {
    int b = 0;

    if (argc > 1) {
        b = convert2num(argv[1]);
        printf("b=%d\n", b);
        printBinary(b);
        return 0;
    }
    return 1;
}

void printBinary(int num) {
    int i;
    for (i = 31; i >= 0; i--) {
        if (num & (1<<i))
            printf("1");
        else 
            printf("0");
    }
}