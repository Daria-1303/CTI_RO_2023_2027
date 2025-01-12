#include "p4.h"
#include <stdio.h>
// numar de telefon
void afisare(int* v)
{
	for (int i = 0; i <= 9; i++)
		printf("%d", v[9-i]);
	printf("\n");
}
int solutie(int k)
{
	if (k == 5)
		return 1;
	else
		return 0;
}
int valid(int k,int * v)
{
	if (v[k] % 2 == 0 && v[k-1]%2==0)
		return 0;
	return 1;
}
void back4(int k, int* v)
{
	for (int i = 0; i <= 9; i++)
	{
		v[k] = i;
		if (valid(k, v))
			if (solutie(k))
				afisare(v);
			else
				back4(k + 1, v);
	}
}
void problema4()
{
	int v[10];
	for (int i = 0; i < 10; i++)
		v[i] = -1;
	v[9] = 0;
	v[8] = 7;
	v[7] = 9;
	v[6] = 9;
	v[0] = 0;
	back4(1, v);
}