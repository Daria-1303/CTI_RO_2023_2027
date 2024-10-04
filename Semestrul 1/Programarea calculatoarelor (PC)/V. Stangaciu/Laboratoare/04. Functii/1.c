/*
1. Se cere un număr impar n>4. Să se deseneze cifra „8”, scris ca un pătrat cu o linie orizontală în mijloc, în așa fel încât pe verticală și pe
orizontală să fie câte n steluțe. În program nu vor fi admise duplicări de cod.

*/

#include <stdio.h>

void full_line(int n)
{
    for(int i = 1; i <= n; i++)
        printf("*");
    printf("\n");
}

void empty_line(int n)
{
    printf("*");

    for(int i = 2; i <= n - 1; i++)
        printf(" ");

    printf("*\n");
}

void print8(int n)
{
    full_line(n);
    for(int i = 2; i <= n / 2; i++)
        empty_line(n);
    full_line(n);
    for(int i = 2; i <= n / 2; i++)
        empty_line(n);
    full_line(n);
}

int main(void)
{
    int n = 0;
    scanf("%d", &n);

    print8(n);
    
    return 0;
}

/*

#include <stdio.h>

void liniecompleta(int n)
{
    for(int i=1; i <= n; i++)
    {
        printf("*");
    }
    printf("\n");
}

void liniepartiala(int n)
{
    printf("*");
    
    for(int i=2; i < n; i++)
    {
        printf(" ");
    }
    
    printf("*");
    printf("\n");
}

int main(void) {
    int n;
    scanf("%d",&n);
    
    if(n<4||n%2==0)
    {
        printf("eroare\n");
    }
    else
    {
        for(int i=1; i <= n; i++)
        {
            if(i == 1 || i == n || i == (n/2+1))
            {
                liniecompleta(n);
            }
            else
            {
                liniepartiala(n);
            }
        }
    }

    return 0;
}
*/