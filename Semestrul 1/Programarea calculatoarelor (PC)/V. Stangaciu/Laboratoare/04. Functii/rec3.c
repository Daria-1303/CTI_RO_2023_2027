// Scrieți o funcție recursivă care primește ca paramteru un număr natural n și returnează numărul format selectând doar cifrele pare ale acelui număr.

#include <stdio.h>

int construieste(int n)
{
    if(n == 0)
    {
        return 0;
    }
    
    int uc = n % 10;
    
    if(uc % 2 == 0)
    {
        return 10 * construieste(n / 10) + uc;
    }
    else return construieste(n / 10);
}

int main() {
    int n;
    
    printf("Introduceti un numar natural:");
    scanf("%d", &n);
    
    int rez = construieste(n);
    
    printf("Numarul construit doar cu cifre pare este %d:",rez);
    
    return 0;
}