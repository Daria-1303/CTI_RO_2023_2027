/*
14
Un nibble este un grup de 4 biti. Să se scrie un program care primește un număr fără semn n și această funcție
a) returnează valoarea acestui număr cu ordinea inversă a nibble-urilor
b) returnează valoarea acestui număr cu biții din fiecare nibble în ordine inversă
*/

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

void inversare_nibblesa(uint32_t n)
{
    uint32_t invers = 0;

    for (int i = 0; i < 32; i += 8) // 32 de biti, 8 biti pe grupa
    {
        uint32_t jumate = (n >> i) & 0xFF; // extragem grupa de 8 biti
        jumate = ((jumate & 0x0F) << 4) | ((jumate & 0xF0) >> 4); // inversam grupa de 8 biti
        invers |= jumate << (24 - i); // punem grupa de 8 biti inversata la locul ei
    }

    printf("Nr inversat este a ): %u \n", invers);
    showbits(invers);
}


void biti_inversati_in_nibble(uint32_t n)
{
    //returnează valoarea acestui număr cu biții din fiecare nibble în ordine inversă
    uint32_t invers = 0;

    for (int i = 0; i < 32; i += 8) // 32 de biti, 8 biti pe grupa
    {
        uint32_t jumate = (n >> i) & 0xFF; // extragem grupa de 8 biti
        jumate = ((jumate & 0x0F) << 4) | ((jumate & 0xF0) >> 4); // inversam grupa de 8 biti
        invers |= jumate << (24 - i); // punem grupa de 8 biti inversata la locul ei
    }

    printf("Nr inversat este 1 : %u \n", invers);
    showbits(invers);

}

unsigned int reverse_nibbles(unsigned int n) {
    unsigned int result = 0;
    for (int i = 0; i < 8; i++) {
        unsigned int nibble = (n >> (4 * i)) & 0xF;
        nibble = ((nibble * 0x0802LU & 0x22110LU) | (nibble * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
        result |= nibble << (4 * i);
    }
    return result;
}

uint32_t reverse_nibblesc(uint32_t x) {
    // Shift right pentru a separa fiecare nibble
    uint32_t nibble1 = (x >> 0) & 0x0F;
    uint32_t nibble2 = (x >> 4) & 0x0F;
    uint32_t nibble3 = (x >> 8) & 0x0F;
    uint32_t nibble4 = (x >> 12) & 0x0F;

    // Inversarea ordinei biților în fiecare nibble
    nibble1 = ((nibble1 & 0b1000) >> 3) | ((nibble1 & 0b0100) >> 1) | ((nibble1 & 0b0010) << 1) | ((nibble1 & 0b0001) << 3);
    nibble2 = ((nibble2 & 0b1000) >> 3) | ((nibble2 & 0b0100) >> 1) | ((nibble2 & 0b0010) << 1) | ((nibble2 & 0b0001) << 3);
    nibble3 = ((nibble3 & 0b1000) >> 3) | ((nibble3 & 0b0100) >> 1) | ((nibble3 & 0b0010) << 1) | ((nibble3 & 0b0001) << 3);
    nibble4 = ((nibble4 & 0b1000) >> 3) | ((nibble4 & 0b0100) >> 1) | ((nibble4 & 0b0010) << 1) | ((nibble4 & 0b0001) << 3);

    // Combinația nibble-urilor pentru a obține rezultatul final
    uint32_t result = (nibble4 << 12) | (nibble3 << 8) | (nibble2 << 4) | nibble1;
    
    return result;
}

int main(void)
{
    uint32_t n;
    printf("Numarul fara semn este : ");
    scanf("%u", &n);
    uint32_t x = n;

    printf("Nr initial este: %u \n", x);
    showbits(x);
    printf("\n");

    biti_inversati_in_nibble(n);
    printf("\n");


    inversare_nibblesa(n);
    printf("\n");
    uint32_t invers = reverse_nibbles(n);
    printf("Nr inversat este 2 : %u \n", invers);
    showbits(invers);

    printf("\n");
   printf("\n");
    
    uint32_t invers3 = reverse_nibblesc(n);
    printf("Nr inversat este 3 : %u \n", invers3);
    showbits(invers3);


    return 0;
}
/*
Numarul fara semn este : 1234
Nr initial este: 1234 
0000 0000 0000 0000 0000 0100 1101 0010 

Nr inversat este 1 : 759169024 
0010 1101 0100 0000 0000 0000 0000 0000 

Nr inversat este a ): 759169024
0010 1101 0100 0000 0000 0000 0000 0000

Nr inversat este 2 : 2763584
0000 0000 0010 1010 0010 1011 0100 0000


Nr inversat este 3 : 692
0000 0000 0000 0000 0000 0010 1011 0100
*/