#include <stdio.h>

int main()
{
    int a=5,b=1,c;
    scanf("%d %d %d", &a, &b, &c);

    c=--a - --b;
    printf("%d %d %d\n",a,b,c);
    c=--a + b--;
    printf("%d %d %d\n",a,b,c);
    c=a++ - b++;
    printf("%d %d %d\n",a,b,c);
    
    return 0;
}