/*
Se citește o valoare de tip int. Se cere să se afișeze valoarea bitului de semn. Nu se cunoaște a priori dimensiunea tipului de date int.
*/

#include <stdint.h>
#include <stdio.h>

void sign_bit(int n)
{
    n = n >> (sizeof(int) * 8 - 1);

    if(n != 0)
        printf("Numarul este negativ\n");
    else
        printf("Numarul este pozitiv\n");
}

int main(void)
{
    int n = 0;
    scanf("%d", &n);

    sign_bit(n);
    return 0;
}

/*

#include <stdio.h>
#include <stdint.h>

void showbits(int x){
    uint32_t mask = 1 << (sizeof(x)*8-1);
    for(int i = 0; i < sizeof(x)*8 ; i++){
        if(x&mask){
            printf("1");
        }
        else{
            printf("0");
        }
        if((i+1) % 4 == 0){
            printf(" ");
        }
        mask >>= 1;
    }
    printf("\n");
}

int main(){
    int x;              // sizeof(x) = 4
    printf("x = ");

    scanf("%d", &x);

    printf("x = ");
    showbits(x);

    if(x & (1 << (sizeof(x)*8-1))){
        printf("bitul de semn este 1\n");
    }
    else{
        printf("bitul de semn este 0\n");
    }
    return 0;
}

*/