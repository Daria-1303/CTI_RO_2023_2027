/*
 Scrieti si testati cu date de la intrare o functie care
 ia ca parametri doua numere intregi si returneaza suma lor,
 folosind operatori pe biti. Calculati suma bit cu bit, cu propagarea transportului,
 cu algoritmul de adunare pe hartie pencil-and-paper, fara a folosi operatori aritmetici.
 */

#include <stdio.h>
#include <stdint.h>

void show_bits(uint64_t num)
{
    uint64_t mask = 1UL << 63;
    while(mask)
    {
        printf("%hhu", (num & mask) != 0);
        mask >>= 1;
    }
    printf("\n");
}

uint64_t binary_sum(uint64_t x, uint64_t y)
{
    uint64_t sum = 0, mask = 1;
    uint8_t carry = 0;

    for(uint8_t i = 0; i < 64; i++, mask <<= 1)
    {
        // get the bits of x and y from lsb to msb
        // the carry at the start is 0
        // get the corresponding bit of the sum, if there are two 1's, of x and y - that becomes a 0 + carry
        // the carry becomes 0 or 1 - if itself with x or y are both 1, or if x and y are both 1
        // set the sum bit

        uint8_t x_bit = (x & mask) != 0;
        uint8_t y_bit = (y & mask) != 0;
        uint64_t sum_bit = x_bit ^ y_bit ^ carry;
        carry = (x_bit & y_bit) | (x_bit & carry) | (y_bit & carry);
        sum |= sum_bit << i; 
    }

    return sum;
}

int main(void)
{
    uint64_t x, y;
    scanf("%llu", &x);
    scanf("%llu", &y);
    show_bits(x);
    show_bits(y);
    show_bits(x + y);
    show_bits(binary_sum(x, y));

    return 0;
}
