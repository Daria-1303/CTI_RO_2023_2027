#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define Date "date3.txt"
typedef struct produs {
	int cod;
	int stoc;
	struct produs *urm;
}produs;
typedef struct magazin {
	char nume[30];
	struct produs* urm;
	struct magazin* next;
}magazin;
magazin* addmagazin(magazin* p, char z[30])
{
	magazin* t;
	t = malloc(sizeof(magazin));
	t->next = p;
	strcpy(t->nume, z);
	t->urm = NULL;
	return t;
}
produs* addprodus(magazin* p, int c,int s)
{
	produs* h;
	h = malloc(sizeof(produs));
	h->cod = c;
	h->stoc = s;
	if (p->urm == NULL)
	{
		h->urm = NULL;
	}
	else
	{
		if (c <= p->urm->cod)
		{
			h->urm = p->urm;
		}
		else
		{
			produs* u = p->urm;
			produs* y = p->urm;
			while (u->urm != NULL && c >= u->urm->cod)
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
}
void parcurgere(magazin* p)
{
	magazin* y = p;
	while (y)
	{
		printf("%s \n", y->nume);
		printf("cod stoc\n");
		produs* u = y->urm;
		while (u)
		{
			printf("%3d %d \n", u->cod, u->stoc);
			u=u->urm;
		}
		printf("\n");
		y = y->next;
	}
	printf("\n");
}
void eliberare(magazin* p)
{
	magazin* y = p;
	while (y)
	{
		magazin* t;
		produs* u = y->urm,*e=u;
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
void modificare(magazin* p, char z[30], int co, int s)
{
	magazin* y = p;
	while (y)
	{
		if (strcmp(z, y->nume) == 0)
		{
			produs* u = y->urm;
			while (u)
			{
				if (u->cod == co)
				{
					u->stoc = s;
				}
				u = u->urm;
			}
		}
		y = y->next;
	}
}
int main(void)
{
	FILE* f = fopen(Date, "rt");
	if (f == NULL)
	{
		fprintf(stderr, "Cant open file");
		return-1;
	}
	magazin* p=NULL;
	int n,m; char z[30];
	for (int j = 0; j < 3; j++)
	{
		fscanf(f, "%s", z);
		p = addmagazin(p, z);
		for (int i = 0; i < 2; i++)
		{
			fscanf(f, "%d %d", &n, &m);
			p->urm = addprodus(p, n,m);
		}
	}
	parcurgere(p);
	modificare(p, "mag1", 10, 10);
	parcurgere(p);
	eliberare(p);
	return 0;
}