#include <stdio.h>

void serie(int n)
{
    while(n > 10)
    {
        printf("%d ", n);
        n = n - n/10; 
    }
}

int main() {
    int n;
    
    printf("Introdu numarul:\n");
    scanf("%d",&n);
    
    serie(n);
    
    return 0;
}
