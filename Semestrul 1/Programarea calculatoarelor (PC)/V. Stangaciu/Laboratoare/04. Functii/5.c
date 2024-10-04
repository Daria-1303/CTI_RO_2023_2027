// Scrieți o funcție care primește 3 parametri de tip float și îi afișează în ordine descrescătoare.

#include <stdio.h>

void print3(float a, float b, float c)
{
    printf("%f >= %f >= %f\n", a, b, c);
}

void sort3(float a, float b, float c)
{
    if(a >= b && a >= c)
    {
        if(b >= c)
            print3(a, b, c);
        else
            print3(a, c, b);
    }
    else if(b >= a && b >= c)
    {
        if(a >= c)
            print3(b, a, c);
        else
            print3(b, c, a);
    }
    else
    {
        if(a >= b)
            print3(c, a, b);
        else
            print3(c, b, a);
    }
}

int main(void)
{
    float a = 0, b = 0, c = 0;
    scanf("%f%f%f", &a, &b, &c);
    sort3(a, b, c);
}

/*

#include <stdio.h>

void ordine_descrescatoare(float a, float b, float c) {
    if ((a >= b) && (a >= c)) {
        if (b >= c) {
            printf("%.2f, %.2f, %.2f\n", a, b, c);
        } else {
            printf("%.2f, %.2f, %.2f\n", a, c, b);
        }
    } else if ((b >= a) && (b >= c)) {
        if (a >= c) {
            printf("%.2f, %.2f, %.2f\n", b, a, c);
        } else {
            printf("%.2f, %.2f, %.2f\n", b, c, a);
        }
    } else {
        if (a >= b) {
            printf("%.2f, %.2f, %.2f\n", c, a, b);
        } else {
            printf("%.2f, %.2f, %.2f\n", c, b, a);
        }
    }
}

int main() {
    float a,b,c;
    
    printf("Introduceti trei numere float:\n");
    scanf("%f %f %f", &a, &b, &c);
    
    ordine_descrescatoare(a, b, c);
    
    return 0;
}

*/