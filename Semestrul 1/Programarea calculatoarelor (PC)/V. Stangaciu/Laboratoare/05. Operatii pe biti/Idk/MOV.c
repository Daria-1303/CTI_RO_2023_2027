// muta un octet intr-un numar N pe pozitia P

// METODA 1

// reseteaza 8 biti si insereaza bit cu bit

// METODA 2
// shift << pana nimeresti pozitia de intrare
// shift >> pana nimeresti pozitia de iesire

#include <stdint.h>
#include <stdio.h>

void show_bits(uint64_t num)
{
    const uint8_t SIZE = 64;
    uint64_t mask = 1UL << (SIZE - 1);
    printf("Bits: ");
    for(uint8_t i = 0; i < SIZE; i++)
    {
        printf("%hhu", (num & mask) != 0);
        mask >>= 1;
        if (i % 4 == 3)
            printf(" ");
    }
    printf("\n");
}

uint64_t MOV_NIBBLE(uint64_t num, uint8_t nibble_position, uint8_t insert_byte)
{
    const uint8_t NIBBLE_COUNT = 16;
    uint64_t front = 0, end = 0, insert = 0;

    insert |= insert_byte;
    insert <<= (nibble_position - 1) * 4;

    front |= num;
    front >>= (nibble_position + 1) * 4;
    front <<= (nibble_position + 1) * 4;

    end |= num;
    end <<= (NIBBLE_COUNT - nibble_position - 1) * 4;
    end >>= (NIBBLE_COUNT - nibble_position - 1) * 4;

    return front | insert | end;
}


uint64_t MOV(uint64_t num, uint8_t byte_position, uint8_t insert_byte)
{
    const uint8_t BYTE_COUNT = 8;
    uint64_t front = 0, end = 0, insert = 0;

    insert |= insert_byte;
    insert <<= byte_position * 8;

    front |= num;
    front >>= (byte_position + 1) * 8;
    front <<= (byte_position + 1) * 8;

    end |= num;
    end <<= (BYTE_COUNT - byte_position - 1) * 8;
    end >>= (BYTE_COUNT - byte_position - 1) * 8;

    return front | insert | end;
}

int main(void)
{
    uint64_t num = 0;
    printf("Num64 = ");
    scanf("%llu", &num);
    show_bits(num);
    show_bits(MOV(num, 1, 0xFF));

    return 0;
}