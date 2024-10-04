// Dacă numărul p este prim și numărul a nu este divizibil cu p, secvența a, a^2, a^3, .. , a^n devine 1 când este calculată modulo p. Scrieți o funcție care primește p și a, (numerele respectă condiția, nu este nevoie de verificare) și returnează cel mai mic n pentru care șirul devine 1.
// De exemplu pentru p = 7, a = 4 => n = 3    
// sau pentru p = 11, a = 25 => n = 5

#include <stdio.h>
#include <math.h>
int check_modulo_sum(int p, int a)
{
    int n = 1;
    while((int)(pow(a, n)) % p != 1)
        n++;

    return n;
}

int main(void)
{
    int p = 0, a = 0;
    scanf("%d%d", &p, &a);
    printf("%d\n", check_modulo_sum(p, a));

    return 0;
}

/*
#include <stdio.h>

int cmmn(int p, int a)
{
    int cmmn = 1;
    int putere = a;
    
    while(putere != 1)
    {
        putere = (putere * a) % p;
        cmmn = cmmn +1;
    }
    
    return cmmn;
}

int main() {
    int p, a;
    
    printf("Introduceti p si a: ");
    scanf("%d %d", &p, &a);
    
    int n = cmmn(p,a);
    printf("%d",n);
    
    return 0;
}

*/