//8. Se citeste un numar natural n > 0. Sa se afiseze suma cifrelor numarului sub forma cifra_1+cifra_2+....+cifra_n = S


#include <stdio.h>

int main() {
    int n,suma=0;
    printf("Introduceti un numar natural>0:\n");
    scanf("%d",&n);
    printf("%d",n%10);
    suma=n%10;
    n=n/10;
    while(n>0)
    {
        printf("+%d",n%10);
        suma=suma+n%10;
        n=n/10;
    }
    printf("=%d",suma);
    return 0;
}
