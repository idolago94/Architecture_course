#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char **argv) {
    bool isnum;  
    char str[1000];
    char str2[1000];

    printf("Please enter a paragraph ");
    gets(str);

    while(strcmp(str, "") != 0) {
        if(48 <= str[0] && str[0] <= 57)
            isnum = true;

        FILE * fp;
        char * line = NULL;
        size_t len = 0;
        size_t read;
        fp = fopen(argv[1], "r");

        while ((read = getline(&line, &len, fp)) != -1) {
            if(isnum == true){
                strncpy(str2,&line[atoi(str)],5);
                printf("%s\n", str2);
            }
            else if(strstr(line, str))
                printf("%s", line);
        }  

        fclose(fp);

        printf("Please enter a paragraph ");
        gets(str);
    }

    return 1;
}

