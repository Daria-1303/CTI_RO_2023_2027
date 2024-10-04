/*
19
Rescrieți funcția anterioară astfel încât numărul (nr) să fie pe o dimensiune de 64 de biți fără semn.
*/

#include <stdio.h>
#include <stdint.h>

uint64_t replace(uint64_t nr, uint8_t n, uint8_t p)
{
  uint64_t mask = 0xFF << (p * 8); // cream o masca de 8 biti care are 1 pe pozitia p si 0 in rest

  nr &= ~mask; // stergem octetul de pe pozitia p

  nr |= n << (p * 8); // punem octetul n pe pozitia p
  return nr;
}

void showbits(uint64_t x){
    uint64_t mask = 1ULL << (sizeof(x)*8-1);
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
  uint64_t nr;
  uint8_t n, p;
  printf("Introduceti un numar pe 64 de biti: ");
  scanf("%lu", &nr);
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
  showbits(nr);

  printf("n = ");
  showbits(n);

  printf("p = ");
  showbits(p);

  printf("replace(nr, n, p) = ");
  showbits(replace(nr, n, p));

  printf("replace(nr, n, p) = %lu\n", replace(nr, n, p));

  return 0;
}