/*
2. Să se scrie o funcție care returnează maximul dintre 3 valori de tip întreg, primite ca parametri. Funcția nu va folosi nici o variabilă, cu
excepția parametrilor săi. Se va testa funcția cu valori introduse de la tastatură. Citirea de la tastatura se va face în funcția main.
*/

#include <stdio.h>

int maxim(int a, int b, int c)
{
    if (a >= b && a >= c)
        return a;
    else if (b >= a && b >= c)
        return b;
    else
        return c;
}

int main(void)
{
    int a = 0, b = 0, c = 0;
    scanf("%d%d%d", &a, &b, &c);
    printf("%d", maxim(a, b, c));
    
    return 0;
}