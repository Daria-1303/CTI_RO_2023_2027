#include <stdio.h>


void afisare(int a[], int n){
   for(int i =0 ; i <= n-1; i++)
      for(int j=i+1; j<n;j++){
         for(int k=j+1 ; k<n; k++) 
         printf("%d",a[k]);
      printf("\n");
      }
}


int main() {
   int a[] = {3,1,4,5,1,6,7,9,0};
   afisare(a,9);
}