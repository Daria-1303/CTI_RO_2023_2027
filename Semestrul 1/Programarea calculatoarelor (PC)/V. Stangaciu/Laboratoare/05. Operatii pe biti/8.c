#include <stdio.h>
#include <stdint.h>

void print_binary(uint16_t num)
{
    uint16_t mask = 1 << 15;
    uint8_t i = 0;
    
    for (i = 0; i < 16; i++, mask >>= 1)
    {
        printf("%d", (num & mask) != 0);

        if(i % 4 == 3)
            printf (" ");
    }
    
  printf ("\n");
}

/*

Se citește de la tastatură un număr fără semn. 
Să se seteze biții săi cu indecșii 0,2,3, 
să se reseteze biții cu indecșii 1,5,6 
și să se complementeze biții cu indecșii 4,7. Se vor afișa în binar atât numărul inițial cât și cel final.

*/

uint16_t set_bits(uint16_t num, uint8_t index)
{
    return num | (1 << index);
}

uint16_t reset_bits(uint16_t num, uint8_t index)
{
    return num & ~(1 << index);
}

uint16_t invert_bits(uint16_t num, uint8_t index)
{
    return num ^ (1 << index);
}

int main(void)
{
    uint16_t n = 0;

    printf("n = ");

    scanf("%hu", &n);

    print_binary(n);

    // set bits 0, 2, 3

    n = set_bits(n, 0);
    n = set_bits(n, 2);
    n = set_bits(n, 3);

    print_binary(n);

    // reset bits 1, 5, 6

    n = reset_bits(n, 1);
    n = reset_bits(n, 5);
    n = reset_bits(n, 6);

    print_binary(n);

    // invert bits 4, 7

    n = invert_bits(n, 4);
    n = invert_bits(n, 7);

    print_binary(n);

    return 0;
}