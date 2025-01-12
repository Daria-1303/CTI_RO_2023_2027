#include<stdio.h>
int solutie(int k)
{
	if (k == 9)
		return 1;
	else
		return 0;
}
int ok(int* v, int k)
{
	int s1 = 0, s2 = 0;
	if (k >= 2 && v[0] == 1 && v[1] == 1)
		return 0;
	if (k == 10 && v[9] == 0)
		return 0;
	for (int i = 0; i <= k; i++)
	{
		if (v[i] == 0)
			s1++;
		if (v[i] == 1)
			s2++;
	}
	if (s1 > 6) return 0;
	if (s2 > 4)return 0;
	return 1;
}
void afisare(int* v)
{
	for (int i = 0; i < 10; i++)
	{
		if (v[i] == 0)
			printf("0");
		if (v[i] == 1)
			printf("1");
	}
	printf("\n");
}
void back(int v[11], int k)
{
	for (int i = 0; i < 2; i++)
	{
		v[k] = i;
		if (ok(v, k))
			if (solutie(k))
				afisare(v);
			else
				back(v, k + 1);
	}
}
int main(void)
{
	int v[11];
	back(v, 0);
	return 0;
}