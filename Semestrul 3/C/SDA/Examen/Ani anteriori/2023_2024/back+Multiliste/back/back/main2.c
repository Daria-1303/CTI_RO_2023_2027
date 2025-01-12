//se da m={a,b,c} formeaza cuvinte de l=10,cu 3de "a",4de"b" ,3 de "c"
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
	int s1 = 0, s2 = 0, s3 = 0;
	for (int i = 0; i <= k; i++)
	{
		if (v[i] == 0)
			s1++;
		if (v[i] == 1)
			s2++;
		if (v[i] == 2)
			s3++;
	}
	if (s1 > 4) return 0;
	if (s2 > 3)return 0;
	if (s3 > 3)return 0;
	return 1;
}
void afisare(int *v)
{
	for (int i = 0; i < 10; i++)
	{
		if (v[i] == 0)
			printf("a");
		if (v[i] == 1)
			printf("b");
		if (v[i] == 2)
			printf("c");
	}
	printf("\n");
}
void back(int v[11],int k)
{
	for (int i = 0; i < 3; i++)
	{
		v[k] = i;
		if (ok(v, k))
			if (solutie( k))
				afisare(v);
			else
				back(v,k + 1);
	}
}
int main(void)
{
	int v[11];
	back(v,0);
	return 0;
}
