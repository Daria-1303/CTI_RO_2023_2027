#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct angajat
{
    char nume[35];
    int an, bonus;
} angajat;

void quicksort1(angajat *a, int s, int d)
{
    int i = s, j = d;
    angajat x = a[(s + d) / 2];
    do
    {
        while (a[i].bonus > x.bonus)
            i++;
        while (a[j].bonus < x.bonus)
            j--;
        if (i <= j)
        {
            angajat temp = a[i];
            a[i] = a[j];
            a[j] = temp;
            i++;
            j--;
        }
    }
    while (i <= j);

    if (s<j)
        quicksort1(a, s, j);
    if (d>i)
        quicksort1(a, i, d);
}

void bubblesort(angajat *a, int n)
{
    angajat temp;
    int i, j;
    for (i = 0; i < n; i++)
    {
        for (j = n - 1; j>i; j--)
            if ((strcmp(a[j - 1].nume,a[j].nume)<0 && a[j].bonus==0 && a[j-1].bonus==0) || a[j-1].bonus==1 )
            {
                temp = a[j - 1];
                a[j - 1] = a[j];
                a[j] = temp;
            }
    }
}

void afisare(angajat *a, int N)
{
    int i;
    for (i = 0; i < N; i++)
        printf("%s %d %d\n", a[i].nume, a[i].an, a[i].bonus);
    printf("\n");
}

int main()
{
    int N;
    printf("Dati numarul de angajati:");
    scanf("%d", &N);
    angajat *v;
    v = (angajat*)malloc(N*sizeof(angajat));
    if (v == NULL)
    {
        printf("MEMORIE INSUFICIENTA");
        exit(EXIT_FAILURE);
    }
    int i;
    for (i = 0; i < N; i++)
    {
        getchar();
        printf("Dati nume:");
        gets(v[i].nume);
        printf("Dati an:");
        scanf("%d", &v[i].an);
        printf("Dati bonus:");
        scanf("%d", &v[i].bonus);
    }

    bubblesort(v, N);
    afisare(v, N);
}
