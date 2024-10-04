/*9.De la un magazin se cumpară x kg de mere si y kg de pere, cu x și y valori reale, introduse de la tastatură. Știind că 1kg de mere costă 5 lei și 1kg de pere costă 7 lei, să se verifice dacă suma de 20 de lei ajunge pentru cumpărarea fructelor.*/

#include <stdio.h>

int main()
{
    int x,y;
    printf("Introdu kg:\n");
    scanf("%d %d",&x,&y);
    int suma=5*x+7*y;
    if(suma<=20)
    {
        printf("ajung banii");
    }
    else
    {
        printf("nu ajung banii");
    }
    
    return 0;
}