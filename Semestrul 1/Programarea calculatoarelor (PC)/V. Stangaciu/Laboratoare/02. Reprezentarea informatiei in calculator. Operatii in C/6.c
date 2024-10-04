/*
6. Se citesc două numere întregi. Să se afișeze dacă numerele au sau nu același semn. Numărul 0 se consideră pozitiv.
*/

#include <stdio.h>

int main()
{
    int x,y;
    printf("Introdu nr:\n");
    scanf("%d %d",&x,&y);
    if((x<=0&&y<=0)||(x>=0&&y>=0))
    {
        printf("numerele au acelasi semn");
    }
    else
    {
        printf("numerele nu au acelasi semn");
    }
    
    return 0;
}