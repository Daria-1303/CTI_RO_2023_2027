// Un nibble este un grup de 4 biti. Să se scrie un program care primește un număr fără semn n și această funcție
// a) returnează valoarea acestui număr cu ordinea inversă a nibble-urilor
// b) returnează valoarea acestui număr cu biții din fiecare nibble în ordine inversă

#include <stdint.h>
#include <stdio.h>

void show_bits(uint16_t num)
{
    const uint8_t SIZE = sizeof(num) * 8;
    uint16_t mask = 1 << (SIZE - 1);
    while(mask != 0)
    {
        printf("%u", (num & mask) != 0);
        mask >>= 1;
    }
    printf("\n");
}

uint16_t invert_nibble_a(uint16_t num)
{
    const uint8_t SIZE = sizeof(num) * 8;

    uint16_t mask_num = 1 << (SIZE - 1);
    uint16_t mask_aux = 0;
    uint16_t aux = 0;

    for(uint8_t i = 0; i < SIZE / 4; i++)
    {
        // i = 0 - mask_aux = 1 << 3
        // i = 1 - mask_aux = 1 << 7
        // i = 2 - mask_aux = 1 << 11
        // i = 3 - mask_aux = 1 << 15
        mask_aux = 1 << ((i + 1) * 4 - 1);

        for(uint8_t j = 0; j < 4; j++)
        {
            if((num & mask_num) != 0)
                aux |= mask_aux;
            mask_aux >>= 1;
            mask_num >>= 1;
        }
    }

    return aux;
}

uint16_t invert_nibble_b(uint16_t num)
{
    const uint8_t SIZE = sizeof(num) * 8;
    // num = 0b 1110 0011 0101 1010
    // aux = 0b 0111 1100 1010 0101

    // i = 0 ---> mask = 1 << 12
    // i = 1 ---> mask = 1 << 8
    // i = 2 ---> mask = 1 << 4
    // i = 3 ---> mask = 1 << 0

    uint16_t mask_num = 1 << (SIZE - 1);
    uint16_t mask_aux = 0;
    uint16_t aux = 0;

    for(uint8_t i = 0; i < SIZE / 4; i++)
    {
        mask_aux = 1 << (16 - (i + 1) * 4);

        for(uint8_t j = 0; j < 4; j++)
        {
            if((num & mask_num) != 0)
                aux |= mask_aux;
            mask_aux <<= 1;
            mask_num >>= 1;
        }
    }

    return aux;
}

int main(void)
{
    uint16_t num = 0, aux = 0;
    const uint8_t SIZE = sizeof(num) * 8;
    printf("n = ");
    scanf("%hu", &num);
    printf("Number of bits: %hhu\n", SIZE);
    show_bits(num);
    aux = invert_nibble_a(num);
    show_bits(aux);
    aux = invert_nibble_b(num);
    show_bits(aux);

    return 0;
}