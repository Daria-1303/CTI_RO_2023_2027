/*
18
Să se scrie o funcție care primește ca argument un număr pe 32 de biți fără semn (nr), un număr pe 8 biți fără semn (n) și o poziție (p). 
Funcția va returna numărul (nr) în care octetul de pe poziția p va fi inlocuit cu numărul n. 
Octeții se numără se la dreapta (cel mai puțin semnificativ, poziția 0) spre stanga
exemplu: nr = 0011 0110 0101 1011 0011 0110 0101 1011 = 911.947.35510 , n = 1110 1111 = 23910, p = 2 -> rezultat: 0010 0110 1110 1111 0011 0110 0101 1011
*/

#include <stdio.h>
#include <stdint.h>

uint32_t replace(uint32_t nr, uint8_t n, uint8_t p)
{
  uint32_t mask = 0xFF << (p * 8); // cream o masca de 8 biti care are 1 pe pozitia p si 0 in rest

  nr &= ~mask; // stergem octetul de pe pozitia p

  nr |= n << (p * 8); // punem octetul n pe pozitia p
  return nr;
}

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

unsigned int replace_byte(unsigned int nr, unsigned char n, int p) {
    unsigned int mask = ~(0xFF << (p * 8));
    nr = nr & mask;
    unsigned int n_shifted = n << (p * 8);
    return nr | n_shifted;
}

int main(void)
{
  uint32_t nr;
  uint8_t n, p;
  printf("Introduceti un numar pe 32 de biti: ");
  scanf("%u", &nr);
  printf("Introduceti un numar pe 8 biti: ");
  scanf("%hhu", &n);
  printf("Introduceti o pozitie: ");
  scanf("%hhu", &p);

  printf("nr = ");
  showbits(nr);

  printf("n = ");
  showbits(n);

  printf("p = ");
  showbits(p);

  printf("nr = ");
  showbits(replace(nr, n, p));

    printf("nr = ");
    showbits(replace_byte(nr, n, p));

    /*
 Introduceti un numar pe 32 de biti: 911947355
Introduceti un numar pe 8 biti: 239
Introduceti o pozitie: 2
nr = 0011 0110 0101 1011 0011 0110 0101 1011
n = 0000 0000 0000 0000 0000 0000 1110 1111
p = 0000 0000 0000 0000 0000 0000 0000 0010
nr = 0011 0110 1110 1111 0011 0110 0101 1011
nr = 0011 0110 1110 1111 0011 0110 0101 1011
    */

  return 0;
}