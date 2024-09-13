#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>


#define CHUNK 16

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

int main(void)
{
  /* program pentru testarea functiei */
  char *line = NULL;
  line = getline_stdin();
  if (line != NULL) // verific valoarea returnata de functie
    {      
      printf ("My line is: %s\n", line);
      printf ("Line size:%ld\n", strlen(line));      
      free(line);
    }
  else
    {
      printf ("There is no line :(\n");      
    }
  return 0;
}
