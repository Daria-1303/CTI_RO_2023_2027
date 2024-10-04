/*
Exercise 2-8. Write a function rightrot(x,n) that returns the value of the integer x rotated
to the right by n positions. 
*/

#include <stdio.h>
#include <stdint.h>

uint32_t rightrot(uint32_t x, uint8_t n)
{
  uint32_t mask = 0;
  for(int i = 0; i < n; i++){
    mask <<= 1; // mask = mask << 1;
    mask |= 1; // mask = mask | 1; ce face asta?    mask = mask | (1 << i);
  }
  uint32_t aux = x & mask;
  aux <<= (sizeof(x)*8-n);
  x >>= n;
  return x | aux;
}

unsigned int rightrot1(unsigned int x, int n) {
/*
Declare a function rightrot that takes an integer x and an integer n as input.
Calculate the number of bits in x using the sizeof operator.
Calculate the right rotation of x by n positions. This can be done by shifting x to the right by n positions and x to
 the left by the number of bits minus n. The result is the bitwise OR of these two values.
Return the result.
*/

    int num_bits = sizeof(x) * 8;

    return (x >> n) | (x << (num_bits - n));
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
  uint8_t n;
  printf("Introduceti un numar pe 32 de biti: ");
  scanf("%u", &x);
  printf("Introduceti numarul de biti n: ");
  scanf("%hhu", &n);

  printf("x = ");
  showbits(x);

  x = rightrot(x, n);

  printf("x = ");
  showbits(x);

  unsigned int y = 0x1234;
    printf("y = ");
    showbits(y);
    printf("rightrot1(y, 4) = ");
    showbits(rightrot1(y, 4)); // 0x4123
    printf("%d\n", rightrot1(y, 4)); 


  return 0;
}