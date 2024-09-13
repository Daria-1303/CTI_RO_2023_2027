#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define SIZE 200

/*
functie ce citeste din fisierul in format binar numere intregi pe 16 biti
si le stocheaza intr-un array primit ca argument si returneaza cate elemente a scris in array
functia este ineficienta caci citeste numar cu numar (cate 2 bytes o data)
 */

uint32_t read_from_file_simple_static(const char *filepath, uint16_t *array, uint32_t size)
{
  FILE *file = NULL;
  if ((file = fopen(filepath, "r")) == NULL)
    {
      perror(filepath);
      exit(-1);
    }
  uint16_t aux;
  uint32_t index = 0;
  /* 
     se citeste cate un element de tip uint16_t pana cand nu s-a mai putut citi
     un element
  */
  while (fread(&aux, sizeof(uint16_t), 1, file) == 1)
    {
      if (index < size)
	{
	  array[index] = aux;
	  index++;	  
	}

    }  
  fclose(file);
  return index;
}


int main(void)
{
  uint16_t data[SIZE];
  uint32_t array_size = 0;
  array_size = read_from_file_simple_static("integers.bin", data, SIZE);
  for (int i = 0; i < array_size; i++)
    {
      printf ("%04X ", data[i]);
    }
  printf ("\n");
  return 0;
}
