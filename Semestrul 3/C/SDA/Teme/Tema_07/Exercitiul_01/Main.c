#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int cautareLiniara(int v[], int size, int elementCautat) {
	for (int i = 0; i < size; i++) {
		if (v[i] == elementCautat) {
			return i;
		}
	}

	return -1;
}

int cautareBinara(int v[], int size, int elementCautat) {
	int stanga = 0;
	int dreapta = size - 1;

	while (stanga <= dreapta) {
		int mijloc = (stanga + dreapta) / 2;

		if (v[mijloc] == elementCautat) {
			return mijloc;
		}

		if (v[mijloc] < elementCautat) {
			stanga = mijloc + 1;
		}
		else {
			dreapta = mijloc - 1;
		}
	}

	return -1;
}

int main(void) {
	int N[] = { 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000 };
	int nrTeste = sizeof(N) / sizeof(N[0]);

	

	printf("Dimensiunea vectorului\t Cautare liniara\t Cautare binara\n");
	printf("----------------------------------------------------------------\n");

	for (int i = 0; i < nrTeste; i++) {
		int dimensiuneVector = N[i];

		int elementCautat = dimensiuneVector - 1;

		int* v = (int*)malloc(dimensiuneVector * sizeof(int));

		//ii dam direct valori ordonate
		for (int j = 0; j < dimensiuneVector; j++) {
			v[j] = j;
		}

		int idx;

		clock_t start = clock();
		idx = cautareLiniara(v, dimensiuneVector, elementCautat);
		clock_t stop = clock();

		//printf("Elementul %d a fost gasit pe pozitia %d\n", v[idx], idx);

		double timpLiniar = (double)(stop - start) / CLK_TCK;

		start = clock();
		idx = cautareBinara(v, dimensiuneVector, elementCautat);
		stop = clock();

		//printf("Elementul %d a fost gasit pe pozitia %d\n", v[idx], idx);

		double timpBinar = (double)(stop - start) / CLOCKS_PER_SEC * 1000;

		printf("%10d\t\t %10.4f ms\t %10.4f ms\n", dimensiuneVector, timpLiniar, timpBinar);


		free(v);
	}

	//doar timp pt toate cautarile liniare

	printf("\n\n\n");

	clock_t start = clock();

	for (int i = 0; i < nrTeste; i++) {
		int dimensiuneVector = N[i];

		int elementCautat = dimensiuneVector - 1;

		int* v = (int*)malloc(dimensiuneVector * sizeof(int));

		//ii dam direct valori ordonate
		for (int j = 0; j < dimensiuneVector; j++) {
			v[j] = j;
		}

		int idx;

		
		idx = cautareLiniara(v, dimensiuneVector, elementCautat);
		
		//printf("Elementul %d a fost gasit pe pozitia %d\n", v[idx], idx);

		free(v);
	}

	clock_t stop = clock();
	double timpLiniar = (double)(stop - start) / CLK_TCK;

	printf("Cautare liniara  - > %10.4f ms\n", timpLiniar);


	//doar timp pt toate cautarile binare

	printf("\n\n\n");

	start = clock();

	for (int i = 0; i < nrTeste; i++) {
		int dimensiuneVector = N[i];

		int elementCautat = dimensiuneVector - 1;

		int* v = (int*)malloc(dimensiuneVector * sizeof(int));

		//ii dam direct valori ordonate
		for (int j = 0; j < dimensiuneVector; j++) {
			v[j] = j;
		}

		int idx;


		idx = cautareBinara(v, dimensiuneVector, elementCautat);

		//printf("Elementul %d a fost gasit pe pozitia %d\n", v[idx], idx);

		free(v);
	}

	stop = clock();
	double timpBinar = (double)(stop - start) / CLK_TCK;

	printf("Cautare binara  - > %10.4f ms\n", timpBinar);

	return 0;
}