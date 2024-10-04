/*
3.Se citesc 2 numere reale x, y de la tastatură și ulterior se va afișa meniul de mai jos. După afișarea meniului, se cere un cod de operație și se va afișa rezultatul corespunzător acesteia.
1) Maximul dintre x si y
2) Minimul dintre x si y
3) x
4) y
De exemplu, pentru x = 19.5, y = 23 și codul 2, se va afișa minimul dintre x și y care este 19.5
*/

#include <stdio.h>

int main()
{
    float x = 0, y = 0;
    scanf("%f%f", &x, &y);

    printf("1) Maximul dintre x si y\n");
    printf("2) Minimul dintre x si y\n");
    printf("3) x\n");
    printf("4) y\n\n");

    int opt = 0;
    scanf("%d", &opt);
    switch (opt)
    {
    case 1:
        if (x > y)
            printf("Maximul este %f\n", x);
        else
            printf("Maximul este %f\n", y);
        break;
    
    case 2:
        if (x < y)
            printf("Minimul este %f\n", x);
        else
            printf("Minimul este %f\n", y);
        break;

    case 3:
        printf("x = %f\n", x);
        break;
    
    case 4:
        printf("y = %f\n", y);
        break;

    default:
        break;
    }
    
    return 0;
}