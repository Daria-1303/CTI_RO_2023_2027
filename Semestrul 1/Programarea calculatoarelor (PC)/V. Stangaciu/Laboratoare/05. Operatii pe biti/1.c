#include <stdio.h>

int LSB_position(unsigned int num)
{
    if(num == 0)
        return -1;
        
    unsigned int position = 0;
    while((num & (1 << position)) == 0)
        position++;

    return position;
}

int MSB_position(unsigned int num)
{
    if(num == 0)
        return -1;

    unsigned int SIZE = sizeof(num) * 8 - 1;
    unsigned int mask = 1 << SIZE;
    unsigned int position = 0;
    while((num & (mask >> position)) == 0)
        position++;

    return SIZE - position;
}

int main(void)
{
    unsigned int num = 0;
    printf("Enter a number: ");
    scanf("%u", &num);

    printf("The position of the least significant bit is %d\n", LSB_position(num));
    printf("The position of the most significant bit is %d\n", MSB_position(num));
    return 0;
}