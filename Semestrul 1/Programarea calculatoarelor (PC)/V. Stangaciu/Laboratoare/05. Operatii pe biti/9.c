/*
O variabilă de tip char ocupă în memorie 8 biţi. Aceşti 8 biţi pot fi împărţiţi în 2 zone de câte 4 biţi. În fiecare zonă de câte 4 biţi s-ar putea memora câte un număr între 0 şi 15. Scrieţi un program care citeşte două numere între 1 şi 10 şi le memorează (împachetează) în cele două zone de câte 4 biţi ale unei variabile de tip char. După memorare, programul va despacheta valorile memorate şi le va afişa.
*/

#include <stdint.h>
#include <stdio.h>

int main(void)
{
    uint8_t n1 = 0, n2 = 0, ch = 0;

    printf("n1 = ");
    scanf("%hhu", &n1);

    printf("n2 = ");
    scanf("%hhu", &n2);

    ch = (n1 << 4) | n2;

    printf("Caracterul format din numerele %hhu si %hhu este %c", n1, n2, ch);
    
    return 0;
}

/*

#include <stdio.h>
#include <stdint.h>

void showbits(int x){
    uint32_t mask = 1 << (sizeof(x)*8-1);
    for(int i = 0; i < sizeof(x)*8 ; i++){
        if(x&mask){
            printf("1");
        }
        else{
            printf("0");
        }
        if((i+1) % 4 == 0){
            printf(" ");
        }
        mask >>= 1;
    }
    printf("\n");
}

void impachetare(int *x, int *y, char *z){
    *z = 0;          // 0000 0000 
    *z |= *x;       // 0000 0000 | 0000 1010 = 0000 1010
    *z <<= 4;       // 0000 1010 << 4 = 1010 0000
    *z |= *y;      // 1010 0000 | 0000 0101 = 1010 0101
}

void despachetare(int *x, int *y, char *z){
    *x = *z >> 4;    // 1010 0101 >> 4 = 0000 1010
    *y = *z & 15;    // 1010 0101 & 0000 1111 = 0000 0101
}

int main(){
    int x, y;
    char z;
    printf("x = ");
    scanf("%d", &x);

    printf("y = ");
    scanf("%d", &y);

    impachetare(&x, &y, &z);

    printf("z = ");
    showbits(z);

    despachetare(&x, &y, &z);
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    return 0;
}

*/