// Se citește un număr n<=10 și apoi n numere pozitive.
// Se cere să se insereze înainte de fiecare valoare impară din vectorul original valoarea 0.

#include <stdint.h>
#include <stdio.h>

void read_array(int *array, unsigned int size)
{
    for(unsigned int i = 0; i < size; i++)
        scanf("%d", &array[i]);
}

void print_array(int *array, unsigned int size)
{
    for(unsigned int i = 0; i < size; i++)
        printf("%d ", array[i]);

    printf("\n");
}

void free_at(int *array, unsigned int *size, int position)
{
    
    for(int i = *size - 1; i >= position; i--)
        array[i + 1] = array[i];

    (*size)++;
}

void insert(int *array, unsigned int *size)
{
    for(int i = 0; i < *size; i++)
        if(array[i] % 2)
        {
            free_at(array, size, i);
            array[i] = 0;
            i++;
        }         
}

int main(void)
{
    unsigned int size = 0;
    scanf("%u", &size);
    int array[2 * size];

    read_array(array, size);
    print_array(array, size);

    insert(array, &size);
    printf("%u\n", size);
    print_array(array, size);

    return 0;
}

/*

#include <stdio.h>
#include <stdlib.h>

#define MAX 11

void read_array(int *v, int n)
{
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &v[i]);
    }
}

void print(int *v, int size)
{
    for (int i = 0; i < size; i++) {
        printf("%d ", v[i]);
    }
    printf("\n");
}

void insert_zeros(int *v, int *size)
{
    int original_size = *size;
    for (int i = 0; i <= original_size; i++)
    {
        if (v[i] % 2 == 1)
        {
            for (int j = *size; j > i; j--)
            {
                v[j] = v[j - 1];
            }

            v[i] = 0;
            (*size)++;
            i++;
        }
    }
}

int main(void) {
    int v[MAX], n;

    printf("Introduceti numarul de elemente din v: \n");
    scanf("%d", &n);

    if (n <= 0 || n > 10) {
        printf("n trebuie sa fie intre 1 si 10. Iesire din program.\n");
        exit(EXIT_FAILURE);
    }

    printf("Introduceti %d numere pozitive:\n", n);
    read_array(v, n);

    insert_zeros(v, &n);

    printf("Vectorul cu 0-uri inserate inaintea valorilor impare:\n");
    print(v, n);

    return 0;
}
*/