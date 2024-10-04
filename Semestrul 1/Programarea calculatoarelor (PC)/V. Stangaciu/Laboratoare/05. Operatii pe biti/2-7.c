/*
Exercise 2-7. Write a function invert(x,p,n) that returns x with the n bits that begin at
position p inverted (i.e., 1 changed into 0 and vice versa), leaving the others unchanged. 

*/

#include <stdio.h>
#include <stdint.h>

uint32_t invert(uint32_t x, uint8_t p, uint8_t n)
{
  uint32_t mask = 0;
  for(int i = 0; i < n; i++){
    mask <<= 1;          // mask = mask << 1;
    mask |= 1;        // mask = mask | 1; ce face asta?    mask = mask | (1 << i);
  }
  mask <<= p;         // mask = mask << p pt a muta masca pe pozitia p
  return x ^ mask;         // return x | y pt a face sau logic intre x si y
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

int main(void)
{
  uint32_t x;
  uint8_t p, n;
  printf("Introduceti un numar pe 32 de biti: ");
  scanf("%u", &x);
  printf("Introduceti pozitia p: ");
  scanf("%hhu", &p);
  printf("Introduceti numarul de biti n: ");
  scanf("%hhu", &n);

  printf("x = ");
  showbits(x);

  x = invert(x, p, n);

  printf("x = ");
  showbits(x);

  return 0;
}