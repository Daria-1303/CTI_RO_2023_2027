/*
2. Se citeste un numar n<=100, un numar k<=64 si n numere intregi pe 64 de biti.
   Se cere sa se elimine din vector numerele care au k biti de 1.
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define SIZE 100

void input(uint64_t *array, uint16_t *num, uint8_t *k)
{
    if(scanf("%hu", num) != 1)
    {
        perror("scanf");
        exit(-1);
    }

    if(scanf("%hhu", k) != 1)
    {
        perror("scanf");
        exit(-1);
    }

    for(uint16_t i = 0; i < *num; i++)
    {
        if(scanf("%llu", array + i) != 1)
        {
            perror("scanf");
            exit(-1);
        }
    }
}

void output(uint64_t *array, uint16_t num)
{
    for(uint16_t i = 0; i < num; i++)
        printf("%llu ", *(array + i));
    
    printf("\n");
}

uint8_t count_bits(uint64_t number)
{
    uint8_t count = 0;

    while(number)
    {
        count += number & 1;
        number >>= 1;
    }

    return count;
}


void free_at(uint64_t *array, uint16_t *num, uint16_t index)
{
    for(uint16_t i = index; i < *num - 1; i++)
        *(array + i) = *(array + i + 1);

    (*num)--;
}


void remove_bits(uint64_t *array, uint16_t *num, uint8_t k)
{
    for(uint16_t i = 0; i < *num; i++)
        if(count_bits(*(array + i)) == k)
        {
            free_at(array, num, i);
            i--;
        }
}


int main(void)
{
    uint16_t num = 0;
    uint8_t k = 0;
    uint64_t array[SIZE];

    input(array, &num, &k);
    output(array, num);

    remove_bits(array, &num, k);
    output(array, num);
    return 0;
}