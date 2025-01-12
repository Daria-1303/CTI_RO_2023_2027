#include <stdio.h>
#include <stdlib.h>
#include "pixel.h"
#include "cotedeinaltime.h"
void eliberare2(pixel** s, int n, int m)
{
	for (int i = 0; i < n; i++)
		free(s[i]);
	free(s);
}

void citire2(pixel** s, int n, int m, FILE* f)
{
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			fscanf(f, "%d", &s[i][j].stare);
			s[i][j].vizit = 0;
		}
	}
}/*
int valid(int p1, int p2, int n, int m)
{
	if (p1 != -1 && p2 != -1 && p1 != n && p2 != m)
		return 1;
	return 0;
}*/
void functie2(pixel** s,int i,int j, int n, int m)
{
	s[i][j].vizit = 1;
	if (valid(i + 1, j, n, m))
	{
		if (s[i + 1][j].stare == 1)
		{
			functie2(s, i + 1, j, n, m);
		}
	}
	
	if (valid(i, j + 1, n, m))
	{
		if (s[i][j + 1].stare == 1)
		{
			functie2(s, i, j + 1, n, m);
		}
	}
}
int pix(pixel** s, int n, int m)
{
	int contor = 0;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			if (s[i][j].stare == 1&&s[i][j].vizit==0)
			{
				functie2(s,i,j ,n, m);
				contor++;
			}
		}
	}
	return contor;
}