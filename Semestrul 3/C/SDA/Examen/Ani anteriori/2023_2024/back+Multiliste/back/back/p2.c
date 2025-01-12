#include "p2.h"
#include <stdio.h>
#include <string.h>
//steaguri
int Solutie2(int kk, int k) {

    if (kk == k-1)
    {
        return 1;
    }
    else
        return 0;
}

int OK2(char m[7][20], int k) {

    if (k == 0)
        return 1;
    for (int i = 0; i < k; i++)
        if (strcmp(m[i], m[k]) == 0)
            return 0;
    if (k == 1)
    {
        if (strcmp(m[1], "verde")!=0 && strcmp(m[1] , "galben")!=0)
            return 0;
       
    }
    return 1;
}
void Afisare2(char aux[7][20], int k)
{
    for (int i = 0; i <= k; i++)
    {
        printf("%s ", aux[i]);
    }
    printf("\n");
}

void back2( char M[7][20],int size, char m[7][20], int k, int dim) {
    for (int i = 0; i < size; ++i)
    {
        char aux[7][20] = { "" };
        strcpy(m[k] , M[i]);
        for (int j = 0; j <= k; j++)
            strcpy(aux[j] , m[j]);
        if (OK2(aux, k))
            if (Solutie2(k, dim))
                Afisare2(aux, k);
            else
                back2( M,size, m, k + 1, dim);
    }
}

void problema2()
{
    char M[7][20] = { "alb","galben","rosu","verde","albastru","negru" }, m[7][20] = { "" };
    back2( M,6, m, 0, 3);
}