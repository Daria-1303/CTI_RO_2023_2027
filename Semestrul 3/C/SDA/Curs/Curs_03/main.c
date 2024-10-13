#include <stdio.h>

unsigned long factorial(unsigned int n) {
	if (n == 0) {
		return 1;
	}
	else {
		return n * factorial(n - 1);
	}
}

//Varianta 1
void printAsc(int start, int end)
{
	if (start == end)
		printf("%d", start); //cazul de baza
	else
	{
		printAsc(start, end - 1); //ipoteza/apelul recursivprintf(“%d ”, end);
	}
}

//Varianta 2
void printAsc(int start, int end)
{
	if (start == end)
		printf("%d", end); //cazul de baza
	else
	{
		printf("%d", start);
		printAsc(start + 1, end); //ipoteza/apelul recursiv}
	}
}

//Varianta 3
void printAsc(int start, int end)
{
	if (start == end)
		printf("%d", start); //cazul de baza
	else
	{
		printAsc(start, ((start + end) / 2));
		//ipoteza/apelul recursiv
		printAsc(((start + end) / 2 + 1), end);
	}
}

int main(void) {
	unsigned int n;
	scanf("%u", &n);
	printf("%u\n", factorial(n));

	return 0;
}

//f10 linie cu linie, f5 breakpoint

/*
for(int i = 0; i < n; i++){
	a[i] = i + 1; //avem o(n)
}

for(int i = 0; i < 100; i++){
	a[i] = i + 1; //avem o(1)
}

for(int i = 0; i < n; i++){
	for(j = 0; j < i; j++){
		a[i] = j + 1; //avem o(n^2)
		}
}

*/