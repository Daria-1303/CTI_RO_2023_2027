/*
4.Se citește un număr întreg n>2. Să se afișeze folosind steluțe litera N, formată cu laturile și diagonala unui pătrat de latură n.
*/

#include <stdio.h>

int main(void)
{
    int n = 0, diagonal = 1;
    scanf("%d", &n);

    printf("*");
    for(int i = 2; i <= n - 1; i++)
        printf(" ");

    printf("*\n");

    for(int i = 2; i <= n - 1; i++)
    {
        printf("*");
        diagonal++;
        for(int j = 2; j <= n - 1; j++)
            if(j == diagonal)
                printf("*");
            else
                printf(" ");
        printf("*\n");
    }

    printf("*");
    for(int i = 2; i <= n - 1; i++)
        printf(" ");

    printf("*\n");

    return 0;
}