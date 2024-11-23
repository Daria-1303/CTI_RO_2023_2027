#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct Persoana {
	char CNP[14];
	int anNastere;
}Persoana_t;

int comparaDupaCNP(const void* a, const void* b) {
	Persoana_t* p1 = (Persoana_t *)(a);
	Persoana_t* p2 = (Persoana_t*)(b);

	return strcmp(p1->CNP, p2->CNP);
}

int comparaDupaAnNastere(const void* a, const void* b) {
	Persoana_t* p1 = (Persoana_t*)(a);
	Persoana_t* p2 = (Persoana_t*)(b);

	if (p1->anNastere < p2->anNastere) {
		return -1;
	}

	if (p1->anNastere > p2->anNastere) {
		return 1;
	}

	return 0;
}

void sortareGenerica(void *vector, size_t dimensiuneElement, int nrElemente, int (*functie)(const void*, const void*)) {
	int schimbare = 0;
	char* a;
	char* b;

	for (int i = 0; i < nrElemente - 1; i++) {
		schimbare = 0;
		for (int j = 0; j < nrElemente - i - 1; j++) {
			a = (char*)vector + j * dimensiuneElement;
			b = (char*)vector + (j + 1) * dimensiuneElement;

			if (functie(a, b) > 0) {
				void* aux = malloc(dimensiuneElement);
				memcpy(aux, a, dimensiuneElement);
				memcpy(a, b, dimensiuneElement);
				memcpy(b, aux, dimensiuneElement);
				free(aux);

				schimbare = 1;
			}
		}

		if (schimbare == 0) {
			break;
		}

	}

}

void afiseazaPersoane(Persoana_t* persoane, int nrElemente) {
	for (int i = 0; i < nrElemente; i++) {
		printf("CNP: %s, An Nastere: %d\n", persoane[i].CNP, persoane[i].anNastere);
	}
}

int main(void) {
	Persoana_t persoane[] = {
		{"1234567890123", 1990},
		{"1234567890120", 1985},
		{"1234567890121", 2000},
		{"1234567890122", 1995}
	};

	int nrElemente = sizeof(persoane) / sizeof(persoane[0]);

	printf("Inainte de sortare dupa CNP:\n");
	afiseazaPersoane(persoane, nrElemente);

	sortareGenerica(persoane, sizeof(Persoana_t), nrElemente, comparaDupaCNP);

	printf("\nDupa sortare dupa CNP:\n");
	afiseazaPersoane(persoane, nrElemente);


	sortareGenerica(persoane, sizeof(Persoana_t), nrElemente, comparaDupaAnNastere);

	printf("\nDupa sortare dupa An de Nastere:\n");
	afiseazaPersoane(persoane, nrElemente);

	return 0;
}