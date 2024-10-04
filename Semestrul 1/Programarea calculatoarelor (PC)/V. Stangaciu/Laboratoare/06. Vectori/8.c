// Se citește un număr n<=10 și apoi n numere întregi.
// Se cere să se șteargă din vector toate acele elemente care sunt urmate de un
// număr strict mai mare decât ele, păstrându-se ordinea elementelor

#include <stdint.h>
#include <stdio.h>

void read_array(int *array, int size)
{
    for(int i = 0; i < size; i++)
        scanf("%d", &array[i]);
}

void print_array(int *array, int size)
{
    for(int i = 0; i < size; i++)
        printf("%d ", array[i]);
    printf("\n");
}

void remove_element(int *array, int *size, int position)
{
    for(int i = position; i < (*size) - 1; i++)
        array[i] = array[i + 1];

    (*size)--;
}

void remove_bigger(int *array, int *size)
{
    for(int i = 0; i < *size - 2; i++)
        if(array[i] < array[i + 1])
        {
            remove_element(array, size, i + 1);
            i--;
            print_array(array, *size);
        }
}

int main(void)
{
    int size = 0;
    scanf("%d", &size);
    int array[size];

    read_array(array, size);
    print_array(array, size);

    remove_bigger(array, &size);
    print_array(array, size);
    return 0;
}

/*
#include <stdio.h>
#include <stdlib.h>

#define MAX 10

void read_array(int *v, int n)
{
    for(int i = 0 ; i < n; i++)
    {
        scanf("%d", & v[i]);
    }
}


void print(int *v, int size)
{
    for (int i = 0; i < size; i++) {
        printf("%d ", v[i]);
    }
    printf("\n");
}

int main(void) {
    int v[MAX],n;

    printf("Introduceti numarul de elemente din v: \n");
    scanf("%d", &n);

    if (n <= 0 || n > 10) {
        printf("n trebuie sa fie intre 1 si 10. Iesire din program.\n");
        exit(EXIT_FAILURE);
    }

    printf("Introduceti %d numere pentru vector : \n", n);
    read_array(v,n);

    for (int i = n-2; i >= 0 ; i--)
    {
        if(v[i] < v[i+1])
        {
            for(int j = i; j < n-1; j++)
            {
                v[j] = v[j+1];
            }

            n--;
        }
    }

    printf("Elementele noului vector sunt : ");
    print(v,n);

    return 0;
}
*/