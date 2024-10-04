#include <stdint.h>
#include <stdio.h>

// input - 32 bit int , output - 16 bit int with the bits (that are on even position) of the first one

void show_bits_16(uint16_t num)
{
    uint16_t mask = 1 << 15;

    while(mask)
    {
        printf("%hhu ", (num & mask) != 0);
        mask >>= 1;
    }
    printf("\n");
}

void show_bits_32(uint32_t num)
{
    uint32_t mask = 1 << 31;

    while(mask)
    {
        printf("%hhu ", (num & mask) != 0);
        mask >>= 1;
    }
    printf("\n");
}

uint16_t even_bits(uint32_t input)
{
    uint16_t output = 0;
    uint16_t mask_out = 1 << 15;

    uint32_t mask_in = 1 << 30;

    while(mask_in)
    {
        // x0x1x1x0x1x0x1x0
        // 0 1 1 0 1 0 1 0
        if(input & mask_in)
            output |= mask_out;

        mask_in >>= 2;
        mask_out >>= 1;
    }

    return output;
}

int main(void)
{
    uint32_t num = 0;
    scanf("%u", &num);
    show_bits_32(num);
    printf("%hhu\n", even_bits(num));
    show_bits_16(even_bits(num));
    
    return 0;
}