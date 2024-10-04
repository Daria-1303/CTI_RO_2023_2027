/*7.Se citește un număr natural n. Să se determine cele mai mari două numere impare, mai mici decât n.*/

#include <stdio.h>

int main()
{
    int n,x,y;
    printf("Introdu nr:\n");
    scanf("%d",&n);
    if(n%2==0)
    {
        x=n-1;
        y=n-3;
        printf("%d %d",x,y);
    }
    else
    {
        x=n-2;
        y=n-4;
        printf("%d %d",x,y);
    }
    
    return 0;
}