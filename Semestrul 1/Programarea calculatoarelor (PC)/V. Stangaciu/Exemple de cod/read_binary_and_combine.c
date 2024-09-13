#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
// dimensiune buffer de octeti raw
#define BYTE_ARRAY_SIZE 128
// dimensiune tablou de intregi pe 32 de biti (va fi 128 / 4)
#define UINT_ARRAY_SIZE 32

/*
- program ce citeste din fisier un numar multiplu de 4 bytes elemente de un octet fiecare si ii combina pentru a se obtine intregi de 4 bytes fara semn
- pentru simplitate consideram ca vom citi 128 bytes (nici mai mult, nici mai putini)
- consideram ca avem in fisier macar 128 de bytes, daca nu programul se termina
- tot pentru simplitate vom lucra cu tablouri alocate static si nu dinamic
- daca avem uint8_t tab[4] acesta poate fi interpretat ca si un uint32_t n astfel:
n = *(uint32_t*)tab; - conform functiei urmatoare test
 */

void test(void)
{
  uint8_t tab[4] = {0x11, 0x22, 0x33, 0x44};
  uint32_t n = 0;
  n = *(uint32_t*)tab;
  printf ("Numarul n obtinut printat ca si zecimal %d si ca si hexazecimal %08X\n", n, n);
}

/*
  - functia citeste din fisier 128 de octeti si ii stocheaza in zone de memorie data ca argument
  print byte
  - apoi functia combina cate 4 bytes din bufferul byte citit din fisier, obtine un uint32_t si il 
  salveaza in zone de memorie referita de parametrul uint
  -practic functia citeste 128 de bytes din fisier pe care ii interpreteaza apoi seaprat ca si
  elemente de tip uint32
  - rezultatul pus in tabloul uint este identic ca si cum am fi citit din fisier 32 de elemente de tip uint32_t (puteti incerca si verifica asta !!!)
 */

void read_byte_and_combine_to_uint32(const char *filepath, uint8_t *byte, uint32_t *uint)
{
  FILE *f = NULL;
  if ((f = fopen(filepath, "r")) == NULL)
    {
      perror(filepath);
      exit(-1);
    }
  uint32_t r = 0;
  if (( r = fread(byte, sizeof(uint8_t), BYTE_ARRAY_SIZE, f)) != (BYTE_ARRAY_SIZE * sizeof(uint8_t)))
    {
      printf ("Nu sunt date suficient in fisier: %d\n", r );
      exit(-2);
    }
  int i = 0;// index pentru tabloul byte
  int j = 0;// index pentru tabloul uint
  // aplicam aceeasi logica ca si cea de la functia test precedenta
  for (i = 0, j = 0; i < BYTE_ARRAY_SIZE; i = i + 4, j = j + 1)
    {
      /* 
	 vrem ca fiecare element uint[j] sa reprezinte 4 bytes
	 formati din byte[i], byte[i+1], byte[i+2], byte[i+3]
	 - (byte + i) obtine &byte[i] - care este un uint8_t*
	 - apoi prin cast se cere interpretarea zonei la un uint32_t* 
	 - in final se face dereferentiere pentru a se obtine valoarea
      */
      uint[j] = *((uint32_t*)(byte + i));
    }
  fclose(f);
}

int main(void)
{
  uint8_t byte_array[BYTE_ARRAY_SIZE];
  uint32_t uint_array[UINT_ARRAY_SIZE];
  test();
  read_byte_and_combine_to_uint32("integers.bin", byte_array, uint_array);

  printf ("\nOCTETI RAW: \n");
  for (int i = 0; i < BYTE_ARRAY_SIZE; i++)
    {
      printf ("%02X ", byte_array[i]);
    }
  printf ("\nOCTETII RAW INTERPRETATI CA SI SUCCESIUNI DE UINT32: \n");
  for (int i = 0; i < UINT_ARRAY_SIZE; i++)
    {
      printf ("%08X ", uint_array[i]);
    }
  
  return 0;
}
