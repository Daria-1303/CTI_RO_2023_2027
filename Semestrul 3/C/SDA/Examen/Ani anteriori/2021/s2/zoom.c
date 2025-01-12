#include <stdlib.h>
#include <stdio.h>

typedef struct nod_ls{
	char nume[35];
	struct nod_ls *urmator_ls;
}nod_ls;

typedef struct nod_lp{
	int id;
	int parola;
	struct nod_ls *inceput_ls;
	struct nod_lp *urmator_lp;
}nod_lp;

nod_lp *inceput;

nod_lp *nou(int id, int parola)
{
	nod_lp *e = (nod_lp*)malloc(sizeof(nod_lp));
	e->id = id;
	e->parola = parola;
	e->urmator_lp = inceput;
	e->inceput_ls = NULL;
	return e;
}

nod_ls *nou_student(char nume[35], nod_ls *urmator)
{
	nod_ls *e = (nod_ls*)malloc(sizeof(nod_ls));
	strcpy(e->nume, nume);
	if (urmator == NULL)
	{
		e->urmator_ls = urmator;
		return e;
	}
	if (strcmp(e->nume, urmator->nume) < 0)
	{
		e->urmator_ls = urmator;
		return e;
	}
	nod_ls *p;
	p = urmator;
	while (p->urmator_ls != NULL)
	{
		if ((strcmp(e->nume, p->nume) > 0) && (strcmp(e->nume, p->urmator_ls->nume) < 0))
		{
			e->urmator_ls = p->urmator_ls;
			p->urmator_ls = e;
			return urmator;
		}
		p = p->urmator_ls;
	}
	e->urmator_ls = NULL;
	p->urmator_ls = e;
	return urmator;
}

void adaugare_conferinta(int id, int parola)
{
	inceput = nou(id, parola);
}

nod_lp *adaugare_student(int id, char nume[35])
{
	nod_lp *p;
	p = inceput;
	while (p->id != id)
	{
		p = p->urmator_lp;
	}
	p->inceput_ls = nou_student(nume, p->inceput_ls);
	return inceput;
}

void afisare()
{
	nod_lp *p;
	p = inceput;
	while (p != NULL)
	{
		printf("Conferinta: %d %d\n", p->id, p->parola);
		nod_ls *s;
		s = p->inceput_ls;
		printf("Studenti: ");
		while (s != NULL)
		{
			printf("%s, ", s->nume);
			s = s->urmator_ls;
		}
		printf("\n");
		p = p->urmator_lp;
	}
}

nod_ls *stergere_student(char c,nod_ls *inceput)
{
	int ok;
	nod_ls *pred;
	nod_ls *crt;
	do{
		ok = 1;
		for (pred = NULL, crt = inceput; crt; pred = crt, crt = crt->urmator_ls){
			if (crt->nume[0] == c){
				if (pred == NULL){
					inceput = inceput->urmator_ls;
					ok = 0;
				}
				else{
					pred->urmator_ls = crt->urmator_ls;
					ok = 0;
				}
			}
		}
	} while (ok == 0);
	return inceput;
}

void stergere(char c)
{
	nod_lp *p;
	p = inceput;
	while (p != NULL)
	{
		p->inceput_ls = stergere_student(c, p->inceput_ls);
		p = p->urmator_lp;
	}
}

int main()
{
	adaugare_conferinta(1, 1002);
	adaugare_conferinta(2, 9999);
	adaugare_conferinta(3, 1234);
	inceput = adaugare_student(1, "Dorian Hatz Popa");
	inceput = adaugare_student(1, "Mircea Badea");
	inceput = adaugare_student(1, "John");
	inceput = adaugare_student(1, "Florin Salam");
	inceput = adaugare_student(1, "Nicolae Guta");
	inceput = adaugare_student(2, "Mircea");
	inceput = adaugare_student(2, "Ioana");
	inceput = adaugare_student(2, "Ana");
	inceput = adaugare_student(2, "Vlad");
	inceput = adaugare_student(2, "Mihai");
	inceput = adaugare_student(3, "Andreea");
	inceput = adaugare_student(3, "Alin");
	inceput = adaugare_student(3, "Tzanca");
	inceput = adaugare_student(3, "Dan");
	inceput = adaugare_student(3, "Alina");
	afisare();
	char c;
	printf("Dati o litera:");
	scanf("%c", &c);
	stergere(c);
	afisare();
}