#include <stdio.h>
#include <stdlib.h>

int traseuX[100], traseuY[100];
int di[4] = { 1, -1, 0, 0 };
int dj[4] = { 0, 0, 1, -1 };
int lTraseu;

void solutie()
{	
	if(lTraseu == 1) {
		printf("Sunteti deja in solutie. Pozitia este (%d,%d)",traseuX[lTraseu-1],traseuY[lTraseu-1]);
	}
	else {
	printf("Traseu ->");
	for(int i = 0; i< lTraseu-1; i++)
		printf(" (%d,%d)", traseuX[i], traseuY[i]);
	printf(" cu solutia in (%d,%d)\n",traseuX[lTraseu-1],traseuY[lTraseu-1]);
	}
}

void backtrack(int **a, int m, int n, int x, int y)
{	if(x<0 || x>=m || y<0 || y>=n) return;
	int i;
	traseuX[lTraseu] = x;
	traseuY[lTraseu] = y;
	lTraseu++;
	if (x == 0 || x == (m - 1) || y == 0 || y == (n - 1))
	{
		solutie();
		lTraseu--;
		return;
	}
	else
	{
		for (i = 0; i < 4; i++)
			if (a[x + di[i]][y + dj[i]] < a[x][y])
				backtrack(a, m, n, x + di[i], y + dj[i]);
	}
	lTraseu--;
	return;
}

int main()
{
	int **v;
	int m, n, a, b, i, j;
	printf("Dati numarul de linii:");
	scanf("%d", &m);
	printf("Dati numarul de coloane:");
	scanf("%d", &n);
	v = (int**)malloc(m*sizeof(int*));
	if (v == NULL)
	{
		printf("MEMORIE INSUFICIENTA");
		exit(EXIT_FAILURE);
	}
	for (i = 0; i < n; i++)
	{
		v[i] = (int*)malloc(n*sizeof(int));
		if (v[i] == NULL)
		{
			printf("MEMORIE INSUFICIENTA");
			exit(EXIT_FAILURE);
		}
	}
	for (i = 0; i < m; i++)
		for (j = 0; j < n; j++)
		{
			printf("a[%d][%d]=", i, j);
			scanf("%d", &v[i][j]);
		}
	printf("a=");
	scanf("%d", &a);
	printf("b=");
	scanf("%d", &b);
	backtrack(v, m, n, a, b);
	for (i = 0; i < m; i++)
		free(v[i]);
	free(v);
}