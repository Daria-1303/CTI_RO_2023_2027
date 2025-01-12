#include <stdio.h>
#include <crtdbg.h>
#define _CRTDBG_MAP_ALLOC
#ifndef p1
#define p1
typedef struct palet {
	int nr;
	struct palet* urm;
}palet;
typedef struct depozite{
	char nume[30];
	struct depozite* next;
	struct palet* urm;
}depozite;


depozite* adaugadepozit(depozite* p, char z[30]);

palet* adaugapalet(depozite* p, int  n);

void parcurgere(depozite* p);

void eliberarememorie(depozite* p);

void sergere(depozite *p,int  numar);

#endif 
