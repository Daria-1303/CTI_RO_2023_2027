#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include "p2.h"
magazin* adaugamagazin(magazin* p, char z[30]) {
	magazin* t;
	t = (magazin*)malloc(sizeof(magazin));
	t->next = p;
	strcpy(t->nume, z);
	t->urm = NULL;
	return t;
}
produs* adaugaprodus(magazin *p,int n) {
	produs* h;
	h = (produs*)malloc(sizeof(produs));
	h->nr = n;
	if (p->urm == NULL)
		h->urm = NULL;
	else
	{
		if (n <= p->urm->nr)
		{
			h->urm = p->urm;
		}
		else
		{
			produs* u = p->urm;
			produs* y = p->urm;
			while (u->urm != NULL&&n>= u->urm->nr)
			{
				u=u->urm;
			}
			if (u->urm == NULL)
			{
				u->urm = h;
				h->urm = NULL;
			}
			else
			{
				produs* t;
				t = u->urm;
				u->urm = h;
				h->urm = t;

			}
			return y;
		}
	}
	return h;
}
void parcurgere2(magazin* p)
{
	magazin* y=p;
	while (y)
	{
		printf("%s ", y->nume);
		produs* u=y->urm;
		while (u)
		{
			printf("%d ", u->nr);
			u = u->urm;
		}
		printf("\n");
		y = y->next;
	}
}
void eliberarememorie2(magazin* p)
{
	magazin* y = p;
	while (y)
	{
		magazin* t;
		produs* u=y->urm,*e=u;
		while (u)
		{
			e = u;
			u = u->urm;
			free(e);
		}
		t = y;
		y = y->next;
		free(t);
	}
}
void sergere2(magazin* p,int n)
{
	magazin* y=p;
	while (y)
	{
		produs* u = y->urm;
		while (u->nr == n && u != NULL)
		{
			u = u->urm;
			free(y->urm);
			y->urm = u;
		}
		while (u)
		{
			while (u->urm != NULL && u ->urm->nr==n )
			{
				produs* t = u->urm;
				u->urm = u->urm->urm;
				free(t);
			}
			u = u->urm;
		}
		y = y->next;
	}
}