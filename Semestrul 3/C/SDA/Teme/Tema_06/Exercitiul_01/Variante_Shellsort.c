#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct {
	int cheie;
} Element_t;

/*
// cod curs

// T este dimensiunea
//tabloului de incrementi
#define T 3
int h[T];
void genereare_incrementi(int h[], int t) {
	int i; //generare tablou de incrementi
	h[T - 1] = 1;
	for (i = T - 2; i >=0; i--) {
		h[i] = 3 * h[i + 1] + 1;
	}
}

void shell_sort_insertion(tip_element a[], int n) {
	int i, j, k, hCnt, H;
	tip_element tmp;
	genereare_incrementi(h, T);
	//pentru fiecare increment
	for (i = 0; i < T; i++) {
		H = h[i]; //incrementul curent
		//pentru fiecare subtablou
		for (hCnt = 0; hCnt < H; hCnt++) {
		//insetion_sort pentru subtablou
			for (j = H+hCnt; j < n;j+=H){
		//se selecteaza elementele cu pasul H
				tmp = a[j];
				for (k = j; (k-H>=0) && tmp.cheie < a[k - H].cheie; k-=H)
					a[k] = a[k - H];
				a[k] = tmp;
				}
			}
		}
	}
}
*/

// cu numere fibonacci
#define T 5

int h[T];

void generare_incrementi_fibonacci(int h[]) {
	// in mod normal, incrementii ar trebui sa fie diferiti la shellsort
	h[0] = 1;
	h[1] = 1;

	for (int i = 2; i < T; i++) {
		h[i] = h[i - 1] + h[i - 2];
	}

}

void generare_incrementi_Fibonacci(int h[]) {
	h[T - 2] = 1;
	h[T - 1] = 1;

	for (int i = T - 3; i >= 0; i--) {
		h[i] = h[i + 1] + h[i + 2];
	}
}

void generare_incrementi(int h[]) {
	int i;
	h[T - 1] = 1;

	for (i = T - 2; i >= 0; i--) {
		h[i] = 3 * h[i + 1] + 1;
	}
}

//asta o prima varianta

void shellSort_Fibonacci_Bubble(Element_t a[], int n) {
	int i, j, k, h_Cnt, H;
	Element_t tmp;

	generare_incrementi_fibonacci(h);

	for (i = 0; i < T; i++) {
		H = h[i];

		for (h_Cnt = 0; h_Cnt < H; h_Cnt++) {
			// bubble sort pentru subtablou
			/*for (j = H + h_Cnt; j < n; j += H) {
				tmp = a[j];
				for (k = j; (k - H >= 0) && tmp.cheie < a[k - H].cheie; k -= H) {
					a[k] = a[k - H];
				}
				a[k] = tmp;
			}*/

			for (j = n - H; j >= H; j--) {
				for (k = h_Cnt; k < j; k += H) {

					if (a[k].cheie > a[k + H].cheie) {
						tmp = a[k];
						a[k] = a[k + H];
						a[k + H] = tmp;
					}
				}
			}	
		}
	}
	
}

// varianta generala

void shellSort(Element_t a[], int n, void (*generare)(int[])) {
	int i, j, k, h_Cnt, H, minIdx = 0;
	Element_t tmp;

	generare(h);

	for (i = 0; i < T; i++) {
		H = h[i];

		for (h_Cnt = 0; h_Cnt < H; h_Cnt++) {

			for (j = h_Cnt; j < n - H; j += H) {
				minIdx = j;

				for (k = j + H; k < n; k += H) {
					if (a[k].cheie < a[minIdx].cheie) {
						minIdx = k;
					}
				}

				if (minIdx != j) {
					tmp = a[j];
					a[j] = a[minIdx];
					a[minIdx] = tmp;
				}
			}
		}
	}
}

void shell_sort_insertion(Element_t a[], int n) {
	int i, j, k, hCnt, H;
	Element_t tmp;
	generare_incrementi(h);
	//pentru fiecare increment
	for (i = 0; i < T; i++) {
		H = h[i]; //incrementul curent
		//pentru fiecare subtablou
		for (hCnt = 0; hCnt < H; hCnt++) {
			//insetion_sort pentru subtablou
			for (j = H + hCnt; j < n;j += H) {
				//se selecteaza elementele cu pasul H
				tmp = a[j];
				for (k = j; (k - H >= 0) && tmp.cheie < a[k - H].cheie; k -= H)
					a[k] = a[k - H];
				a[k] = tmp;
			}
		}
	}
}



void afisare(Element_t a[], int n) {
	for (int i = 0; i < n; i++) {
		printf("%d ", a[i].cheie);
	}
	printf("\n");
}

#define MAX 100000

int main() {
	srand(time(NULL));
	Element_t a[MAX];
	int n = MAX;

	Element_t copie[MAX];

	FILE* fout = fopen("output.txt", "w");

	if (fout == NULL) {
		return -1;
	}

	for (int i = 0; i < MAX; i++) {
		a[i].cheie = rand();

		copie[i] = a[i];
	}

	clock_t start, stop;

	start = clock();

	shellSort(a, n, generare_incrementi_Fibonacci);

	stop = clock();

	double timp1 = ((double)(stop - start)) / CLOCKS_PER_SEC;

	//afisare(a, n);

	fprintf(fout, "%f \n", timp1);

	// 2

	for (int i = 0; i < MAX; i++) {
		a[i] = copie[i];
	}

	start = clock();

	shellSort(a, n, generare_incrementi);

	stop = clock();

	double timp2 = ((double)(stop - start)) / CLOCKS_PER_SEC;

	fprintf(fout, "%f \n", timp2);

	// 3

	for (int i = 0; i < MAX; i++) {
		a[i] = copie[i];
	}

	start = clock();

	shellSort_Fibonacci_Bubble(a, n);

	stop = clock();

	double timp3 = ((double)(stop - start)) / CLOCKS_PER_SEC;

	fprintf(fout, "%f \n", timp3);

	// 4

	for (int i = 0; i < MAX; i++) {
		a[i] = copie[i];
	}

	start = clock();

	shell_sort_insertion(a, n);

	stop = clock();

	double timp4 = ((double)(stop - start)) / CLOCKS_PER_SEC;

	fprintf(fout, "%f \n", timp4);

	return 0;
}