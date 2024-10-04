/*
Exercise 2-9. In a two's complement number system, x &= (x-1) deletes the rightmost 1-bit
in x. Explain why. Use this observation to write a faster version of bitcount. 
*/

#include <stdio.h>
#include <stdint.h>

int bitcount(uint32_t x)
{
  int b;
  for (b = 0; x != 0; x >>= 1)
    if (x & 01)
      b++;
  return b;
}

int bitcount1(uint32_t x)
{
  int b;
  for (b = 0; x != 0; x &= (x - 1))
    b++;
  return b;
}


int main(void)
{
  uint32_t x;
  printf("Introduceti un numar pe 32 de biti: ");
  scanf("%u", &x);
  printf("Numarul de biti de 1 este: %d\n", bitcount(x));
  printf("Numarul de biti de 1 este: %d\n", bitcount1(x));
  return 0;
}