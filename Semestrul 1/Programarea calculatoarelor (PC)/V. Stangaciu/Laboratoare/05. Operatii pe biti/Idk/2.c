#include <stdio.h>

unsigned int convert_to_base_8_bitwise(unsigned int num)
{
    unsigned int SIZE = sizeof(num) * 8;
    unsigned int baza_8 = 0;
    unsigned int rest = 0;
    unsigned int cat = 0;

    for(unsigned int i = 0; i < SIZE; i += 3)
    {
        rest = num & 7;
        cat = num >> 3;
        baza_8 |= rest << i;
        num = cat;
    }

    return baza_8;
}

int main(void)
{
    unsigned int num = 0;
    printf("Enter a number: ");
    scanf("%u", &num);

    printf("The number %u in base 8 is %o\n", convert_to_base_8_bitwise(num), convert_to_base_8_bitwise(num));
    return 0;
}