// Se citește un număr n<=10 și apoi n numere întregi.
// Se cere să se insereze după fiecare valoare din vectorul original pătratul ei.

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

void insert(int *array, unsigned int size)
{
    int original_size = size / 2;

    for(int i = original_size - 1, j = size - 2; i >= 0; i--, j -= 2)
    {
        array[j] = array[i];
        array[j + 1] = array[i] * array[i];
    }
}

int main(void)
{
    unsigned int size = 0;
    scanf("%u", &size);
    int array[2 * size];

    read_array(array, size);
    print_array(array, size);

    size *= 2;
    insert(array, size);
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

void inserare(int *v, int *u, int n)
{
    for (int i = 0; i < n; i++)
    {
        u[i * 2] = v[i];
        u[i * 2 + 1] = v[i] * v[i];
    }
}
int main(void) {
    int v[MAX], u[MAX * 2], n;

    printf("Introduceti numarul de elemente din v: \n");
    scanf("%d", &n);

    if (n <= 0 || n > 10) {
        printf("n trebuie sa fie intre 1 si 10. Iesire din program.\n");
        exit(EXIT_FAILURE);
    }

    printf("Introduceti %d numere:\n", n);
    read_array(v, n);

    inserare(v, u, n);

    printf("Vectorul cu patratele inserate:\n");
    print(u , n * 2);

    return 0;
}

*/