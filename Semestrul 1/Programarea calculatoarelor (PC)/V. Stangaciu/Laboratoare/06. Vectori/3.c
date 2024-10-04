// Să se citească de la tastatură un număr n<=10 iar apoi
// n valori de tip int. Să se afișeze dacă toate valorile pozitive sunt pare.

#include <stdio.h>
#include <stdint.h>

uint8_t check_poz_pare(int *array, uint8_t size)
{
    for(uint8_t i = 0; i < size; i++)
        if(array[i] >= 0 && array[i] % 2 == 1)
            return 0;
    return 1;
}

void read_array(int *array, uint8_t * size)
{
    for(uint8_t i = 0; i < * size; i++)
        if(scanf("%d", &array[i]) != 1)
        {
            * size = i;
            break;
        }
}

void print_array(int *array, uint8_t size)
{
    for(uint8_t i = 0; i < size; i++)
        printf("%d ", array[i]);
    printf("\n");
}

int main(void)
{
    uint8_t size = 0;

    scanf("%hhu", &size);

    int array[size];

    read_array(array, &size);

    print_array(array, size);

    if(check_poz_pare(array, size))
        printf("Da\n");
    else
        printf("Nu\n");

    return 0;
}

/*

#include <stdio.h>
#include <stdbool.h>

#define MAX 10

void read_array(int *v, int n)
{
    for(int i = 0 ; i < n; i++)
    {
        scanf("%d", & v[i]);
    }
}

int verificare_paritate(int *v, int n)
{
    int ok = 1;

    for (int i = 0; i < n; i++)
    {
        if(v[i] % 2 !=0)
        {
            ok = 0;
            break;
        }
    }

    return ok;
}


int main(void) {
    int v[MAX];
    int n = 0, i;

    printf("Dati un numar de la tastatura: \n");
    scanf("%d", &n);

    if (n == 0){                                           // testeaza daca vectorul este vid
        printf("vectorul este vid \n");
    }
    else if (n > 10)
    {
        printf("Ati introdus un numar prea mare de elemente.\n");
    }
    else
    {
        printf("Introduceti cele %d numere: \n", n);
        read_array(v, n);

        if(verificare_paritate(v,n))
        {
            printf("Toate elementele sunt pare\n");
        }
        else
        {
            printf("Printre numerele citite se afla si numere impare\n");
        }

    }



    return 0;
}

*/