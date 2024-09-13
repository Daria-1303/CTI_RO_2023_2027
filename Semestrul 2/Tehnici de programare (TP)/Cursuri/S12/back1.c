#include <stdio.h>
#include <stdlib.h>
#define N 4
#define ST_SZ 100
#define DEBUG 0

int st[ST_SZ]={0};

int valid(int st[], int k){
    for (int i=1; i<k; i++){
        if (st[i]==st[k]){
            return 0;
        }
    }
    return 1;
}

int solutie(int st[], int k, int n){
    return (k==n);
}

void tipar(int st[], int k){
    for (int i=1; i<=k; i++){
        printf("%d ", st[i]);
    }
    printf("\n");
}

void back(int k, int n){
#if DEBUG==1
    printf("K= %d\n", k);
    tipar(st, k);
#endif
    for (int i=1; i<=n; i++){
        st[k]=i;
        if (valid(st, k)){
            if (solutie(st, k, n)){
                tipar(st, k);
            }
            else{
                back(k+1, n);
            }
        }
    }

}

int main(int argc, char* argv[]){

    if (argc!=2){
        printf("Parametru este numarul de elemente de permutat");
        return -1;
    }

    int n=atoi(argv[1]);
#if DEBUG==1
    printf("N= %d\n", n);
#endif   
    back(1, n);

    return 0;
}