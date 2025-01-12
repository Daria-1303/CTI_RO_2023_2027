#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define Date "date4.txt"
typedef struct echipa {
	char nume[25];
	char oras[25];
	int puncte;
	int buget;
}echipa;
void citire(echipa* s, int n, FILE* f)
{
	for (int i = 0; i < n; i++)
	{
		fscanf(f, "%s %s %d %d", s[i].nume, s[i].oras, &s[i].puncte, &s[i].buget);
	}
}
void afisare(echipa* s, int n)
{
	for (int i = 0; i < n; i++)
	{
		printf("%s %s %d %d\n", s[i].nume, s[i].oras, s[i].puncte, s[i].buget);
	}
	printf("\n");
}
void a(echipa* s, int n)
{
	int a=0,b=n-1,j=0;
	echipa t;
	while (j <= b)
	{
		if (s[j].puncte > 45)
		{
			t = s[j];
			s[j] = s[a];
			s[a] = t;
			a++;
			j++;
		}
		else
		{
			if (s[j].puncte < 20)
			{
				t = s[j];
				s[j] = s[b];
				s[b] = t;
				b--;
			}
			else
			{
				j++;
			}
		}
	}
}
void b(echipa* s, int n)
{
	int k = 0;
	for (int i = 0; i < n; i++)
	{
		if (s[i].buget>100000)
		{
			k++;
		}
	}
	int g = 0, i = 0;
	while (g != k)
	{
		if (s[i].buget>100000)
		{
			echipa x = s[i];
			int index = i;
			for (int j = i + 1; j < n; j++)
			{
				if (s[j].buget>100000)
				{
					if (x.puncte>s[j].puncte)
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
	echipa* s;
	if ((s = malloc(sizeof(echipa) * n)) == NULL)
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