#include <stdio.h>
#include <stdlib.h>

double f(double x){
    return x*x;
}

double g(double x){
    return (x*x)/2;
}
// double (*f)(double);
// un pointer la o functie care primeste double si returneaza double
void printValues(int a, 
                int b, 
                double pas, 
                double (*f)(double))
{
    for(double x=a; x<=b; x=x+pas){
        printf("%lf %lf\n", x, f(x));
    }
    printf("\n");
}


void printTab(const int v[], int n){
    for (int i=0; i<n; i++){
        printf("%d ", v[i]);
    }
    putchar('\n');
}

int intCmp(const void* el1, const void* el2){
    const int a=*(const int*)el1;
    const int b=*(const int*)el2;
    
    return -(a-b);
}

int main(){

    // int v[]={3,1,4,5,-3,6,2,1,5};
    // int n=sizeof(v)/sizeof(v[0]);

    // printTab(v, n);
    // qsort(v, n, sizeof(v[0]), intCmp);
    // printTab(v, n);

    // printValues(1, 5, 0.1, f);
    // printValues(1, 5, 0.1, g);

    double (*pfd)(double)=f;
    printf("Rez este %lf\n", (*pfd)(100));

    printf("%p\n", f);

    return 0;
}