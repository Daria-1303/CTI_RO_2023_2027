/*
1. Se citește un număr întreg n>10. Să se afișeze toată seria de numere începând cu n, următorul număr fiind obținut prin scăderea din cel anterior a n/10, atâta timp cât n>10
*/

#include <stdio.h>

int main()
{
    int n;
    printf("Introdu numar>10:\n");
    scanf("%d",&n);
    while(n>10)
    {
        printf("%d",n);
        n=n-n/10;
    }
    
    return 0;
}