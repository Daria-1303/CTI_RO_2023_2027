#include <stdio.h>
#include <ctype.h>

void printReverse(){
    int n;
    scanf("%d", &n);
    printf("%d ", n);
    if (n!=0){
        printReverse();
    }
    
}

// int stackOvr(int n, int pas){
//    // int v[1000]={0};
//     printf("Pas=%d\n", pas);
//     return n+stackOvr(n-1, pas+1);
// }

//

int calcPrefix(){
    //citeste de la intrare o expresie in notatie prefix si returneaza valoarea acesteia; 
    //operanzii sunt valori pe o singura cifra zecimala
    int c=getchar();
    if (isdigit(c)){
        return c-'0';
    }
    else{
        int Es=calcPrefix();
        int Ed=calcPrefix();
        switch(c){
            case '+': return Es+Ed;
            case '-': return Es-Ed;
            case '*': return Es*Ed;
            case '/': return Es/Ed;
            default: return 0;
        }   
    }
}

typedef struct Matrix{
    int a[10][10];
    int nL, nC;
}Matrix_t;

void afisMatr(int a[][10], int nL, int nC){
    for (int i=0; i<nL; i++){
        for (int j=0; j<nC; j++){
            printf("%3d", a[i][j]);
        }
        printf("\n");
    }

}   

void fill(int a[][10], int nL, int nC, int i, int j, int pas){
    afisMatr(a, nL, nC);
    printf("---------------------------\n");
    if (i>=0 && i<nL && j>=0 && j<nC){
        if (a[i][j]==1){    //daca celula este un "uscat"
            a[i][j]=pas;    //marcam ca fiind vizitat
            fill(a, nL, nC, i+1, j, pas+1);    //S
            fill(a, nL, nC, i-1, j, pas+1);    //N
            fill(a, nL, nC, i, j+1, pas+1);    //E
            fill(a, nL, nC, i, j-1, pas+1);    //W

        }
    }
}

int main(){

    //printReverse();
    //stackOvr(10,1);
    //printf("%d\n", calcPrefix());

    int a[][10]={
        {0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,1,0,0,0,0},
        {0,0,0,0,1,1,1,0,0,0},
        {0,0,0,0,0,1,1,0,0,0},
        {0,0,0,0,0,0,0,0,0,0},
        {0,0,1,1,0,0,0,0,0,0},
        {0,0,1,0,0,0,1,1,1,0},
        {0,0,1,1,0,0,0,1,0,0},
        {0,0,0,0,0,0,0,0,0,0}
    };
    int m=10, n=10;

    
    int startLn=2, startCol=5; 

    int idInsula=10;
    for (int i=0; i<m; i++)
        for (int j=0; j<n; j++)
            if (a[i][j]==1){
                    fill(a, m, n, i, j, idInsula);
                    idInsula+=10;
            }

    return 0;
}