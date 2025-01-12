#include "p3.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//matrice n*m si 4 culori
int Solutie3(int k, int n,int m) {

    if (n*m-1 == k )
    {
        return 1;
    }
    else
        return 0;
}

int OK3(int **v, int k,int m) {
    if(k<=m-1)
    return 1;
    else
    {
        if (v[k / m][k % m] == v[k / m - 1][k % m - 1] && k % m != 0)
            return 0;
        if (v[k / m][k % m] == v[k / m - 1][k % m + 1] && k % m != m - 1)
            return 0;
    }
    return 1;
}
void Afisare3(int **v, int n,int m)
{
    printf("\n");
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j <m; j++)
        {
            printf("%d ", v[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void back3(int **v, int size, int k, int n,int m) {
    for (int i = 0; i < size; ++i)
    {
        v[k/m][k%m] = i;
        if (OK3(v, k,m))
            if (Solutie3(k, n, m))
            {
                Afisare3(v, n, m);
            }
            else
                back3(v, size, k+1, n, m);
    }
}
void initial3(int** v, int n, int m)
{
    for (int i = 0; i <n; i++)
    {
        for (int j = 0; j <m; j++)
        {
             v[i][j]=-1;
        }
        //printf("\n");
    }

}
void problema3()
{
    int n, m;
    scanf("%d",&n);
    scanf("%d",&m);
   int **v = (int**)malloc(sizeof(int*) * n);
    for (int i = 0; i < n; i++)
    {
        v[i] = (int*)malloc(sizeof(int) * m);
    }
    initial3(v, n, m);
    back3(v, 4, 0, n,m);
}