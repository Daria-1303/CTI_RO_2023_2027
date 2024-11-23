#ifndef LIST_H
#define LIST_H

typedef struct Lista {
	int* elemente;
	int dimensiune_curenta;
	int capacitate;
}Lista_t;

//Avem nevoie de o functie de initializare, cu o capacitate data ca parametru

Lista_t* creeazaLista(int capacitate);

//O functie de adaugare element in lista 

Lista_t* adaugaElement(Lista_t* lista, int element);

//O functie care sterge un element

Lista_t* stergeElement(Lista_t* lista, int *elementSters);

//functie de afisare

void afiseazaLista(Lista_t* lista);

//functie de eliberare a memoriei

void freeLista(Lista_t* lista);

#endif