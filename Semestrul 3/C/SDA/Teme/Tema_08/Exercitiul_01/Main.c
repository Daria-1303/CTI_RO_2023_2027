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
	Nod_t *nodAdaugat = creareNod(valoare);

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

void stergereDupaValoare(Nod_t** lista, int valoare) {
	if (*lista == NULL) {
		printf("lista goala\n");
		return;
	}

	Nod_t* nodCurent = *lista;
	Nod_t* nodAnterior = NULL;

	// daca e primul nod sters

	if (nodCurent != NULL && nodCurent->valoare == valoare) {
		*lista = nodCurent->nextNode;
		free(nodCurent);
		printf("Nodul cu vloarea %d a fost sters\n", valoare);
		return;
	}

	//altfel cautam

	while (nodCurent != NULL && nodCurent->valoare != valoare) {
		nodAnterior = nodCurent;
		nodCurent = nodCurent->nextNode;
	}

	if (!nodCurent) {
		printf("Nu am gasit un nod cu valoarea %d\n", valoare);
		return;
	}

	nodAnterior->nextNode = nodCurent->nextNode;
	free(nodCurent);

	printf("Nodul cu vloarea %d a fost sters\n", valoare);
}

void inversareLista(Nod_t** lista) {
	Nod_t* nodCurent = *lista;
	Nod_t* nodAnterior = NULL;
	Nod_t* nodUrmator = NULL;

	while (nodCurent) {
		nodUrmator = nodCurent->nextNode;
		nodCurent->nextNode = nodAnterior;

		nodAnterior = nodCurent;
		nodCurent = nodUrmator;
	}

	*lista = nodAnterior;
}


int main(void) {
	Nod_t* capLista = NULL;

	for (int i = 0; i < 14; i++) {
		adaugaNod(&capLista, i);
	}

	

	printf("Lista initiala : \n");
	afisareLista(capLista);

	inversareLista(&capLista);
	afisareLista(capLista);

	stergereDupaValoare(&capLista, 0);
	afisareLista(capLista);

	stergereDupaValoare(&capLista, 13);
	afisareLista(capLista);

	stergereDupaValoare(&capLista, 11);
	afisareLista(capLista);
	
	
	return 0;
}