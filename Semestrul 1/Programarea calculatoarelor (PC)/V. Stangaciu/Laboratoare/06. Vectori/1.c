// Să se scrie o funcție care ia un număr fără semn n și
// returnează numărul de segmente de biți consecutivi egali.
// Exemplu: 000100 are 3 segmente: 000, 1, 00, deci programul va returna 3

#include <stdio.h>
#include <stdint.h>

uint16_t seg_consect_bits(uint64_t num)
{
    uint16_t seg = 0;
    uint64_t mask = 1UL << 63;
    uint8_t prev_bit = 0, current_bit = 0;

    // check MSB - prev

    prev_bit = (num & mask) != 0;
    mask >>= 1;
    seg++;

    while(mask)
    {
        current_bit = (num & mask) != 0;
        if(prev_bit != current_bit)
        {
            prev_bit = current_bit;
            seg++;
        }

        mask >>= 1;
    }
    return seg;
}

int main(void)
{
    uint64_t num;
    scanf("%llu", &num);
    printf("%hu\n", seg_consect_bits(num));
    return 0;
}

/*

#include <stdio.h>
#include <stdint.h>

uint32_t nr_segment(uint32_t n) {
    int nrseg = 0;       
    int segcurent = 0;    
    int ultimBit = n & 1;
    n = n >> 1;           

    while (n > 0) {
        int bitCurent = n & 1; 
        if (bitCurent == ultimBit) {
            segcurent++; 
        } else {
            nrseg++;          
            segcurent = 1;   
            ultimBit = bitCurent; 
        }
        n = n >> 1; 

        if (segcurent > 0) {
            nrseg++; // 
        }
    }

    return nrseg; // 
}

int main(void) {
    uint32_t n;
    printf("Introduceți un număr fără semn: ");
    scanf("%u", &n);

    uint32_t rez = nr_segment(n);

    printf("Numărul de segmente este: %u", rez);

    return 0;
}
*/