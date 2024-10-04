// Scrieți o funcție recursivă care returnează numărul primit ca și parametru, interpretat în baza 16 rezultat din cifrele numărului respectiv.
// De exemplu f(312) = 3*256+1*16+2*1=786

#include <stdio.h>

int hexa(int n)
{
    if(n < 16)
    {
        return n;
    }
    
    int uc = n % 16;
    int farauc = n /16;
    
    return 16 * hexa(farauc) + uc;
}

int main() {
    int n;
    
    printf("Introduceti un numar natural:");
    scanf("%x", &n);
    
    int rez = hexa(n);
    
    printf("Numarul este %d",rez);
    
    return 0;
}