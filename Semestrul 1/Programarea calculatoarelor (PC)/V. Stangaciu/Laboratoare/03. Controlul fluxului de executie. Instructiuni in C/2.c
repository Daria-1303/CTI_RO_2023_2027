/*
2.Se citește un număr întreg n>1. Să se afișeze seria ”1+2+3+4+…+n=s”, unde s=suma(1...n).
*/

#include <stdio.h>

int main()
{
    int s=1,n;
    printf("Introdu numar>1:\n");
    scanf("%d",&n);
    while(n>1)
    {
        s=s+n;
        n=n-1;
    }
    printf("%d",s);
    
    return 0;
}

/* alta varianta

#include <stdio.h>

int main(void)
{
    int n = 0;
    scanf("%d", &n);

    for(int i = 1; i <= n; i++)
        printf("%d + ", i);

    printf("\b\b= %d\n", n * (n + 1) / 2);
    return 0;
}

*/