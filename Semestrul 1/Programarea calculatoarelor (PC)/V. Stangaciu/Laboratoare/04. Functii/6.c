// Scrieți o funcție care primește ca parametri trei numere n, b și c, cu c în intervalul [0,b) și returnează de câte ori apare cifra c în numărul n, dacă acesta s-ar afișa în baza b.

#include <stdio.h>

int base_b(int n, int b)
{
    if (n == 0)
        return 0;
    else
        return b * base_b(n / 10, b) + (n % b);
}

int ap_interval(int n, int b, int c)
{
    int nr_ap = 0;
    int num = base_b(n, b);
    while(num)
    {
        if(c == num % 10)
            nr_ap++;
            
        num /= 10;
    }

    return nr_ap;
}

int main(void)
{
    int num = 0, base = 0, cif = 0;
    scanf("%d%d%d", &num, &base, &cif);
    printf("%d", ap_interval(num, base, cif));
	return 0;
}


/*

#include <stdio.h>

int count(int n, int b, int c) {
    int count=0;
    while(n > 0)
    {
        int cifra = n % b;
        if(cifra == c)
        {
            count = count + 1;
        }
        n = n / b;
    }
    
    return count;
}

int main(void) {
    int n,b,c;
    printf("Introduceti un nr n, o baza b si o cifra c care apartine intervalului [0,b]:\n");
    scanf("%d %d %d", &n, &b, &c);
    
    int a = count(n,b,c);
    
    printf("Cifra %d apare de %d ori in numarul %d n din baza %d.", c, a, n, b);
    
    return 0;
}


*/