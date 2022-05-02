#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

typedef struct very_long{
    long high ; /* = 8 byte */
    long low ; /* = 8 byte */
}very_long ;
extern int str2long(char *str, very_long *num) ;

extern void add_long(very_long *num1,very_long *num2) ;

int main(int argc, char **argv){
    char str[32];
    char stop_s[32] = "q";
    very_long sum;
    sum.low = 0;
    sum.high = 0;
    very_long *sum_p = &sum;

    printf("Please enter a number: ");
    gets(str);
    while(strcmp(str,stop_s) != 0){
        if(strcmp(str,"p") == 0){
            printf("0x%lx%lx\n",sum.high,sum.low);
        }else{
            very_long num;
            num.low = 0;
            num.high = 0;
            very_long *num_p = &num;
            str2long(str, num_p);
            add_long(sum_p, num_p);
        }
        
        printf("Please enter a number: ");
        gets(str);
    } 

    return 0;
}

