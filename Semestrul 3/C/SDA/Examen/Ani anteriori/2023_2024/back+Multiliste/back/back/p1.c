#include "p1.h"
#include <stdio.h>
#include <string.h>
//p1 se da mutime
int Solutie(char m[20],int k) {
    if (strlen(m) == k)
    {    return 1;}
    else
        return 0;
}
int OK(int v[4], char M[4], char m[20]) {
    
    int s;
    for (int i = 0; i < strlen(M); ++i)
    {
        s = 0;
        for (int j = 0; j < strlen(m); ++j)
        {
            if (M[i] == m[j])
                s = s + 1;
        }
        if (v[i] < s)
            return 0;
    }
    return 1; 
}
void back(int v[4],char M[4],char m[20],int k,int dim) {
    for (int i = 0; i < strlen(M); ++i)
    {
        char aux[20]="";
        m[k] = M[i];
        for (int j = 0; j <= k; j++)
            aux[j] = m[j];
        if (OK(v,M,aux))
            if (Solutie(aux, dim))
                printf("%s\n", m);
            else
                back(v, M, m, k + 1, dim);
    }
}

void problema1()
{
	char M[4] = "abc",m[20]="";
	int v[4] = { 3, 4, 3};
	back(v, M,m,0,10);
}