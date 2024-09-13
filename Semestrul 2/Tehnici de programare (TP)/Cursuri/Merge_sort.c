#include <stdio.h>
#include <string.h>

void printTab(int t[], int n){
    for (int i=0; i<n; i++){
        printf("%d ", t[i]);
    }
    printf("\n");
}

void mergeSort(int v[], int stg, int dr){
    printf("Stg= %d Dr= %d ", stg, dr);
    if (stg==dr){
        ;
    }
    else{
        int mij=(stg+dr)/2;
        mergeSort(v, stg, mij);
        mergeSort(v, mij+1, dr);
        int aux[dr-stg+100];
        memset(aux, 0, dr-stg+100);
        int k=0;
        int i=stg;
        int j=mij+1;
        while (i<=mij && j<=dr){    //cat timp nu am ajuns la capatul niciunuia dintre vectori
            if (v[i]<v[j]){         //verificam care este elemuntul mai mic si il copiem in aux
                aux[k]=v[i];
                i++;
                k++;
            }
            else{
                aux[k]=v[j];
                j++;
                k++;
            }
        }
        while (i<=mij){             //copiem elementele de la capatulul unuia dintre vecotri
            aux[k]=v[i];
            k++;
            i++;
        }
        while (j<=dr){              //sau de la capatulc eluluilat
            aux[k]=v[j];
            k++;
            j++;
        }
        for (int i=0; i<k; i++){
            v[stg+i]=aux[i];
        }
        printTab(v, 9);
    }
}


void hanoi(int n, char src, char dest, char aux){
    if (n==1){
        printf("%c --> %c\n", src, dest);
    }
    else{
        hanoi(n-1, src, aux, dest);
        printf("%c --> %c\n", src, dest);
        hanoi(n-1, aux, dest, src);
    }
}

int main(){

    hanoi(32, 'A', 'B', 'X');

    return 0;

    int v[]={2,4,3,6,1,7,8,9,5};
    int n=sizeof(v)/sizeof(v[0]);

    printTab(v, n);

    mergeSort(v, 0, n-1);

    printTab(v, n);


    return 0;
}