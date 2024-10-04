/*
5.Se citesc două numere întregi n și m, cu m>0 și n>m. Să se afișeze n numere care cresc de la 0 din 1 în 1 și dacă trec de m redevin 0, ciclul repetându-se. Exemplu pentru n==14 și m==3: 0 1 2 3 0 1 2 3 0 1 2 3 0 1

*/

#include <stdio.h>

int main(void)
{
    int n = 0, m = 0, index = 0;
    scanf("%d%d", &n, &m);

    for(int i = 1; i <= n; i++)
    {
        printf("%d ", index++);
        index %= (m+1);
    }

    return 0;
}

/*

#include <stdio.h>

int main() {
    int n,m,c;
    printf("Introdu m>0,n>0 si n>m:\n");
    scanf("%d %d",&m,&n);
    for(int i=0;i<n;i++)
    {
        if(i<=m)
        {
            printf("%d",i);
        }
        else
        {
         c=i%(m+1);
         printf("%d",c);
        }
    }
    
    return 0;
}

/*