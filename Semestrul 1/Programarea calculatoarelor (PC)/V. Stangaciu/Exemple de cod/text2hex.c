#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
O functie care primeste ca argument un string si returneaza tot un string
in care inlocuieste fiecare caracter cu valoarea sa in hexazecimal pe 2 cifre
conform tabelei ASCII
exemplu:
text = "abc"
functia va returna string: "616263"
- functia va aloca dinamic string-ul rezultat de o dimensiune calculata
 */

char* text2hex(const char *text)
{
  char *r = NULL; // variabila ce va contine rezultatul
  // alocarea dinamica a rezultatului 
  r = malloc((strlen(text) * 2 + 1) * sizeof(char));
  /*
    initializarea string-ului rezultat cu string-ul NULL
    este necesar daca se doreste concatenarea ulterioara folosind strcat
  */
  strcpy(r, "");
  /*string auxiliar pentru a retine temporar ca string valoarea in hexazecimal
    a unui caracter din string-ul initial (2 cifre hexa + \0)    
   */
  char aux[3];
  /*
    pentru fiecare caracter din string-ul sursa se obtine ca string valoarea
    in hexazecimal a caracterului si apoi se concanteneaza la string-ul rezultat
   */
  for (int i = 0; i < strlen(text); i++)
    {
      /*
	se obtine ca string valoarea in hexazecimal a unui caracter
	caracterul este un intreg, valoarea in hexa este valoarea lui
	ca intreg printata ca si hexazecima pe 2 cifre cu padding de 0
	valoarea nu se va printa (evident) la stdout ci se va obtine un string
	cu aceasta
	--> transformarea unei valori intregi intr-un string in format hexazecimal
       */
      sprintf(aux, "%02X", text[i]);
      strcat(r, aux); // se concatenteaza rezultatul
    }
  return r;
}

int main(void)
{
  char test[1000]; // se ia un string limitat pentru testare
  if (fgets(test, 1000, stdin) == NULL) // se citeste o linie de la stdin
    {
      printf ("read error\n");
      exit(1);
    }
  char *result = NULL;
  result = text2hex(test); // se obtine string-ul rezultat in urma apelului functiei dezvoltate
  printf ("%s\n", result); // se printeaza rezultatul
  /*
    se elibereaza memoria alocata dinamic de functie pentru a stoca rezultatul
    functia aloca dinamic noul string, returneaza adresa zonei de memorie, 
    aceasta este apoi asignata variabilei result, deci poate fi folosita 
    variabila result pentru a elibera zona de memorie alocata dinamic in functie
   */
  free(result); 
  return 0;
}
/*
OBSERVATIE: fgets citeste o linie de text si daca este citit caracterul de
sfarsit de linie \n il adauga si pe acesta la string inainte sa scrie \0 (conform paginii de manual)
valoarea lui \n este 0x0A in hexa (conform ASCII)
 */
