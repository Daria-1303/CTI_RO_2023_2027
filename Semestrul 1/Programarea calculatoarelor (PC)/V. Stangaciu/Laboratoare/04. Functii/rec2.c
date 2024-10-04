// Scrieți o funcție recursivă care returnează cea mai semnificativă cifră a unui număr natural scris în baza 10.

#include <stdio.h>

int msb(int n)
{
    if(n < 10)
    {
        return n;
    }
    else 
    {
        return msb(n/10);
    }
}

int main() {
    int n;
    
    printf("Introduceti un numar natural:");
    scanf("%d", &n);
    
    int rez=msb(n);
    
    printf("Cea mai semnificativa cifra a numarului este: %d", rez);

    return 0;
}