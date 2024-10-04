/*
1. Se citeste un numar n <= 100 si n numere intregi pozitive.
   Se cere sa se sorteze aceste numere astfel incat numerele cu numar par de biti de 1 sa se afle
   dupa cele cu numar impar de biti de 1.
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#define SIZE 100

void input(uint16_t *array, uint16_t *size)
{
    if(scanf("%hd", size) != 1)
    {
        perror("scanf");
        exit(-1);
    }

    for(uint16_t i = 0; i < *size; i++)
    {
        if(scanf("%hd", array + i) != 1)
        {
            perror("scanf");
            exit(-1);
        }
    }
}

void show_bits(uint16_t number)
{
    uint16_t mask = 1 << 15;

    while(mask)
    {
        printf("%hd",(number & mask) != 0);
        mask >>= 1;
    }
    printf("\n");
}

void output(uint16_t *array, uint16_t size)
{
    for(uint16_t i = 0; i < size; i++)
    {
        printf("%hd -> ", *(array + i));
        show_bits(*(array + i));
    }
}

uint16_t count_bits(uint16_t x)
{
    uint16_t count = 0;

    while (x)
    {
        count += x & 1;
        x >>= 1;
    }

    return count;
}



void sort_bits(uint16_t *array, uint16_t size)
{
    uint16_t aux, ok;

    do
    {
        ok = 0;
        for(uint16_t i = 0; i < size - 1; i++)
            if((count_bits(array[i]) % 2) < (count_bits(array[i + 1]) % 2))
            {
                aux = array[i];
                array[i] = array[i + 1];
                array[i + 1] = aux;
                ok = 1;
            }

    } while (ok);
    
}

int main(void)
{
    uint16_t n = 0;
    uint16_t array[SIZE];

    input(array, &n);

    printf("Unsorted:\n");
    output(array, n);

    sort_bits(array, n);

    printf("Sorted:\n");
    output(array, n);

    return 0;
}