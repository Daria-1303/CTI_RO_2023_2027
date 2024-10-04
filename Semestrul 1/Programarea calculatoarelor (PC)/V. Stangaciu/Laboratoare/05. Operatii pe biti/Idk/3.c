#include <stdio.h>

unsigned int binary_addition(unsigned int a, unsigned int b)
{
    unsigned int sum = 0, carry = 0, SIZE, mask = 1;
    SIZE = sizeof(a) * 8;

    for(unsigned int i = 0; i < SIZE; i++, mask <<= 1)
    {
        unsigned int a_bit = (a & mask) != 0;
        unsigned int b_bit = (b & mask) != 0;
        unsigned int sum_bit = a_bit ^ b_bit ^ carry;
        carry = (a_bit & b_bit) | (a_bit & carry) | (b_bit & carry);
        sum |= sum_bit << i; 
    }

    return sum;
}

int main(void)
{
    unsigned int a = 0;
    unsigned int b = 0;

    printf("Enter two numbers: ");
    scanf("%u %u", &a, &b);

    printf("The sum of %u and %u is %u\n", a, b, binary_addition(a, b));
    return 0;
}