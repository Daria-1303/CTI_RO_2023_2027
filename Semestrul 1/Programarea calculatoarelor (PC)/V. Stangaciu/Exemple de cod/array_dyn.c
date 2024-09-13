#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 3000
#define MAX_NUMBER 4000
#define CHUNK 256

/*
functie ce primste ca argument un array de numere intregi si dimensiunea acestuia si populeaza acest array
cu numere aleatoare de valoare maxima MAX_NUMBER-1
 */
void read_array(int *a, int size)
{
  for (int i = 0; i < size; i++)
    {
      a[i] = rand() % MAX_NUMBER;
    }
}
/*
functie ce citeste un numar necunoscut de numere intregi de la intrarea standard si le salveaza intr-un tablou 
alocat dinamic. Functia aloca un numar de cate CHUNK elemente (numere intregi) o data, umple aceasta zona cu date 
iar daca aceasta zona s-a umplut si mai sunt date disponibile, se mai aloca din nou cate CHUNK elemente......
functia returneaza array-ul alocat dinamic. Functia primeste ca argument adresa unui intreg in care va scrie numarul
de elemente citite si salvate in array
 */
int *read_array_stdin_dynamic(int *size)
{
  int *array;  // un ptr ce va contine zona de memorie a array-ului
  int current_size; // variabila ce va contine dimensiunea curenta a array-ului
  int index = 0; // valoarea indexului de adaugare in tablou
  int aux; // variabila auxiliara pentru citirea unui intreg de la intrarea standard
  current_size = CHUNK; // initial consideram ca dimensiunea array-ului este de CHUNK elemente
  /*se aloca dinamic un array de current_size elemente (in cazul initial CHUNK elemente)
    dimensiunea in octeti a tabloului este current_size * sizeof(int) - fiecare element fiind de dimensiune
    sizeof(int), 
   */
  if ((array = malloc(current_size * sizeof(int))) == NULL)
    {
      // nu am putut sa fac alocare dinamica - functia va returna null - nu isi poate reveni dupa o asemenea eroare
      return NULL;
    }
  while (scanf("%d", &aux) == 1) // se citeste ciclic de la stdin cate un intreg pana cand nu se mai poate citi
    {
      array[index] = aux; // se salveaza elementul citit in tablou
      index++; // se incrementeaza indexul
      /*
	- in contnuare se verifica daca mai este loc pentru a adauga ulterior elemente in tablou
	- daca nu mai este loc se mareste dimensiunea array-ului cu inca CHUNK elemente 
       */
      if (index == current_size)
	{
	  /*
	    nu mai am spatiu in blocul de memorie alocat pana acum => trebuie sa-l realoc la o dimensiune mai mare
	    noua dimnensiunea este vechea dimensiune + CHUNK
	   */
	  current_size = current_size + CHUNK;
	  if ((array = realloc(array, current_size * sizeof(int))) == NULL)
	    {
	      // daca nu s-a putut realoca array-ul la noua dimensiune functia va returna null
	      return NULL;
	    }
	}
    }
  /* se realoca din nou array-ul pentru a se dimensiona la dimensiunea curenta efectiv
     prin aceasta operatie se "elimina" posibilul spatiu nefolosit din ultimul bloc de memorie realocat
     aceasta situatia apare in cazul in care ultimele CHUNK elemente alocate nu s-au umplut
     - se realizeaza aceasta operatie deoarece se doreste ca programul sa aibe o amprenta minima de memorie
   */
  if ((array = realloc(array, index * sizeof(int))) == NULL)
    {
      return NULL;
    }
  // se scrie in zona de memorie primita ca argument dimensiunea efectiva a arary-ului (cate elemente s-au populat)
  *size = index;
  // se returneaza noul array alocat dinamic
  return array;
}
/*
functie ce primeste ca argument un array de numere intregi si dimensiunea acestuia si populeaza acest array
cu numere citite de la intrarea standard pana cand se ajunge la dimensiunea maxima a array-ului sau pana la 
EOF
Functia returneaza numarul de elemente populate in array ( numarul de elemente citite de la intrarea standard
 */
int read_array_stdin(int *a, int size)
{
  int i;
  for (i = 0; i < size; i++)
    {
      /* scanf returneaza cate elemente (cu %) au fost interpretare si salvate 
	 in acest caz scanf va returna 1 cand va citi cu succes un intreg (%d), 0 daca nu a reusit si EOF daca a
	 intalnit end of file
       */
      if (scanf("%d", &a[i]) != 1)
	{
	  break;
	}
    }
  return i;
}

/*
functie ce primeste ca argument un tablou de intregi si dimensiunea acestuia. Functia are rolul de a printa la
iesirea standard fiecare element din tablou
- modificator const s-a folosit pentru a limita functia print_array la a nu putea sa scrie si sa modifice tabloul
 */
void print_array(const int *a, int size)
{
  for (int i = 0; i < size; i++)
    {
      printf ("%d ", a[i]);
    }
  printf ("\n");
}

/*
functie de sortarea a unui tablou de intregi. primeste ca argument tabloul si dimensiunea acestuia. 
 */

void BubbleSort(int *v, int n)
{
  int s,i,aux;
  do{
    s = 0;                             // setam faptul ca nu au avut loc schimbari la iterarea curenta
    for (i = 1; i < n; i++)
      {      
	// @1 - pornim de la 1 ca sa formam perechi (v[i-1],v[i])
	if (v[i - 1] > v[i])
	  {             
	    // daca valorile NU respecta relatia de ordine
	    aux = v[i - 1];                 // interschimba valorile
	    v[i - 1] = v[i];
	    v[i] = aux;
	    s = 1;                             // @2 - seteaza faptul ca a avut loc cel putin o schimbare
	  }
      }
  } while (s);                         // daca s adevarat (!=0), atunci repeta iterarea
}

int main(void)
{
  int *array; // variabila ce va referi array-ului alocat dinamic
  int n = 0;
  
  srand(time(NULL));
  // read_array(array, 3000);
  // n = read_array_stdin(array, SIZE);
  // se apeleaza functia ce va returna adresa array-ului alocat dinamic si va scrie in adresa lui n cate elemente a citit
  array = read_array_stdin_dynamic(&n);
  if (array == NULL)
    {
      // daca functia a returnat NULL programul se va termina cu o eroare
      printf ("Fatal error\n");
      return 0;
    }
  BubbleSort(array, n);
  print_array(array, n);
  // inainte de terminarea programului se elibereaza memoria alocata dinamic
  free(array);
  return 0;
}
