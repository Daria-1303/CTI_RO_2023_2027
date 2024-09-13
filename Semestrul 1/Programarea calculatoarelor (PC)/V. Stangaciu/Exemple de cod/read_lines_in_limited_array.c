#include <stdio.h>
#include <stdlib.h>

/*
program ce citeste de la intrarea standard un numar cunoscut si limitat
de linii de text de o dimensiune necunoscuta (nelimitata)
- se va citi intr-un tablou limitat de string-uri
- programul citeste pana la EOF sau pana cand s-a ajuns la limita tabloului
de linii
*/

#define CHUNK 8

// dimensiunea tabloului de linii - numarul de linii ce pot fi stocate
#define ARRAY_SIZE 10 

// functie - citeste o linie oricat de lunga pana la EOL (end of line) sau EOF
/*
functie ce citeste o linie de text de la stdin, de o dimensiune necunoscuta, oricat de lunga, pana ce intalneste caracterul new line (\n) sau EOF
Returneaza 
  - un string alocat dinamic 
  - NULL daca nu a putut citi nici macar un caracter din linie
 */

char *getline_stdin(void)
{
  char *line = NULL;
  int ch = 0;
  int i = 0;
  int current_size = 0; // dimensiunea curenta a linie
  while ((ch = getchar()) != EOF) // se citeste pana la EOF
    {
      if (i == current_size)
	{	  
	  /* nu mai am spatiu in blocul de memorie => trebuie sa-l realoc 
	     la o domensiune mai mare
	     pot sa realoc si un pointer NULL !!!! 
	  */
	  current_size = current_size + CHUNK; // calculez noua dimensiune
	  line = realloc(line, current_size * sizeof(char));
	}
      if (ch != '\n')
	{
	  *(line + i++) = ch;
	}
      else
	{
	  break;
	}
    }
  
  /* am terminat de citit o linie in zona de memorie alocata dinamic
     trebuie sa adaug terminatorul de string \0
     verific inainte daca am reusit sa salvez macar un caracter in 
     linie (deci daca am reusit sa o aloc dinamic)
  */
  if (line != NULL)
    {
      /* verific daca am loc sa adaug \0
	 un caz defavorabil
      */
      if (i == current_size) 
	{
	  /* nu am am spatiu in blocul de memorie pt \0
	     trebuie sa realoc blocul de memorie la o dimensiune
	     mai mare cu 1 byte
	   */
	  current_size++;
	  line = realloc(line, current_size * sizeof(char));
	}
      *(line + i) = 0; // adaug \0
    }
  return line;
}

/*
- functie ce printeaza la stdout un tablou de string-uri
- accepta ca argument un tablou de pinteri de char si dimensiunea acestuia
 */
void print_line_array(char *line_array[], int s)
{
  for (int i = 0; i < s; i++)
    {
      printf ("%d - %s\n", i, line_array[i]);
    }
}

/*
functie ce elibereaza memoria alocata pentru fiecare linie de text in parte
elibereaza fiecare lines[i] in tabloul de pointeri line_array
practic elibereaza ceea ce s-a alocat in functia getline_stdin
accepta ca si argument tabloul de pointeri de char si dimensiunea acestuia
 */

void free_line_array(char *line_array[], int s)
{
  for (int i = 0; i < s; i++)
    {
      free(line_array[i]);
    }
}

int main(void)
{
  char *line = NULL; // o variabila ce va stoca linia curenta
  int count = 0; // numarul de linii citite
  // tabloul de pinteri la char (de linii) alocat static de dimensiune ARRAY_SIZE
  char *line_array[ARRAY_SIZE];
  // se apeleaza functia getline_stdin ce returneaza o zona de memorie alocata dinamic ce contine o linie de text de dimensiune initial necunoscuta. Functia retunreaza NULL cand nu a mai putut citi o linie pentru ca s-a ajuns la EOF
  while ((line = getline_stdin()) != NULL)
    {
      // se verifica daca mai este loc in tabloul pentru adaugarea liniei citite
      if (count < ARRAY_SIZE)
	{
	  // daca mai este loc se adauga linia citita
	  line_array[count] = line;
	  count++;
	}
      else
	{
	  // daca nu mai este loc linia nu se mai adauga si se renunta la ea
	  break;
	}
    }
  if (line != NULL)
    {
      free(line); // se elibereaza memoria ultimei linii la care s-a renuntat
    }
  // se printeaza tabloul de linii, se apeleaza cu taboul de linii si dimensiunea acestuia
  print_line_array(line_array, count);
  // eliberarea memoriei pentru fiecare element din tablouri de pointeri (stergerea fiecarei linii in parte)
  free_line_array(line_array, count);

  
  return 0;
}
