#include <stdio.h>
#include <stdlib.h>

/*
program ce citeste de la intrarea standard un numar necunoscut (si nelimitat)
de linii de text de o dimensiune necunoscuta (nelimitata)
- se va citi intr-un tablou nelimitat de string-uri ==> char **
*/

#define CHUNK 8
#define ARRAY_CHUNK 2

#define ARRAY_SIZE 10

// functie - citeste o linie oricat de lunga pana la EOL (end of line) sau EOF
/*
functie ce citeste o linie de text de la stdin, de o dimensiune necunoscuta, oricat 
de lunga, pana ce intalneste caracterul new line (\n) sau EOF
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
- se asteapta ca tablouri de linii sa fie terminat cu un pointer NULL
- accepta ca argument un pointer dublu ce reprezinta tablouri de string-uri
 */
void print_lines(char **lines)
{
  char **p; // variabila intermediara pentru parcugerea tabloului de ponteri alocat dinamic
  int i = 0;
  p = lines; // se initializeaza cu inceputul tabloului de pointeri
  /*
   *p reprezinta lines[i] si se cicleaza pana cand se ajunge la elementul NULL 
   adica pana cand lines[i] == NULL
   */
  while (*p != NULL)
    {
      printf ("%d - %s\n", i, *p); // se printeaza linia precedata de un numar de ordine
      p++; // se trece la urmatorul element din tabloul de pointeri (un fel de i++ de la lines[i])
      i++;
    }
}


/*
functie ce elibereaza memoria alocata pentru fiecare linie de text in parte
elibereaza fiecare lines[i] in tabloul de pointeri lines
practic elibereaza ceea ce s-a alocat in functia getline_stdin
 */
void free_lines(char **lines)
{
  char **p; // variabila intermediara pentru parcurgerea tabloului de pointeri alocat dinamic
  p = lines;// se initializeaza cu inceputul tabloului de pointeri
  /*
   *p reprezinta lines[i] si se cicleaza pana cand se ajunge la elementul NULL 
   adica pana cand lines[i] == NULL
  */
  while (*p != NULL)
    {
      free(*p); // se elibereaza memoria pentru fiecare linie alocat (*p reprezinta linia curenta)
      p++;// se trece la urmatorul element din tabloul de pointeri (un fel de i++ de la lines[i])
    }
}

/* functie care se foloseste de functia getline_stdin() si citeste
un numar necunoscut de linii. functia getline_stdin() returneaza o linie
de text alocata dinamic. Aceasta linie este apoi adaugata in tabloul de
char * alocat dinamic. Structura rezultata este char ** adica un tablou de
pointeri de char (un tablou de string-uri, in acest caz)
char c --> &c --> char *
char *c --> &c --> char **
functia returneaza tabloul de pointeri sau NULL daca nu s-a citit nimic
prin conventie functia adauga un NULL pe pozitia urmatoare a ultimei linii citite 
pentru a se putea identifica limita tabloului cu date citite
tabloul de pointeri este si el la randul lui alocat dinamic
ex: tabloul de linii contine 3 linii
lines[0] = o linie
lines[1] = o linie
lines[2] = o linie
lines[3] = NULL - se marcheaza prin conventie limita tabloului
 */
char **get_lines(void)
{
  char **lines = NULL; // tablou de pointeri de char initializat cu NULL
  char *current_line = NULL; // linia curenta initializata cu NULL
  int i = 0;
  int current_size = 0; // dimensiunea curenta a tabloului de pointeri de char (a lui lines)

  /* 
     se citeste cate o linie folosindu-se de getline_stdin si se adauga aceasta linie citita
in tabloul de pointeri de char (lines) pana cand functia getline_stdin returneaza NULL 
   */
  while ((current_line = getline_stdin()) != NULL)
    {
      // se verifica daca mai este loc in tabloul de pointeri de char pentru adaugarea unei linii
      if (i == current_size)
	{
	  /* nu mai este loc
	  se calculeaza noua dimensiune a tabloului de pointeri de char
	  se aloc in blocuri de dimensiune ARRAY_CHUNK si nu 1 cate 1 pentru a se optimiza numarul
	  de alocari/realocari de memorie
	  */
	  current_size = current_size + ARRAY_CHUNK;	 
	  lines = realloc(lines, current_size * sizeof(char*)); // se realoca la noua dimensiunea
	  /*
	    se observa ca tipul de date pentru un element este char *
	    se aloca noua dimensiune ca fiind current_size * sizeof(char*)
	    - atentie - este tablou de pointeri de tip char
	   */
	}
      lines[i++] = current_line; // de adauga in tablou noua linie pe pozitia i si se incr pozitia
    }
  // cate linii ? i
  // se verifica daca este loc pentru a adauga terminatorul NULL al tabloului de pointeri (limita lui)
  // NULL a fost stabilit prin conventie
  if (i == current_size)
    {
      /* nu mai este loc
	 se calculeaza noua dimensiune ca fiind cea veche + 1 - este necesar a se extinde cu doar un char*
	 iar acesta se va asigna cu terminatorul ales prin conventie, acesta fiind NULL
      */
      current_size++;
      lines = realloc(lines, current_size * sizeof(char*));
    }
  lines[i] = NULL; // se marcheaza terminatorul tabloului ales prin conventie

  return lines; // se returneaza structura de date ce reprezinta tabloul de linii
  /* ATENTIE: terminatorul tabloului este ales prin conventie ca fiind NULL, marcheaza sfarsitul tabloului de
     pointeri de char si nu are absolut  nici o legatura cu terminatorul \0 care marcheaza obligatoriu sfarsitul
     unui string. S-a ales aceasta metoda pentru a nu se returna si tine evidenta numarului de linii... aceasta
     ar fi adaugat o variabila in plus de returnat care sa specifice numarul de linii din tablou
  */
}

int main(void)
{
  char **lines = NULL; // un tablou de pointeri de char ce va contine datele citite
  lines = get_lines(); // se apeleaza functia ce citeste numarul necunoscut si nelimitat de linii de text
  print_lines(lines); // printarea informatiilor citite
  free_lines(lines); // eliberarea memoriei pentru fiecare element din tablouri de pointeri (stergerea fiecarei linii in parte)
  free(lines); // eliberarea memoriei ocupate de tabloul de pointeri (pointerii de pe fiecare pozitia au fost deja eliberati )

  return 0;
}
