//9.Se citeste un numar natural n > 0. Sa se afiseze suma divizorilor numarului sub forma div_1+div_2+...+div_n = S


#include <stdio.h>

int main() {
    int n,suma=1;
    printf("Introduceti un numar natural>0:\n");
    scanf("%d",&n);
    printf("1");
    for(int i=2;i<=n;i++)
    {
        if(n%i==0)
        {
            printf("+%d",i);
            suma=suma+i;
        }
    }
    printf("=%d",suma);
    return 0;
}