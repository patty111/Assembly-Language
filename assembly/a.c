#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>


int main(){
    char num[8];
    scanf("%s",&num);
    int len = strlen(num);
    int convert = 0;


    for (int i=len-1;i>=0;i--){
        int pow = 1;
        for (int j=0;j<len-i-1;j++)
            pow *= 10;
        
        convert += (num[i]-'0') * pow;
    }

    printf("%d\n", convert);








    return 0;
}