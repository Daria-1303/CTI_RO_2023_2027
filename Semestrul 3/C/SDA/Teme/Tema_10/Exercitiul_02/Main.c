#include <stdio.h>
#include <time.h>

#define N 10

void initializareVector(int a[]) {
	int folosite[N] = { 0 };

	srand(time(NULL));


	for (int i = 0; i < N; i++) {
		int tmp;

		do {
			tmp = rand() % (N);
		} while (folosite[tmp]);

		a[i] = tmp;
		folosite[tmp] = 1;
	}
}

int rezolva(int a[], int stanga, int dreapta) {
	if (stanga > dreapta) {
		return 0;
	}

	int mijloc = (stanga + dreapta) / 2;

	if (a[mijloc] == mijloc) {
		return 1;
	}

	//stanga
	int rs = rezolva(a, stanga, mijloc - 1);


	//dreapta
	int rd = rezolva(a, mijloc + 1, dreapta);

	return rs || rd;
}

int main(void) {
	int A[N];


	initializareVector(A);

	for (int i = 0; i < N; i++) {
		printf("%d ", i);
	}
	printf("\n");

	for (int i = 0; i < N; i++) {
		printf("%d ", A[i]);
	}

	printf("\n");

	int rezultat = rezolva(A, 0, N - 1);

	if (rezultat) {
		printf("am gasit\n");
	}
	else {
		printf("N am gasit\n");
	}


	return 0;
}