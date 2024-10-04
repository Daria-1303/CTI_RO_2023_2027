// Se citește o valoare. Să se afișeze suma primilor săi 4 biți LSB (cei mai din dreapta)

#include <stdio.h>
#include <stdint.h>

int main(void)
{
    unsigned int num = 0;
    printf("n = ");
    scanf("%u", &num);

    unsigned int sum = 0;

    for(int i = 0; i < 4; i++)
        sum += (num & (1 << i)) != 0;

    printf("Suma primilor 4 biti LSB este: %u\n", sum);
    return 0;
}

/* ceva mai simplu

#include <stdio.h>

int main()
{
    int n, suma = 0;
    printf("n = ");
    scanf("%d", &n);
    for (int i = 0; i < 4; ++i)
    {
        suma += n & 1;    // suma += n % 2;
        n >>= 1;          // n /= 2;
    }

    printf("%d\n", suma);

    return 0;
}

*/