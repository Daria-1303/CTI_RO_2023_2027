/*8. Se cere un an n. Să se afișeze dacă anul este sau nu bisect. Anii bisecți se calculează pe baza următorului algoritm: fiecare an care se divide la 4 este un an bisect, exceptând anii care se divid la 100 și nu se divid la 400. De exemplu, anii 1600 și 1200 sunt ani bisecți, dar anii 1700, 1800 și 1900 nu sunt bisecți.*/

#include <stdio.h>

int main()
{
    int n;
    printf("Introdu an:\n");
    scanf("%d",&n);
    if(n%400==0||n%4==0 && n%100!=0)
    {
        printf("an bisect");
    }
    else
    {
        printf("nu e an bisect");
    }
    return 0;
}