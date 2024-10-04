#include <stdio.h>

void afisare(int n)
{
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            if(i==1||i==n||j==1||j==n)
            {
                printf("* ");
            }
            else
            {
                printf("  ");
            }
        }
        printf("\n");
    }
}

int main() {
    int n;
    
    printf("Introdu numar > 1:\n");
    scanf("%d",&n);
    
    afisare(n);
    
    return 0;
}
