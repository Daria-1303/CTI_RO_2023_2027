/*Un program care citeste din fisierul file.in
	-un nr N
	-N linii de forma : nume <nr> <nr>
		ex: Alex 3 5
			Andreea 8 17
	-afiseaza N linii avand numele si suma celor doua numere

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
	FILE* fin = NULL;

	if ((fin = fopen("date.in", "r")) == NULL) {
		return 1;
	}

	int N;

	fscanf(fin, "%d", &N);

	printf("%d\n", N);

	for (int i = 0; i < N; i++) {
		int nr1, nr2;

		char nume[20];

		fscanf(fin, "%19s %d %d", nume, &nr1, &nr2);

		int suma = nr1 + nr2;

		printf("%s %d\n", nume, suma);
	}

	return 0;
}