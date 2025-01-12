#include "cotedeinaltime.h"
#include <stdio.h>
#include <stdlib.h>

void eliberare(cote** s, int n, int m)
{
	for (int i = 0; i < n; i++)
		free(s[i]);
	free(s);
}

void citire(cote** s, int n, int m,FILE *f)
{
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			fscanf(f, "%d", &s[i][j].traseu);
			s[i][j].intial = 0;
		}
	}
}
void afisare(cote** s, int n, int m)
{
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			if (s[i][j].intial == 0)
				printf("* ");
			else
				printf("# ");
		}
		printf("\n");
	}
	printf("\n");
}
int valid(int p1, int p2,int n,int m)
{
	if (p1 != -1 && p2 != -1 && p1 != n  && p2 != m )
		return 1;
	return 0;
}
void functie(cote** s,int p1,int p2, int n, int m)
{
	if (valid(p1, p2, n, m))
	{
		int k = 0,r=0;
		if (valid(p1, p2-1, n, m))
		{
			if (s[p1][p2].traseu >= s[p1][p2-1].traseu)
			{
				s[p1][p2-1].intial = 1;
				functie(s, p1, p2-1, n, m);

			}
			else
			{
				r++;
			}
		}
		else
		{
			k++;
		}
		if (valid(p1-1, p2, n, m))
		{
			if (s[p1][p2].traseu >= s[p1-1][p2].traseu)
			{
				s[p1-1][p2].intial = 1;
				functie(s, p1-1, p2, n, m);
			}
			else
			{
				r++;
			}
		}
		else
		{
			k++;
		}
		if (valid(p1, p2+1, n, m))
		{
			if (s[p1][p2].traseu >= s[p1][p2+1].traseu)
			{
				s[p1][p2+1].intial = 1;
				functie(s, p1, p2+1, n, m);
			}
			else
			{
				r++;
			}
		}
		else
		{ 
			k++;
		}
		if (valid(p1+1, p2, n, m))
		{
			if (s[p1][p2].traseu >= s[p1+1][p2].traseu)
			{
				s[p1+1][p2].intial = 1;
				functie(s, p1+1, p2, n, m);
			}
			else
			{
				r++;
			}
		}
		else
		{
			k++;
		}
		if (k != 0)
			afisare(s, n, m);
		s[p1][p2].intial = 0;
	}
}

