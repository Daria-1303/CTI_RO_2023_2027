#include <stdio.h>
#include <stdint.h>

uint64_t dec_to_bin(uint64_t dec)
{
    uint64_t bin = 0, pow = 1;
    while (dec)
    {
        bin += pow * (dec % 2);
        dec /= 2;
        pow *= 10;
    }
    return bin;
}

uint64_t bin_to_dec(uint64_t bin)
{
    uint64_t dec = 0, pow = 1;
    while(bin)
    {
        dec += pow * (bin % 10);
        bin /= 10;
        pow *= 2;
    }
    return dec;
}

int main()
{
    uint64_t dec = 0, bin = 0;

    bin = 11001001;
    printf("Binar - %llu == Decimal - %llu\n", bin, bin_to_dec(bin));

    bin = 10000000;
    printf("Binar - %llu == Decimal - %llu\n\n", bin, bin_to_dec(bin));



    dec = 16;
    printf("Decimal - %llu == Binar - %llu\n", dec, dec_to_bin(dec));

    dec = 42;
    printf("Decimal - %llu == Binar - %llu\n", dec, dec_to_bin(dec));

    dec = 123;
    printf("Decimal - %llu == Binar - %llu\n", dec, dec_to_bin(dec));

    dec = 256;
    printf("Decimal - %llu == Binar - %llu\n", dec, dec_to_bin(dec));

    return 0;
}
