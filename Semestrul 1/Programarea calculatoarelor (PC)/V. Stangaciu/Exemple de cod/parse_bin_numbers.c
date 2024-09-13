// nr 2 bytes unsigned --> uint16_t
/*
program care citeste un fisier binar interpretat cum ca ar contine 
un numar necunoscut (foarte mare) de intregi fara semn pe 2 bytes
programul citeste fisierul si adauga datele intr-un tablou alocat dinamic
de structuri. fiecare structura contine numarul si de cate ori apare acesta
in fisier

se poate testa cu integers.bin (sau cu orice alt fisier)

 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

// dimensiunea unui buffer auxiliar in care se citeste din fisier
#define SIZE_AUX 4096
// dimensiunea pasului de realocare (in numar de elemente)
#define ALLOC_SIZE 100000

/* tipul de date utilizator NUMBER format dintr-o structura 
ce contine numarul citit din fisier si numarul sau de aparitii
 */
typedef struct
{
  uint16_t data;
  uint32_t count;
}NUMBER;  

/*
functie ce cauta un numar in tabloul de structuri
returneaza -1 daca nu l-a gasit sau pozitia pe care l-a gasit
 */
int32_t findData(NUMBER *array, uint32_t size, uint16_t nr)
{
  if (array == NULL)
    {
      return -1;
    }
  for (int i = 0; i < size; i++)
    {
      if (array[i].data == nr)
	{
	  return i;
	}      
    }
  return -1;
}


/* functie ce adauga un numar in tablou
primeste ca argumente:
   - tabloul NUMBER *array
   - size - dimensiunea acestuia - trimisa ca pointer pentru a putea fi
modificata in functie in cazul unei realocari a tabloului
   - index - noul index disponibil dupa adaugare
   - nr - numarul ce va fi adaugat
- returneaza tabloul - este necesar in cazul in care este realocat
 */
NUMBER *addToArray(NUMBER *array, uint32_t *size, uint32_t *index, uint16_t nr)
{

  // s-a ajuns la capatul tabloului ? daca da, insemna ca nu mai este loc
  // si trebuie realocat
  if (*index == *size)
    {
      /*
	nu mai este loc -->tabloul trebuie realocat cu o dimensiune mai mare
	se calculeaza noua dimensiune adaugand pasul de realocare ALLOC_SIZE
       */
      *size = *size + ALLOC_SIZE;      
      if ((array = realloc(array, *size * sizeof(NUMBER))) == NULL)
	{
	  perror("alloc error");
	  exit(-1);
	}
    }
  // se adauga noul numar si se initializeaza numarul sau de aparitii cu 0
  array[*index].data = nr;
  array[*index].count = 0;
  *index = *index + 1; // se modifica index-ul ca sa arate noua poz disponibila
  return array;
}

// functie de printare a tabloului de structuri
// printeaza numarul si numarul sau de aparitii
void printData(NUMBER *array, uint32_t size)
{
  for (int i = 0; i < size; i++)
    {
      printf ("%04X - %d\n", array[i].data, array[i].count);
    }
}


int main(int argc, char **argv)
{
  static NUMBER *data_array = NULL;
  static uint16_t aux_array[SIZE_AUX];
  uint32_t size = 0;
  uint32_t index = 0;
  // arg1 - numele fisierului
  if (argc != 2)
    {
      printf ("Usage error\n");
      exit(-1);
    }
  FILE *f = NULL;
  //  uint16_t aux;
  if ((f = fopen(argv[1], "rb")) == NULL)
    {
      perror(argv[1]);
      exit(-1);
    }
  int r = 0;
  /*
    linia comentat de mai jos reprezinta o citire mai ineficienta
    - se citeste tot cate un numar adica tot cate 2 bytes
   */
  //  while (fread(&aux, sizeof(aux), 1, f) == 1)

  // o citire mai eficienta
  /* se citeste cate SIZE_AUX numere de 2 bytes
     functia va citi maxim SIZE_AUX numere de 2 bytes
     si va returna cate numere de 2 bytes a reusit sa citeasca
     se iese din bucla cand nu a mai reusit sa citeasca nici macar un nr 
   */
  while ((r = fread(aux_array, sizeof(uint16_t), SIZE_AUX, f)) > 0)
    {
      // r = cate elemente a citit
      // se parcurge buffer-ul auxiliar in care s-au citit r numere
      for (int i = 0; i < r; i++)
	{
	  int pos = 0;
	  // la fiecare pas se cauta daca numarul exista sau nu in tabloul de structuri	  
	  if ((pos = findData(data_array, index, aux_array[i])) != -1)
	    {
	      // daca numarul exista se incrementeaza numarul sau de aparitii
	      data_array[pos].count++;
	    }
	  else
	    {
	      // daca numarul nu exista atunci se va adauga in tablou sub forma unei structuri de tip NUMBER
	      data_array = addToArray(data_array, &size, &index, aux_array[i]);

	    }
	}
    }
  printf ("read ready\n");
  printData(data_array, index);
  if (fclose(f) != 0)
    {
      perror(NULL);
      exit(-1);
    }
  free(data_array);
  
  return 0;
}
