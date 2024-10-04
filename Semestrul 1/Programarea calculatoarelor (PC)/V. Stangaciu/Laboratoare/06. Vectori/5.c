// Se citesc 2 numere x și y cu x<y. Să se afișeze minimul elementelor din vectorul
// {7, -5, 4, 3, -9, 2, -8}, care se află în același timp și în intervalul [x,y].

#include <stdio.h>
#include <stdint.h>

int8_t check_bigger(int8_t *array, uint8_t size, int8_t x, int8_t y)
{
    int8_t min = 0, found = 0, index = 0;
    while(!found)
    { 
        if(array[index] >= x && array[index] <= y)
        {
            min = array[index];
            found++;
        }
        index++;
    }


    if(!found)
    {
        printf("No element found!\n");
        exit(1);
    }


    while(index < size)
    {
        if(min > array[index] && array[index] >= x && array[index] <= y)
            min = array[index];
        index++;
    }
    
    return min;
}

int main(void)
{
    int8_t x = 0, y = 0;
    scanf("%hhd %hhd", &x, &y);

    if(x >= y)
        return -1;

    int8_t array[] = {7, -5, 4, 3, -9, 2, -8};
    uint8_t size = sizeof(array) / sizeof(array[0]);

    if(check_bigger(array, size, x, y) == (int8_t *)NULL)
        printf("No element found!\n");
    else
        printf("%hhd\n", check_bigger(array, size, x, y));

    return 0;
}


/*

#include <stdio.h>

#define MAX 20

void formare_vector_interval(int *v, int *u, int x, int y, int size)
{
    for (int i = 0; i < size; i++)
    {
        if (x <= v[i] && v[i] <= y)
        {
            u[i] = (int) v[i];
        }
        else
        {
            u[i] = 0;
        }
    }
}

void print(int *v, int size)
{
    for (int i = 0; i < size; i++) {
        printf("%d ", v[i]);
    }
    printf("\n");
}

int minim(int *v, int size)
{
    int minim = 99999;

    for (int i = 0; i < size; i++)
    {
        if(v[i] != 0 && v[i] < minim)
        {
            minim = v[i];
        }
    }

    return minim;
}


int main(void) {
    int v[] = {7, -5, 4, 3, -9, 2, -8};
    int u[MAX], x, y;

    printf("Introduceti 2 numere de la tastatura: \n");
    scanf("%d %d", &x, &y);

    if (x > y)
    {
        int aux = x;
        x = y;
        y = aux;
    }

    formare_vector_interval(v, u, x, y, 7);

    printf("Elementele vectorului dupa formare vor fi: \n");
    print(u,7);
    printf("\n");

    int minimul = minim(u,7);

    printf("Minimul elementelor din vectorul dat care se afla in intervalul [%d,%d] este: %d \n ",x, y, minimul);
    return 0;
}

*/
