// Să se citească de la tastatură un număr n<=5 iar apoi
// n valori de tip intreg. Să se afișeze toate valorile ale căror modul
// (valoare absolută) este strict mai mare decat 10.

#include <stdint.h>
#include <stdio.h>
#include <math.h>

void read_array(int *array, unsigned int *size)
{
    for(unsigned int i = 0; i < *size; i++)
    {
        if(scanf("%d", &array[i]) != 1)
        {
            *size = i;
            break;
        }
    }
}

void print_array(int *array, unsigned int size)
{
    for(unsigned int i = 0; i < size; i++)
        printf("%d ", array[i]);
    printf("\n");
}

void show_abs_greater_10(int *array, unsigned int size)
{
    for(unsigned int i = 0; i < size; i++)
        if(abs(array[i]) > 10)
            printf("%d ", array[i]);
    printf("\n");
}

int main(void)
{
    unsigned int size = 0;
    scanf("%u", &size);
    int array[size];

    read_array(array, &size);
    print_array(array, size);

    return 0;
}

/*

#include <stdio.h>
#include <stdlib.h>

#define MAX 20

void read_array(int *v, int n)
{
    for(int i = 0 ; i < n; i++)
    {
        scanf("%d", & v[i]);
    }
}

void modul(int *v, int size)
{
    for (int i = 0; i < size; i++)
    {
        if(abs(v[i]) > 10)
        {
            printf("%d ",v[i]);
        }
    }
}


int main(void) {
    int v[MAX],n;

    printf("Introduceti numarul de elemente din v: \n");
    scanf("%d", &n);

    if (n <= 0 || n > 5) {
        printf("n trebuie sa fie intre 1 si 5. Iesire din program.\n");
        exit(EXIT_FAILURE);
    }

    printf("Introduceti %d numere pentru vector : \n", n);
    read_array(v,n);

    printf("Valorile ale caror modul este strict mai mare decat 10 sunt:\n");
    modul(v,n);


    return 0;
}

*/