#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define Date "date2.txt"
typedef struct agenda {
	char nume[25];
	char telefon[10];
	int an;
	int venit;
}agenda;
void citire(agenda* s, int n, FILE* f)
{
	for (int i = 0; i < n; i++)
	{
		fscanf(f, "%s %s %d %d", s[i].nume,s[i].telefon, & s[i].an, &s[i].venit);
	}
}
void afisare(agenda* s, int n)
{
	for (int i = 0; i < n; i++)
	{
		printf("%s %s %d %d\n", s[i].nume,s[i].telefon ,s[i].an, s[i].venit);
	}
	printf("\n");
}
void a(agenda* s, int n)
{
	int  ok = 2,i=0;
	while (ok != 0)
	{
		if (s[i].venit < 1000)
		{
			ok--;
			agenda x = s[i];
			for (int j = i; j < n - 1; j++)
			{
				s[j] = s[j + 1];
			}
			s[n - 1] = x;
		}
		i = i + 1;
	}
}
void b(agenda* s, int n)
{
	int k=0;
	for (int i=0; i < n; i++)
	{
		if (s[i].an <= 40 && s[i].an >= 30)
		{
			k++;
		}
	}
	int g = 0,i=0;
	while (g != k)
	{
		if (s[i].an <= 40 && s[i].an >= 30)
		{
			agenda x=s[i];
			int index = i;
			for (int j = i+1; j < n; j++)
			{
				if (s[j].an <= 40 && s[j].an >= 30)
				{
					if (strcmp(x.nume, s[j].nume) > 0)
					{
						x = s[j];
						index = j;
					}
				}
			}
			x = s[i];
			s[i] = s[index];
			s[index] = x;
			g++;
		}
		i++;
	}
}
/*
int valid(agenda x)
{
	if (x.an <= 40 && x.an >= 30)
		return 1;
	else
		return 0;
}
void bb(agenda* a, int s, int d) {
	int i = s, j = d;
	agenda  x = a[(s + d) / 2];
	do {
		while (strcmp(a[i].nume, x.nume) > 0 ) i++;
		while (strcmp(a[j].nume, x.nume) < 0 ) j--;
		if (i <= j) {
			if (valid(a[i]) && valid(a[j]))
			{
				agenda temp = a[i];
				a[i] = a[j];
				a[j] = temp;
				i++;
				j--;
			}
		}
	} while (i <= j);

	if (s < j) bb(a, s, j);
	if (d > i) bb(a, i, d);
}
*/
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
	agenda* s;
	if ((s = malloc(sizeof(agenda) * n)) == NULL)
	{
		fprintf(stderr, "Nu se poate aloca suficienta memorie");
		exit(-1);
	}
	citire(s, n, fi);
	afisare(s, n);
	a(s, n);
	afisare(s, n);
	b(s, n);
	afisare(s, n);
	if ((fclose(fi)) == EOF)
	{
		fprintf(stderr, "Nu pot inchide fisier");
		exit(-1);
	}
	free(s);
	return 0;
}