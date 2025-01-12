/*
Fie un tablou de elemente ale căror valori sunt numere întregi, pozitive sau negative.
Să se aleagă și să se modifice unul din algoritmii de sortare studiați, astfel încât:

Valorile negative vor fi aduse la începutul tabloului (rezultatul va fi un tablou cu toate elementele negative la început 

și toate elementele pozitive la sfârșit).

Valorile pozitive vor fi sortate crescător.
Algoritmul modificat trebuie să fie cât mai eficient.

Se cere:

Motivați alegerea algoritmului.
Exemplificați funcționarea algoritmului pe un tablou de 6 elemente.
Notă:

Algoritmul poate fi scris în pseudocod (C-like).
Este obligatorie comentarea algoritmului și specificarea complexității acestuia în termeni de O(f(n)), comentarea structurilor 

de date alese, precum și justificarea alegerii acestora.

Este obligatorie exemplificarea efectului apelului funcțiilor implementate pe un exemplu ales.

*/

#include <stdio.h>

typedef struct{
	int *data;
	int n;
}Tablou_t;

// cea mai eficienta metoda de sortare ar fi QuickSort, deoarece are complexitatea O(n log n) in cazul mediu si O(n^2) in cazul
// cel mai defavorabil, dar in cazul nostru, QuickSort ar fi eficient deoarece avem de sortat doar numere intregi, pozitive si
// negative, fara alte conditii speciale. Astfel, QuickSort ar fi alegerea optima pentru a rezolva problema data.

// daca ar fi sa folosim MergeSort, ar fi mai ineficient deoarece MergeSort are complexitatea O(n log n) in cazul cel mai defavorabil
// si in cazul mediu, dar MergeSort are nevoie de un vector auxiliar pentru a sorta elementele, ceea ce ar face algoritmul mai ineficient
// decat QuickSort.

void swap(Tablou_t* el1, Tablou_t* el2)
{
	Tablou_t tmp;
	tmp = *el1;
	*el1 = *el2;
	*el2 = tmp;
}

void quicksort(Tablou_t tablou[], int primElement, int ultimElement){
	int stanga = primElement + 1;
	int dreapta = ultimElement;

	// alegere pivot
	swap(&a[primElement], &a[(primElement + ultimElement) / 2]);
}




int main(void) {
	printf("da\n");
	return 0;
}