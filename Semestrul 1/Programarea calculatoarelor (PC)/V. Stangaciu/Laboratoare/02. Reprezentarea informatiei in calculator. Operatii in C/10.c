/*
10. Se citesc 3 numere întregi de la tastatură x, y, z. Să se verifice dacă z este în interiorul intervalului [x,y).
*/

#include <stdio.h>

int main()
{
    int x,y,z;
    printf("Introdu numere:\n");
    scanf("%d %d %d",&x,&y,&z);
    if(x<=z&&z<=y)
    {
        printf("face parte din interval");
    }
    else
    {
        printf("nu face parte din interval");
    }
    
    return 0;
}