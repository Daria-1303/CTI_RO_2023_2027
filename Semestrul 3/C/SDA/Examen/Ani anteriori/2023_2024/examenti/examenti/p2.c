#include <stdio.h>
#include <string.h>
typedef struct eve {
	int final;
	char id[35];
	int initial;
}eve;
void sotare(eve *a,int n)
{
	eve t;

	for (int i = 0; i < n; i++)
	{
		for (int j = n - 1; j > i; j--)
		{
			if (a[j - 1].final > a[j].final)
			{
				t = a[j - 1];
				a[j - 1] = a[j];
				a[j] = t;
			}
		}
	}
}
void afisare(eve* f, int n)
{
	for (int i = 0; i < n; i++)
	{
		printf("%s %d %d \n",f[i].id, f[i].initial, f[i].final);
	}
	printf("\n");
}
void evenim(eve* f, int n)
{
	int timp=0,timpfinal=f[n-1].final;
	int i = 0;

	while (i < n)
	{
		if (timp <= f[i].initial)
		{
			timp = f[i].final;
			printf("%s ", f[i].id);
		}
		i = i + 1;
	}
	printf("\n");
}
int main(void)
{
	int n=3;
	eve f[3];
	f[0].final = 1;
	f[0].initial = 0;
	strcpy(f[0].id, "ID0");
	strcpy(f[1].id, "ID1");
	strcpy(f[2].id, "ID2");
	f[1].final = 25;
	f[1].initial = 0;
	f[2].final = 6;
	f[2].initial = 4;
	afisare(f, n);
	sotare(f, n);
	afisare(f, n);
	evenim(f, n);
	return 0;
}