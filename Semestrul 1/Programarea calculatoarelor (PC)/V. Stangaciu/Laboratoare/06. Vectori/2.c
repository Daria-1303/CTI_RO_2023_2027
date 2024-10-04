// Să se afișeze minimul elementelor din vectorul {7, -5, 4, 3, -9, 2, -8}.

#include <stdio.h>
#include <stdint.h>

int minim(int *arr, uint8_t size)
{
    int min = arr[0];

    for(uint8_t i = 1; i < size; i++)
        if(min > arr[i])
            min = arr[i];

    return min;
}

int main(void)
{
    int array[] = {7, -5, 4, 3, -9, 2, -8};

    uint8_t size = sizeof(array) / sizeof(array[0]);

    printf("Minimul elementelor din vector este: ");
    printf("%d\n", minim(array, size));

    return 0;
}