#include <stdio.h>
#ifndef cotedeinaltime
#define cotedeinaltime
typedef struct cote {
	int intial;
	int traseu;
}cote;

void eliberare(cote** s, int n, int m);

void citire(cote** s, int n, int m, FILE* f);

void functie(cote** s, int p1, int p2, int n, int m);

#endif
