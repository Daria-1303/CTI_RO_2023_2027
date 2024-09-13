#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define N 4
#define ST_SZ 100
#define DEBUG 0

int st[ST_SZ]={0};

int valid(int st[], int k){
   for(int i=1; i<k; i++){
   	if (st[i]==st[k]){
   		return 0;	
	}
	if (abs(i-k)==abs(st[i]-st[k])){
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

int succesor(int st[], int k, int n){
	//verifica daca pe nivelul curent mai se poate pune o valoare noua si daca da, o pune si returneaza 1
	//iar daca nu se poate pune returneaza 0;
	if (st[k]<n){
		st[k]++;
		return 1;
	}
	return 0;
}

void back(int n){

	int k=1;
	st[k]=0;
	while (k>0){
		
	    if (succesor(st,k, n)){
		
	        if (valid(st, k)){
	            if (solutie(st, k, n)){
	                tipar(st, k);
	            }
	            else{
	               k=k+1;	//trecem pe nivelul urmator;
	               st[k]=0;
	            }
	        }
		}
		else{
			k--;	//cobram pe nivelul anterior si continuam de la ultima valoare atinsa
		}
	}

}

int main(int argc, char* argv[]){

//    if (argc!=2){
//        printf("Parametru este numarul de elemente de permutat");
//        return -1;
//    }
	
    int n=atoi(argv[1]);
    n=5;
#if DEBUG==1
    printf("N= %d\n", n);
#endif   
    back(n);

    return 0;
}
