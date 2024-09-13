#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define SIZE_ALLOC 16
/*
functie ce citeste din fisierul in format binar numere intregi pe 16 biti
si le stocheaza intr-un array alocat dinamic, la o dimensiune minima si exacta
functia este ineficienta caci citeste numar cu numar (cate 2 bytes o data)
- functia returneaza tabloul alocat dinamic
- functia scrie dimensiunea rezultata a tabloului in paramtrul arraySize trimis
ca pointer
- functia returneaza NULL in caz de eroare (in caz de eroare in functie nu se omoara
programul ci se trateaza prin printare si returnare a valorii NULL
 */
uint16_t *read_from_file_1(const char *filepath, uint32_t *arraySize)
{
  FILE *file = NULL;
  if ((file = fopen(filepath, "r")) == NULL)
    {
      perror(filepath);
      return NULL;
    }
  uint16_t aux;
  uint16_t *array = NULL;
  uint32_t size = 0;
  uint32_t index = 0;
  /* 
     se citeste cate un element de tip uint16_t pana cand nu s-a mai putut citi
     un element
   */
  while (fread(&aux, sizeof(uint16_t), 1, file) == 1)
    {
      if (index == size)
	{
	  // nu mai este loc in tablou, trebuie marit
	  size = size + SIZE_ALLOC;// calculeaza noua dimensiune
	  if ((array = realloc(array, size * sizeof(uint16_t))) == NULL)
	    {
	      // nu s-a putut aloca.. functia va returna NULL
	      perror("Fatal error. No more space !");
	      return NULL;
	    }	  
	}
      // se adauga elementul nou citit
      array[index] = aux;
      index++;
    }  
  fclose(file);
  /* se realoca tabloul pentru a fi de dimensiune minima si de exact cate elemente
     s-au adaugat. tabloul poate sa rezulta in acest punct mai mare fata cate elemente sunt
     efectiv stocate in el. este necesara o ajustare a dimensiunii zonei de memorie
   */
  array = realloc(array, index * sizeof(uint16_t));
  *arraySize = index;// se scrie dimensiunea in parametrul arraySize trimis ca ptr
  return array;
}
/*
functie ce citeste din fisierul in format binar numere intregi pe 16 biti
si le stocheaza intr-un array alocat dinamic, la o dimensiune minima si exacta
functia este mai eficienta caci citeste mai multe numere pe 16 biti (SIZE_ALLOC numere) 
intr-o singura operatie de citire
- functia returneaza tabloul alocat dinamic
- functia scrie dimensiunea rezultata a tabloului in paramtrul arraySize trimis
ca pointer
- functia returneaza NULL in caz de eroare (in caz de eroare in functie nu se omoara
programul ci se trateaza prin printare si returnare a valorii NULL
 */
uint16_t *read_from_file_2(const char *filepath, uint32_t *arraySize)
{
  FILE *file = NULL;
  if ((file = fopen(filepath, "r")) == NULL)
    {
      perror(filepath);
      return NULL;
    }
  uint16_t *array = NULL;
  uint32_t size = 0;
  uint32_t r = 0;
  uint32_t index = 0;
  // se aloca initial tabloul de dimensiune SIZE_ALLOC
  if ((array = malloc(SIZE_ALLOC * sizeof(uint16_t))) == NULL)
    {
      perror("Fatal error. No more space !");
      return NULL;
    }
  size = size + SIZE_ALLOC; // se actualizeaza noua dimensiune
  /*
    - se invoca fread pentru a se citi maxim SIZE_ALLOC elemente de dimensiune
    sizeof(uint16_t) (2) fiecare element
    - functia va returna cate elemente a reusit sa citeasca, poate returna ca a citit
    fix SIZE_ALLOC elemente sau mai putine
    - daca returneaza 0 se considera ca nu mai sunt elemente de citit din fisier
   */
  while ((r = fread(array + index, sizeof(uint16_t), SIZE_ALLOC, file)) > 0)
    {
      // am citit r elemente
      // avansez index cu r elemente citite
      index = index + r;
      /* 
	 aloc memorie mai departe ca sa mai incapa inca SIZE_ALLOC elemente

	 - daca am citit r == SIZE_ALLOC elemente aloc pentru inca SIZE_ALLOC elemente
	 - daca am citit r mai putin de SIZE_ALLOC elemente (r < SIZE_ALLOC) dar nu 0 
	 atunci aloc diferenta pana la SIZE_ALLOC adica SIZE_ALLOC-r
      */
      if (r == SIZE_ALLOC)
	{
	  size = size + SIZE_ALLOC;
	}
      else
	{
	  size = size + (SIZE_ALLOC - r);
	}
      if ((array = realloc(array, size * sizeof(uint16_t))) == NULL)
	{
	  // nu s-a putut aloca.. functia va returna NULL
	  perror("Fatal error. No more space !");
	  return NULL;
	}	              
    }
 fclose(file);
  /* se realoca tabloul pentru a fi de dimensiune minima si de exact cate elemente
     s-au adaugat. tabloul poate sa rezulta in acest punct mai mare fata cate elemente sunt
     efectiv stocate in el. este necesara o ajustare a dimensiunii zonei de memorie
   */
  array = realloc(array, index * sizeof(uint16_t));
  *arraySize = index; // se scrie dimensiunea in parametrul arraySize trimis ca ptr
  return array;  
}

int main(void)
{
  uint16_t *data = NULL;
  uint32_t array_size = 0;
  if ((data = read_from_file_2("integers.bin", &array_size)) == NULL)
    {
      exit(-1);
    }
  for (int i = 0; i < array_size; i++)
    {
      printf ("%04X ", data[i]);
    }
  printf ("\n");
  free(data);
  return 0;
}
