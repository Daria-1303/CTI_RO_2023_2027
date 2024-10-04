#include <stdio.h>

int suma(int n)
{
    int s = 0;
    
    while(n > 0)
    {
        s = s + n;
        n = n - 1;
    }
    
    return s;
}

void afisare(int n)
{
    int i=1;
    while(i < n)
    {
        printf("%d+", i);
        i = i + 1;
    }
}

int main() {
    int s=0,n;
    
    printf("Introdu numar > 1:\n");
    scanf("%d",&n);
    
    s=suma(n);
    
    afisare(n);
    printf("%d=%d",n,s);
    
    return 0;
}
