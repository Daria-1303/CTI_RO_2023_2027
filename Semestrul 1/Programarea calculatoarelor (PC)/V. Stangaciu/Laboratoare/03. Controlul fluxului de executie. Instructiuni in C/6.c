/*
6.Să se afișeze tabla înmulțirii pentru toate numerele de la 0 la 10 inclusiv, sub forma: 0*0=0, 0*1=0,..., 0*10=0, 1*0=0, 1*1=1, ... 10*10=100
*/


#include <stdio.h>

int main() {
    int i=0,j=0;
    for(int i=0;i<=10;i++)
    {
        for(j=0;j<=10;j++)
        {
            printf("%d*%d=%d\n",i,j,i*j);
        }
    }
    
    return 0;
}