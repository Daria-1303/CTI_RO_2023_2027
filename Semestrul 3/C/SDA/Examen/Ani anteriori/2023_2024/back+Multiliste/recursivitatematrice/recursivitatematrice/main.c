#include <stdio.h>
#include <stdlib.h>
#include "cotedeinaltime.h"
#include "pixel.h"
#define Date "date.txt"

int main(void)
{
	FILE* fi;
	if ((fi = fopen(Date, "rt")) == NULL)
	{
		fprintf(stderr, "Nu se poate deschide");
		exit(-1);
	}
	int n, m;
	fscanf(fi, "%d %d", &n, &m);
	cote** s;
	if ((s = (cote**)malloc(sizeof(cote*) * n)) == NULL)
	{
		fprintf(stderr, "Nu se aloca suficienta memorie");
		exit(-1);
	}
	for (int i = 0; i < n; i++)
	{
		if ((s[i] = (cote*)malloc(sizeof(cote) * m)) == NULL)
		{
			fprintf(stderr, "Nu se aloca suficienta memorie");
			exit(-1);
		}
	}
	citire(s, n, m, fi);
	functie(s, 1, 1, 3, 3);
	eliberare2(s, n, m);
	return 0;
}