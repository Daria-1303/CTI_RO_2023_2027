#include <stdio.h>
typedef struct agenda {
	char nume[25];
	char telefon[10];
	int an;
	int venit;
}agenda;
void afisare(agenda* s, int n)
{
	for (int i = 0; i < n; i++)
	{
		printf("%s %s %d %d \n", s[i].nume, s[i].telefon, s[i].venit, s[i].an);
	}
	printf("\n");
}
void a(agenda* s, int n)
{
	int ok = 2, i = 0;
	while (ok != 0 && i != n)
	{
		if (s[i].venit < 2000)
		{
			ok--;
			agenda x = s[n-2+ok];
			s[n - 2 + ok] = s[i];
			s[i] = x;
		}
		i++;
	}
}
void b(agenda* s, int n)
{
	int k = 0;
	for (int i = 0; i < n; i++)
	{
		if (s[i].an <= 30 && s[i].an >= 20)
		{
			k++;
		}
	}
	int g = 0, i = 0;
	while (g != k)
	{
		if (s[i].an <= 30 && s[i].an >= 20)
		{
			agenda x = s[i];
			int index = i;
			for (int j = i + 1; j < n; j++)
			{
				if (s[j].an <= 30 && s[j].an >= 20)
				{
					if (strcmp(x.nume, s[j].nume) > 0) {
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
	agenda s[5];
	int n = 5;
	s[0].an = 25;
	strcpy(s[0].nume,"ANA");
	strcpy(s[0].telefon ,"0758");
	s[0].venit =2001 ;
	s[1].an = 25;
	strcpy(s[1].nume, "ANA1");
	strcpy(s[1].telefon, "07581");
	s[1].venit = 200;
	s[2].an = 21;
	strcpy(s[2].nume, "ANA2");
	strcpy(s[2].telefon, "07582");
	s[2].venit = 202;
	s[3].an = 25;
	strcpy(s[3].nume, "ANA3");
	strcpy(s[3].telefon, "07583");
	s[3].venit = 2001;
	s[4].an = 25;
	strcpy(s[4].nume, "ANA4");
	strcpy(s[4].telefon, "07584");
	s[4].venit = 200;
	afisare(s, n);
	a(s, n);
	afisare(s, n);
	b(s, n);
	afisare(s, n);
	return 0;
}