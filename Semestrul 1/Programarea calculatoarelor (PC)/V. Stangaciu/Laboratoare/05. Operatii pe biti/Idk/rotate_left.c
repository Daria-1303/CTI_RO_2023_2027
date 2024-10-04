#include <stdint.h>
#include <stdio.h>

void show_bits_32(uint32_t num)
{
    uint32_t mask = 1 << 31;

    while(mask)
    {
        printf("%hhu", (num & mask) != 0);
        mask >>= 1;
    }
    printf("\n");
}

uint32_t rotate_left_bit(uint32_t input)
{
    uint8_t rot = 32 - 1;
    return (input << 1) | (input >> rot);
}

uint32_t rotate_left_nibble(uint32_t input)
{
    uint8_t rot = 32 - 4;
    return (input << 4) | (input >> rot);
}

uint32_t rotate_left_byte(uint32_t input)
{
    uint8_t rot = 32 - 8;
    return (input << 8) | (input >> rot);
}

int main(void)
{
    uint32_t num = 0;
    scanf("%u", &num);
    show_bits_32(num);
    show_bits_32(rotate_left_bit(num));
    show_bits_32(rotate_left_nibble(num));
    show_bits_32(rotate_left_byte(num));

    return 0;
}