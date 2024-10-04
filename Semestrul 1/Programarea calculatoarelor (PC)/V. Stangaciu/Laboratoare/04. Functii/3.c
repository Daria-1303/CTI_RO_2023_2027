// Să se scrie o funcție care primește ca parametru o cifră și afișează cifra astfel: dacă este în intervalul [0,9] o afișează direct, altfel afișează A pentru 10, B pentru 11, ... până la 15 inclusiv.
#include <stdio.h>

void hex_cifra(int cif)
{
    if (cif <= 9)
        printf("%d\n", cif);
    else if (cif <= 15)
        printf("%c\n", cif - 10 + 'A');
    else
        printf("In afara domeniului!\n");
}

int main(void)
{
    int cif = 0;
    scanf("%d", &cif);
    hex_cifra(cif);

    return 0;
}

/* sau mai primitiv

#include <stdio.h>

void afisare(int x)
{
    if((x >= 0) && (x <= 9))
    {
        printf("%d",x);
    }
    else if(x == 10)
    {
        printf("A");
    }
    else if(x == 11)
    {
        printf("B");
    }
    else if(x == 12)
    {
        printf("C");
    }
    else if(x == 13)
    {
        printf("D");
    }
    else if(x == 14)
    {
        printf("E");
    }
    else if(x == 15)
    {
        printf("F");
    }
    else
    {
        printf("Nu stiu ce sa fac");
    }
}

int main(void)
{
    int cif;
    
    printf("Introdu o cifra <=15\n");
    scanf("%d",&cif);
    
    afisare(cif);
    return 0;
}
*/