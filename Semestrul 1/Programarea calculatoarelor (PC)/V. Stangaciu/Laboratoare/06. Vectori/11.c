// Se citește un număr n<=10 și apoi n numere întregi.
// Se cere să se șteargă toate duplicatele (ori de câte ori apar acestea) din vector,
// păstrându-se ordinea elementelor.

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

void remove_element(int *array, unsigned int *size, unsigned int position)
{
    for(unsigned int i = position; i < (*size) - 1; i++)
        array[i] = array[i + 1];

    (*size)--;
}

void remove_duplicates(int *array, unsigned int *size)
{
    for(int i = 0; i < *size; i++)
    {
        for(int j = i + 1; j < *size; j++)
            if(array[i] == array[j])
            {
                remove_element(array, size, j);
                i--;
            }  
    }
}

int main(void)
{
    unsigned int size = 0;
    scanf("%u", &size);
    int array[size];

    read_array(array, size);
    print_array(array, size);

    remove_duplicates(array, &size);
    print_array(array, size);

    return 0;
}

/*

#include <stdio.h>
#include <stdlib.h>

#define MAX 10

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

int duplicata(int *u, int n, int x)
{
    for (int i = 0; i < n; i++)
    {
        if(u[i] == x)
        {
            return 1;
        }
    }
    return 0;
}

void sterge_duplicata(int *v, int *n)
{
    int u[MAX];
    int size = 0;

    for (int i = 0; i < *n; i++)
    {
        if(!duplicata(u,size,v[i]))
        {
            u[size] = v[i];
            size++;
        }
    }

    for (int i = 0; i < size; i++)
    {
        v[i] = u[i];
    }

    *n = size;
}

int main(void) {
    int v[MAX], n;

    printf("Introduceti numarul de elemente din v: \n");
    scanf("%d", &n);

    if (n <= 0 || n > 10) {
        printf("n trebuie sa fie intre 1 si 10. Iesire din program.\n");
        exit(EXIT_FAILURE);
    }

    printf("Introduceti %d numere:\n", n);
    read_array(v, n);

    sterge_duplicata(v, &n);

    printf("Vectorul fara duplicate:\n");
    print(v, n);

    return 0;
}

*/