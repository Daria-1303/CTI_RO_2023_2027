#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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

void tipar(int st[], int k, char *cuv){
    for (int i=1; i<=k; i++){
        printf("%c", cuv[st[i]-1]);
    }
    printf("\n");
}

void back(int k, int n, char* cuv){
#if DEBUG==1
    printf("K= %d\n", k);
    tipar(st, k);
#endif
    for (int i=1; i<=n; i++){
        st[k]=i;
        if (valid(st, k)){
            if (solutie(st, k, n)){
                tipar(st, k, cuv);
            }
            else{
                back(k+1, n, cuv);
            }
        }
    }

}

int main(int argc, char* argv[]){

    if (argc!=2 ){
        printf("Parametru este cuvantul pentru care generam anagramele");
        return -1;
    }

    char *cuv=strdup(argv[1]);
    int n=strlen(cuv);

#if DEBUG==1
    printf("N= %d\n", n);
#endif   
    back(1, n, cuv);

    return 0;
}