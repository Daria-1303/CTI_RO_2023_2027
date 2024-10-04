/*
22. Scrieți o funcție similară cu funcțiile realizate la aplicații anterioare în care se primesc ca argumente 8 numere pe 8 biți fără semn (n7, n6, ...
n0) și returnează un numă de 64 de biți fără semn format din cele 8 numere primite ca și argumente în care n7 devine cel mai semnificativ
byte și n0 cel mai puțin semnificativ byte
*/

#include <stdio.h>
#include <stdint.h>
uint64_t concatenare(uint8_t n7, uint8_t n6, uint8_t n5, uint8_t n4, uint8_t n3, uint8_t n2, uint8_t n1, uint8_t n0) {

    uint64_t n = 0;

    n = ((uint64_t)n7 << 56) | ((uint64_t)n6 << 48) | ((uint64_t)n5 << 40) | ((uint64_t)n4 << 32) |
            ((uint64_t)n3 << 24) | ((uint64_t)n2 << 16) | ((uint64_t)n1 << 8) | n0;

   return n;
}

void showbits(int x){
    uint64_t mask = 1 << (sizeof(x)*8-1);
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

int main(void) {
    uint8_t a , b , c , d , e , f, g , h ;

    printf("Introduceti numerele : ");
    scanf("%hhx %hhx %hhx %hhx %hhx %hhx %hhx %hhx", &a , &b , &c , &d , &e , &f, &g , &h);

    printf("a = "); 
    showbits(a);

    printf("b = ");
    showbits(b);

    printf("c = ");
    showbits(c);

    printf("d = ");
    showbits(d);

    printf("e = ");
    showbits(e);

    printf("f = ");
    showbits(f);

    printf("g = ");
    showbits(g);

    printf("h = ");
    showbits(h);



    uint64_t rez = concatenare(a, b, c, d, e, f, g, h);

    printf("%llx\n",rez);

    printf("rez = ");
    showbits(rez);

}

/*
Introduceti numerele :FF
00
AA
55
12
34
67
89
 ff00aa5512346789
*/