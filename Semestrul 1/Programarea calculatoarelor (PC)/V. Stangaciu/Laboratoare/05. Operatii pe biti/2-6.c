/*
Exercise 2-6. Write a function setbits(x,p,n,y) that returns x with the n bits that begin at
position p set to the rightmost n bits of y, leaving the other bits unchanged. 

*/

#include <stdio.h>
#include <stdint.h>

uint32_t setbits(uint32_t x, uint8_t p, uint8_t n, uint32_t y)
{
  uint32_t mask = 0;
  for(int i = 0; i < n; i++){
    mask <<= 1; // mask = mask << 1;
    mask |= 1; // mask = mask | 1; ce face asta?    mask = mask | (1 << i);
  }
  mask <<= p;         // mask = mask << p pt a muta masca pe pozitia p
  mask = ~mask;          // mask = ~mask pt a face complementul mascai
  x &= mask;          // x = x & mask pt a face si logic intre x si mask
  y <<= p;        // y = y << p pt a muta y pe pozitia p
  y &= ~mask;             // y = y & ~mask pt a face si logic intre y si complementul mascai
  return x | y;         // return x | y pt a face sau logic intre x si y
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
  uint32_t x, y;
  uint8_t p, n;
  printf("Introduceti un numar pe 32 de biti: ");
  scanf("%u", &x);
  printf("Introduceti un numar pe 32 de biti: ");
  scanf("%u", &y);
  printf("Introduceti pozitia p: ");
  scanf("%hhu", &p);
  printf("Introduceti numarul de biti n: ");
  scanf("%hhu", &n);

  printf("x = ");
  showbits(x);

  printf("y = ");
  showbits(y);

  printf("x = ");
  showbits(setbits(x, p, n, y));

  return 0;
}