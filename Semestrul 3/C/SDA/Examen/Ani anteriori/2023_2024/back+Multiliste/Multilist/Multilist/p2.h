#include <stdio.h>
#ifndef p2
#define p2
typedef struct produs {
	struct produs* urm;
	int nr;
}produs;
typedef struct magazin {
	struct magazin* next;
	struct produs* urm;
	
	char nume[30];
}magazin;

magazin* adaugamagazin(magazin* p,char z[30]);

produs* adaugaprodus(magazin* p, int n);

void parcurgere2(magazin* p);

void eliberarememorie2(magazin* p);

void sergere2(magazin* p,int date);

#endif 
