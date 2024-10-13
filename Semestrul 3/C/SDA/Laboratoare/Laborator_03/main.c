#include  "timer.h"
#include <stdio.h>
#include <stdlib.h>


void functie_test()
{
int i,j,k; 
for(i=1;i<=200000;i++) 
	for(j=1;j<=20000;j++) 
		if(i%2)k=i; 
}






void main(void)
{ float timp;
generate_a();
starton(); 
functie_test();
timp=startoff(); 
printf("%f",timp);
} 