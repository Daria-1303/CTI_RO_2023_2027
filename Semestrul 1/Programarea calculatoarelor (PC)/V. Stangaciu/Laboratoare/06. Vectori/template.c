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

int main(void)
{
    unsigned int size = 0;
    scanf("%u", &size);
    int array[size];

    read_array(array, size);
    print_array(array, size);

    return 0;
}