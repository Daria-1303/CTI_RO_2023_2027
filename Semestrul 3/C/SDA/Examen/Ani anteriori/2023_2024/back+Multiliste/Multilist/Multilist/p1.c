//#define _CRTDBG_MAP_ALLOC
#include "p1.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <crtdbg.h>

depozite* adaugadepozit(depozite* p,char z[30]) {
	depozite* t;
	t = (depozite*)malloc(sizeof(depozite));
	t->next = p;
	strcpy(t->nume ,z);
	t->urm = NULL;
	return t;
}

palet* adaugapalet(depozite* p, int  n){
	palet* t;
	t = (palet*)malloc(sizeof(palet));
	t->urm = p->urm;
	t->nr = n;
	return t;
}
void parcurgere(depozite* p) {
	depozite* y=p;
	while (y)
	{
		printf("%s ", y->nume);

		palet* u=y->urm;
		while (u)
		{
			printf("%d ", u->nr);
			u = u->urm;
		}
		printf("\n");
		y = y->next;
	}
}
void sergere(depozite* p, int n)
{
	depozite* y = p;
	while (y)
	{
		palet* u = y->urm;
		while (u->nr == n )
		{
			palet* deSters = u;
			y->urm = u->urm;
			u = u->urm;
			free(deSters);
		}
		while (u)
		{	
			while(u->urm!=NULL && u->urm->nr == n)
			{
				palet* g;
				g= u->urm;
				u->urm = u->urm->urm;
				free(g);
			}
			u = u->urm;
		}
		printf("\n");
		y = y->next;
	}
}
void eliberarememorie(depozite* p) {
	depozite* y = p;
	while (y)
	{
		depozite* t=y;
		palet* u = y->urm;
		while (u)
		{
			palet* f = u;
			u = u->urm;
			free(f);
		}
		y = y->next;
		free(t);
	}
}