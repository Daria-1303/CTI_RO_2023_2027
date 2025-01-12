#include <stdio.h>
#include <stdlib.h>

typedef struct Nod {
	int valoare;
	struct Nod* nextNode;
}Nod_t;

Nod_t* creareNod(int valoare) {
	Nod_t* nodCreat = (Nod_t*)malloc(sizeof(Nod_t));

	if (!nodCreat) {
		printf("eroare memorie\n");
		exit(-1);
	}

	nodCreat->valoare = valoare;
	nodCreat->nextNode = NULL;

	return nodCreat;
}

void adaugaNod(Nod_t** lista, int valoare) {
	Nod_t* nodAdaugat = creareNod(valoare);

	nodAdaugat->nextNode = *lista;
	*lista = nodAdaugat;
}

void afisareLista(Nod_t* capLista) {
	if (!capLista) {
		printf("Lista goala\n");
		return;
	}

	Nod_t* nodCurent = capLista;

	while (nodCurent) {
		printf("%d -> ", nodCurent->valoare);
		nodCurent = nodCurent->nextNode;
	}

	printf("NULL\n");
}

int numaraNoduri(Nod_t* capLista) {
	if (!capLista) {
		return 0;
	}

	return 1 + numaraNoduri(capLista->nextNode);
}



int main(void) {
	Nod_t* capLista = NULL;

	for (int i = 0; i < 14; i++) {
		adaugaNod(&capLista, i);
	}

	afisareLista(capLista);

	printf("Nr de noduri este %d\n", numaraNoduri(capLista));

	return 0;
}