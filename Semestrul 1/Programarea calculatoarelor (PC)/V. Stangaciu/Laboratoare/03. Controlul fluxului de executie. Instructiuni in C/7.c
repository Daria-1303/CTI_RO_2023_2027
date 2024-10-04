//7.Se citește un număr natural de 3 cifre. Să se determine câte cifre impare conține numărul dat.

#include <stdio.h>

int main() {
    int n,c=0,cifra;
    printf("Introduceti un numar natural de 3 cifre:\n");
    scanf("%d",&n);
    while(n>0)
    {
        if(n%2!=0)
        {
            c=c+1;
        }
        n=n/10;
    }
    printf("Numarul are %d cifre impare",c);
    return 0;
}