/*
3. Se citeste un numar n<=100 si n numere pe 8 biti. Se cere sa se numere cate numere isi gasesc oglinditul
   in scrierea binara in sir si sa se afiseze aceste perechi. (ex nr oglindite: 00011010 si 01011000)
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define SIZE 100

uint8_t is_bit_palindrome(uint8_t number)
{  
   uint8_t size = sizeof(uint8_t) * 8;

   for(uint8_t i = 0; i < size / 2; i++)
   {
      // verificam daca primul bit este diferit de ultimul, etc

      if((number & (1 << i)) != (number & (1 << (size - i - 1))))
         return 0;
   }

   return 1;
}

uint8_t is_bit_reversed(uint8_t num_a, uint8_t num_b)
{
   uint8_t size = sizeof(uint8_t) * 8;

   for(uint8_t i = 0; i < size; i++)
      if((num_a & (1 << i)) != (num_b & (1 << (size - 1 - i))))
         return 0;

   return 1;
}

void input(uint8_t *array, uint8_t *size)
{
   if(scanf("%hhu", size) != 1)
   {
      perror("scanf");
      exit(-1);
   }

   for(uint8_t i = 0; i < *size; i++)
   {
      if(scanf("%hhu", array + i) != 1)
      {
         perror("scanf");
         exit(-1);
      }
   }
}

uint8_t count_bit_palindrome(uint8_t *array, uint8_t size)
{
   uint8_t count = 0;

   for(uint8_t i = 0; i < size; i++)
      if(is_bit_palindrome(array[i]))
         count++;

   return count;
}

uint8_t count_bit_reverse(uint8_t *array, uint8_t size)
{
   uint8_t count = 0;

   for(uint8_t i = 0; i < size; i++)
      for(uint8_t j = i + 1; j < size; j++)
         if(is_bit_reversed(array[i], array[j]))
            count++;

   return count;
}

int main(void)
{
   uint8_t size;
   uint8_t array[SIZE];

   input(array, &size);
   printf("%hhd\n", count_bit_palindrome(array, size));
   printf("%hhd\n", count_bit_reverse(array, size));
   
   return 0;
}