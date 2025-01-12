#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define date2 "Date.txt"
typedef struct produs {
	struct produs* urm;
	int nr;
}produs;//tip de date lista secundara
typedef struct magazin {
	struct magazin* next;
	struct produs* urm;
	char nume[30];
}magazin;//tip de date lista principala
magazin* adaugamagazin(magazin* p, char z[30]) {
	magazin* t;
	t = (magazin*)malloc(sizeof(magazin));
	t->next = p;
	strcpy(t->nume, z);
	t->urm = NULL;
	return t;
}
//adaugarea se produce in fata in O(1)
produs* adaugaprodus(magazin* p, int n) {
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
			while (u->urm != NULL && n >= u->urm->nr)
			{
				u = u->urm;
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
}//adugare in ordine a fiecarui element din lista secundara
//timp adaugare O(n) unde n nr de elemente aflate deja in lista
void parcurgere2(magazin* p)
{
	magazin* y = p;
	while (y)
	{
		printf("%s ", y->nume);
		produs* u = y->urm;
		while (u)
		{
			printf("%d ", u->nr);
			u = u->urm;
		}
		printf("\n");
		y = y->next;
	}
	printf("\n");
}//O(n*m) unde n este nr de mag ,iar m nr de produse din toate sublistele
void eliberarememorie2(magazin* p)
{
	magazin* y = p;
	while (y)
	{
		magazin* t;
		produs* u = y->urm, * e = u;
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
}//O(n+m) unde n este nr de mag ,iar m nr de produse din toate sublistele
void sergere2(magazin* p, int n)
{
	magazin* y = p;
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
			while (u->urm != NULL && u->urm->nr == n)
			{
				produs* t = u->urm;
				u->urm = u->urm->urm;
				free(t);
			}
			u = u->urm;
		}
		y = y->next;
	}
}//O(n+m) unde n este nr de mag ,iar m nr de produse din toate sublistele
int main(void)
{
	FILE* f = fopen(date2, "rt");
	if (f == NULL)
	{
		fprintf(stderr, "Cant open file ");
		return -1;
	}
	magazin* p = NULL;
	int n; char z[30];
	for (int j = 0; j < 3; j++)
	{
		fscanf(f, "%s", z);
		p = adaugamagazin(p, z);
		for (int i = 0; i < 5; i++)
		{
			fscanf(f, "%d", &n);
			p->urm = adaugaprodus(p, n);
		}
	}//implementare multilista O(n*m) unde n este nr de mag 
	//,iar m nr de produse din toate sublistele
	parcurgere2(p);
	sergere2(p, 333);
	parcurgere2(p);
	eliberarememorie2(p);
	fclose(f);
	return 0;
}