#include <stdio.h>


void show_bits(unsigned int num)
{
    unsigned int SIZE = sizeof(num) * 8;

    for(unsigned int i = 0; i < SIZE; i++)
    {
        printf("%u", (num & (1 << (SIZE - 1 - i))) != 0);
    }

    printf("\n");

}


unsigned int reverse_bits(unsigned int num)
{
    unsigned int SIZE = sizeof(num) * 8;
    unsigned int reversed = 0;

    for(unsigned int i = 0; i < SIZE; i++)
    {
        reversed |= ((num & (1 << i)) != 0) << (SIZE - 1 - i);
    }

    return reversed;
}

int main(void)
{
    unsigned int num = 0;
    printf("Enter a number: ");
    scanf("%u", &num);

    printf("The number %u in bits is: ", num);
    show_bits(num);
    printf("The number %u with the bits reversed is %u\n", num, reverse_bits(num));
    show_bits(reverse_bits(num));

    return 0;
}