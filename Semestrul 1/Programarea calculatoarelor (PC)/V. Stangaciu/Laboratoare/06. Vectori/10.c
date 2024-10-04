// Se citește un număr n<=10 și apoi n numere întregi, inclusiv negative.
// Se cere să se sorteze aceste numere astfel încât numerele pozitive să fie înaintea celorlalte numere.

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

void sort(int *array, unsigned int size)
{
    uint8_t ok = 0;
    int aux = 0;
    unsigned int i = 0;
    do
    {
        ok = 0;
        for(i = 0; i < size - 1; i++)
        {
            if(array[i] < 0 && array[i + 1] >= 0)
            {
                aux = array[i];
                array[i] = array[i + 1];
                array[i + 1] = aux;
                ok = 1;
            }
        }

    } while (ok);
    
}

int main(void)
{
    unsigned int size = 0;
    scanf("%u", &size);
    int array[size];

    read_array(array, size);
    print_array(array, size);

    sort(array, size);
    print_array(array, size);

    return 0;
}