/*
3. Se citește un număr n>1. Să se afișeze folosind steluțe un pătrat gol, având latura de n steluțe.
*/

#include <stdio.h>

int main(void)
{
    int n = 0;
    scanf("%d", &n);

    for(int i = 1; i <= n; i++)
        printf("*");

    for(int i = 2; i <= n - 1; i++)
    {
        printf("\n*");
        for(int j = 2; j <= n - 1; j++)
            printf(" ");
        printf("*");
    }

    printf("\n");
    for(int i = 1; i <= n; i++)
        printf("*");

    return 0;
}