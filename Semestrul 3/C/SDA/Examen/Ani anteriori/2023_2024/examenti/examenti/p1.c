#include <stdio.h>
#include <string.h>
#include <stdlib.h>
typedef struct eveniment {
	char id[35];
	long int ma;
	struct eveniment* urm;
}eveniment;
typedef struct prioritate {
	char nume[35];
	struct prioritate* next;
	struct eveniment* urm;
}prioritate;
prioritate* addprioritate(prioritate* p, char z[35])
{
	prioritate* t;
	t = malloc(sizeof(prioritate));
	t->next = p;
	strcpy(t->nume, z);
	t->urm = NULL;
	return t;
}
typedef struct nodfifo {
	char x[35];
	struct nodfifo* prev;
	struct nodfifo* next;
}nodfifo;
nodfifo* head=NULL, *tail=NULL;
eveniment* add(prioritate* p, char i[35], long int m)
{
	eveniment* h;
	h = malloc(sizeof(eveniment));
	h->ma = m;
	strcpy(h->id, i);
	if (p->urm == NULL)
	{
		h->urm = NULL;
	}
	else
	{
		if (m <= p->urm->ma)
		{
			h->urm = p->urm;
		}
		else
		{
			eveniment* u = p->urm;
			eveniment* y = p->urm;
			while (u->urm != NULL && m >= u->urm->ma)
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
				eveniment* t;
				t = u->urm;
				u->urm = h;
				h->urm = t;
			}
			return y;
		}
	}
	return h;
}
void addeveniment(prioritate* p,int prio, char i[35], long int m)
{
	int x = prio;
	prioritate* r = p;
	while (x != 1)
	{
		r = r->next;
		x = x - 1;
	}
	r->urm = add(r, i, m);
}

void parcurgereevenimentrecursiv(eveniment* u)
{
	if (u)
	{
		printf("%s %d\n", u->id, u->ma);
		parcurgereevenimentrecursiv( u->urm);
	}
}
void parcurgere(prioritate *p)
{
	prioritate* y = p;
	while (y)
	{
		printf("%s\n", y->nume);
		eveniment* u = y->urm;
		parcurgereevenimentrecursiv(u);
		printf("\n");
		y = y->next;
	}
	printf("\n");
}
void eliberare(prioritate* p)
{
	prioritate* y = p;
	while (y)
	{
		prioritate* t;
		eveniment* u = y->urm, * e = u;
		while (u)
		{
			e = u;
			u = u->urm;
			free(e);
		}
		t = y; y = y->next;
		free(t);
	}
}
void deservire(prioritate* p)
{
	int n=1,t=0;
	prioritate* y = p;
	while (y)
	{
		if (y->urm != NULL)
			t = n;
		n = n + 1;
		y = y->next;
	}
	y = p;
	if (t!=0)
	{
		while (t != 1)
		{
			y = y->next;
			t--;
		}
		eveniment* j;
		j = y->urm;
		y->urm = y->urm->urm;
		char x[35];
		strcpy(x, j->id);

		nodfifo* r;
		r = malloc(sizeof(nodfifo));
		if (head == NULL)
			head = r;
		strcpy(r->x, j->id);
		free(j);
		r->prev = tail;
		tail = r->next;
	}
}
void parcurgerefilo()
{
	nodfifo* p = head;
	while (p)
	{
		printf("%s ", p->x);
		p = p->prev;
	}
	printf("\n");
}
int main(void)
{
	prioritate* s=NULL;
	s = addprioritate(s, "P8");
	s = addprioritate(s, "P7");
	s = addprioritate(s, "P6");
	s = addprioritate(s, "P5");
	s = addprioritate(s, "P4");
	s = addprioritate(s, "P3");
	s = addprioritate(s, "P2");
	s = addprioritate(s, "P1");
	addeveniment(s, 1, "e1", 10);
	addeveniment(s, 1, "e2", 5);
	addeveniment(s, 7, "e11", 20);
	addeveniment(s, 7, "e12", 40);
	parcurgere(s);
	deservire(s);
	parcurgerefilo();
	eliberare(s);
	return 0;
}