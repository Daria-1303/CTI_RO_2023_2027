#include<stdio.h>
void a(int* v, int n)
{
	int j = n - 1;
	for (int i = 0; i < j;)
	{
		if (v[i] > 0 && v[j] < 0)
		{
			int x = v[i];
			v[i] = v[j];
			v[j] = x;
			i++;
			j--;
		}
		if(v[i] < 0)
		{
			i++;
		}
		if (v[j] > 0)
		{
			j--;
		}

	}
}
void afisare(int* v, int n)
{
	for (int i = 0; i < n; i++)
	{
		printf("%d ", v[i]);
	}
	printf("\n\n");
}
void quick(int* a, int s, int d)
{
	int i = s, j = d;
	int x = a[(s + d) / 2];
	do {
		while (a[i] < x)i++;
		while (a[j] > x)j--;
		if (i <= j)
		{
			int t = a[i];
			a[i] = a[j];
			a[j] = t;
			i++;
			j--;
		}
	} while (i <= j);
	if (s < j) quick(a, s, j);
	if (d > i)quick(a, i, d);
}
void b(int* v, int n)
{
	int i = 0;
	while(v[i]<0)
	{
		i++;
	}
	//printf("%d", i);
	quick(v, i, n-1);
}
int main(void)
{
	int v[20] = { 1 , 2, 3 , -5, -6, -9 };
	int n = 6;
	afisare(v, n);
	a(v, n);
	afisare(v, n);
	b(v, n);
	afisare(v, n);
	return 0;
}