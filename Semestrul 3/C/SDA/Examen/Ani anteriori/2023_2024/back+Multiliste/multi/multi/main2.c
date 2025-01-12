#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>
#define date2 "Date2.txt"
typedef struct student {
	struct student* urm;
	char nume[20];
}student;
typedef struct zoom {
	struct zoom* next;
	struct student* urm;
	int id, parola;
}zoom;
zoom* adaugazoom(zoom* p, int i,int parol) {
	zoom* t;
	t = (zoom*)malloc(sizeof(zoom));
	t->next = p;
	t->parola = parol;
	t->id = i;
	t->urm = NULL;
	return t;
}
student* adaugastudent(zoom* p, char n[20]) {
	student* h;
	h = (student*)malloc(sizeof(student));
	strcpy(h->nume,n) ;
	if (p->urm == NULL)
		h->urm = NULL;
	else
	{

		if (strcmp(n, p->urm->nume)<=0)
		{
			h->urm = p->urm;
		}
		else
		{
			student* u = p->urm;
			student* y = p->urm;
			while (u->urm != NULL && strcmp(n , u->urm->nume)>=0)
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
				student* t;
				t = u->urm;
				u->urm = h;
				h->urm = t;
			}
			return y;
		}
	}
	return h;
}
void parcurgere2(zoom* p)
{
	zoom* y = p;
	while (y)
	{
		printf("%d %d ", y->id,y->parola);
		student* u = y->urm;
		while (u)
		{
			printf("%s ", u->nume);
			u = u->urm;
		}
		printf("\n");
		y = y->next;
	}
	printf("\n");
}
void eliberarememorie2(zoom* p)
{
	zoom* y = p;
	while (y)
	{
		zoom* t;
		student* u = y->urm, * e = u;
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
void sergere2(zoom* p, char n)
{
	zoom* y = p;
	while (y)
	{
		student* u = y->urm;
		while (u->nume[0] == n && u != NULL)
		{
			u = u->urm;
			free(y->urm);
			y->urm = u;
		}
		while (u)
		{
			while (u->urm != NULL && u->urm->nume[0] == n)
			{
				student* t = u->urm;
				u->urm = u->urm->urm;
				free(t);
			}
			u = u->urm;
		}
		y = y->next;
	}
}
int main(void)
{
	FILE* f = fopen(date2, "rt");
	if (f == NULL)
	{
		fprintf(stderr, "Cant open file ");
		return -1;
	}
	zoom* p = NULL;
	int n,m; char z[20];
	for (int j = 0; j < 3; j++)
	{
		fscanf(f, "%d %d", &n,&m);
		p = adaugazoom(p,n,m);
		for (int i = 0; i < 5; i++)
		{
			fscanf(f, "%s", z);
			p->urm = adaugastudent(p,z);
		}
	}
	parcurgere2(p);
	sergere2(p,'A');
	parcurgere2(p);
	eliberarememorie2(p);
	fclose(f);
	return 0;
}