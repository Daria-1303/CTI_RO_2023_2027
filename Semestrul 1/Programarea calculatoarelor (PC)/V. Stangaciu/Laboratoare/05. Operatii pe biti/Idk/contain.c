/*
4. Se citeste un numar n<=100, n numere pe 64 biti si un numar k pe 8 biti. Se cere sa se insereze cifra 0 dupa fiecare
   numar care il contine pe k (in binar) in scriera sa binara. (ex: k = 1110 1111, nr =  0010 1110 1111 0011 0110 0101 1011 0000
   nr il contine pe k).
*/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#define SIZE 200

void input(uint64_t *array, uint8_t *size, uint8_t *byte)
{
   if(scanf("%hhu", size) != 1)
   {
      perror("scanf");
      exit(-1);
   }

   for(uint8_t i = 0; i < *size; i++)
   {
      if(scanf("%llu", array + i) != 1)
      {
         perror("scanf");
         exit(-1);
      }
   }

   if(scanf("%hhu", byte) != 1)
   {
      perror("scanf");
      exit(-1);
   }
}

void output(uint64_t *array, uint8_t size)
{
   for(uint8_t i = 0; i < size; i++)
      printf("%llu ", array[i]);

   printf("\n");
}


void insert_at(uint64_t *array, uint8_t *size, uint8_t position)
{
   (*size)++;

   for(int i = *size - 1; i >= position; i--)
      array[i + 1] = array[i];

   array[position] = 0;
}


uint8_t numbers_contains_byte(uint64_t number, uint8_t byte)
{
   uint64_t mask = 0b11111111;
   uint8_t shifts = 0;

   while(mask)
   {
      if((number & mask) << (shifts * 8) == byte)
         return 1;

      shifts++;
      mask <<= 8;
   }

   return 0;
}


void modify_array(uint64_t *array, uint8_t *size, uint8_t byte)
{
   for(uint8_t i = 0; i < *size; i++)
      if(numbers_contains_byte(array[i], byte))
      {
         insert_at(array, size, i);

         i++;
      }
}

int main(void)
{
   uint8_t size, byte;
   uint64_t array[SIZE];

   input(array, &size, &byte);
   output(array, size);

   modify_array(array, &size, byte);
   output(array, size);

   return 0;
}