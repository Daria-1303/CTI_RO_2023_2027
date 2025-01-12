
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void quicksort1(int *a, int s, int d)
{
    int i = s, j = d;
    int x = 0;
    do
    {
        while (a[i] < 0)
            i++;
        while (a[j]>=0)
            j--;
        if (i <= j)
        {
            int temp = a[i];
            a[i] = a[j];
            a[j] = temp;
            i++;
            j--;
        }
    }
    while (i <= j);

    /*if (s<j)
        quicksort1(a, s, j);
    if (d>i)
        quicksort1(a, i, d);*/
}

void afisare(int *a, int N)
{
    int i;
    for (i = 0; i < N; i++)
        printf("%d  ", a[i]);
    printf("\n");
}

int main()
{
    int N;
    printf("Dati N:");
    scanf("%d", &N);

    int i,v[20];
    for (i = 0; i < N; i++)
    {
        printf("Dati numar:");
        scanf("%d", &v[i]);
    }
    quicksort1(v, 0,N);
    afisare(v, N);
}
