#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define Date "date.txt"
typedef struct student {
	char nume[35];
	int varsta;
	int premii;
}student;
void citire(student* s, int n,FILE *f)
{
	for (int i = 0; i < n; i++)
	{
		fscanf(f, "%s %d %d", s[i].nume, &s[i].varsta, &s[i].premii);
	}
}
void afisare(student* s, int n)
{
	for (int i = 0; i < n; i++)
	{
		printf("%s %d %d\n", s[i].nume, s[i].varsta, s[i].premii);
	}
}
int a(student* s, int n)
{
	int i = 0, j = n - 1;
	while ( i < j)
	{
		if (s[i].premii == 0 && s[j].premii == 1)
		{
			student aux;
			aux = s[i];
			s[i] = s[j];
			s[j] = aux;
		}
		if (s[i].premii == 1)
		{
			i++;
		}
		if (s[j].premii == 0)
		{
			j--;
		}
	}
	int contor = 0;
	while (s[contor].premii == 1)
	{
		contor++;
	}
	return contor;
}
void b(student* a, int s, int d) {
	int i = s, j = d;
	student  x = a[(s + d) / 2];
	do {
		while (strcmp(a[i].nume, x.nume)>0) i++;
		while (strcmp(a[j].nume,x.nume)<0) j--;
		if (i <= j) {
			student temp = a[i];
			a[i] = a[j];
			a[j] = temp;
			i++;
			j--;
		}
	} while (i <= j);

	if (s < j) b(a, s, j);
	if (d > i) b(a, i, d);
}
int main(void)
{
	FILE* fi;
	if ((fi = fopen(Date, "rt")) == NULL)
	{
		fprintf(stderr, "Nu se poate deschide fisier");
		exit(-1);
	}
	int n;
	fscanf(fi, "%d", &n);
	student* s;
	if ((s = malloc(sizeof(student) * n)) == NULL)
	{
		fprintf(stderr, "Nu se poate aloca suficienta memorie");
		exit(-1);
	}
	citire(s, n, fi);
	afisare(s, n);
	int nr;
	nr=a(s, n);
	afisare(s, n);
	b(s, 0,nr-1);
	afisare(s, n);
	if ((fclose(fi))==EOF)
	{
		fprintf(stderr, "Nu pot inchide fisier");
		exit(-1);
	}
	free(s);
	return 0;
}