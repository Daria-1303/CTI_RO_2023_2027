// Se citește un număr k.
// Să se afișeze dacă în vectorul {7, -5, 4, 3, -9, 2, -8}
// există cel puțin un număr mai mare decat k.

#include <stdio.h>
#include <stdint.h>

uint8_t check_bigger(int8_t *array, uint8_t size, int8_t k)
{
    for(uint8_t i = 0; i < size; i++)
        if(k < array[i])
            return 1;
    return 0;
}

int main(void)
{
    int8_t k = 0;
    scanf("%hhd", &k);

    if(k < -129 || k > 128)
        return -1;

    int8_t array[] = {7, -5, 4, 3, -9, 2, -8};
    uint8_t size = sizeof(array) / sizeof(array[0]);

    printf("%hhu\n", check_bigger(array, size, k));

    return 0;
}
