#include <stdio.h>
typedef struct
{
	int cheie;
}tip_element;
tip_element a[5000],aa[5000];
tip_element b[8];
int n = 8;
#define mm 8
void generare(tip_element a[], int n)
{
	int i;
	for (i = 0; i < n; i++)
		a[i].cheie = n - 1 - i;
}

void insertion_sort(tip_element a[], int n)
{
	int i, j;
	tip_element tmp;
	for (i = 1; i < n; i++)
	{
		tmp = a[i];
		for (j = i; (j > 0) && (tmp.cheie < a[j - 1].cheie); j--)
			a[j] = a[j - 1];
		a[j] = tmp;
	}
}
int compare(tip_element el1, tip_element el2)
{
	return el1.cheie - el2.cheie;
}

void swap(tip_element* el1, tip_element* el2)
{
	tip_element tmp;
	tmp = *el1;
	*el1 = *el2;
	*el2 = tmp;
}
void selection_sort(tip_element a[], int n)
{
	int i, j, min; // min retine INDEXUL elementului cu valoare minima
	for (i = 0; i < n - 1; i++)
	{
		min = i;
		for (j = i + 1; j < n; j++)
		{
			if (a[j].cheie < a[min].cheie)
				min = j;
		}
		swap(&a[min], &a[i]);
	}
}

void bubble_sort(tip_element a[], int n)
{
	int i, j;
	for (i = 0; i < n - 1; i++)
	{
		for (j = n - 1; j > i; j--)
			if (a[j].cheie < a[j - 1].cheie) //daca nu sunt in ordinea potrivita
				swap(&a[j], &a[j - 1]);
	}
}

// T este dimensiunea tabloului de incrementi
#define T 3
int h[T];
void genereare_incrementi(int h[], int t)
{
	int i;
	//generare tablou de incrementi
	h[T - 1] = 1;
	for (i = T - 2; i >=
		0; i--)
	{
		h[i] = 3 * h[i + 1] + 1;
	}
}
void shell_sort(tip_element a[], int n)
{

	int i, j, k, hCnt, H;
	tip_element tmp;
	genereare_incrementi(h, T);
	//pentru fiecare increment
	for (i = 0; i < T; i++)
	{
		H = h[i]; //incrementul curent
		//pentru fiecare subtablou
		for (hCnt = 0; hCnt < H; hCnt++)
		{ //insetion_sort pentru subtablou
			for (j = H + hCnt; j < n; j += H)
			{
				tmp = a[j];
				for (k = j; (k - H >= 0) && tmp.cheie < a[k - H].cheie; k -= H)
					a[k] = a[k - H];
				a[k] = tmp;
			}
		}
	}
}

void quicksort(tip_element a[], int prim, int ultim)
{
	int stanga = prim + 1;
	int dreapta = ultim;
	//alegere pivot
	swap(&a[prim], &a[(prim + ultim) / 2]);
	//mutare pivot pe prima pozitie
	tip_element pivot = a[prim];
	while (stanga <= dreapta) //partitionare
	{
		while (stanga<=ultim && a[stanga].cheie < pivot.cheie)
			stanga++;
		while (dreapta>=prim && pivot.cheie < a[dreapta].cheie)
			dreapta--;
		if (stanga < dreapta)
			swap(&a[stanga++], &a[dreapta--]);
		else
			stanga++;
	}
	//mutare pivot la locul sau final
	swap(&a[dreapta], &a[prim]);
	//apelurile recursive
	if (prim < dreapta - 1)
		quicksort(a, prim, dreapta - 1);
	if (dreapta + 1 < ultim)
		quicksort(a, dreapta + 1, ultim);
}

#define MAX 1500
void qsortnerec(tip_element a[], int n)
{
	int i, j, s, d;
	tip_element x, temp;
	unsigned char is;
	struct {
		int s, d;
	}
	stiva[MAX];
	is = 1; stiva[0].s = 0; stiva[0].d = n - 1; /*amorsare*/
	do {
		s = stiva[is - (1)].s; d = stiva[is - (1)].d; is = is - 1;
		do {
			i = s; j = d; x = a[(s + d) / 2];
			do {
				while (a[i].cheie < x.cheie) i = i + 1;
				while (x.cheie < a[j].cheie) j = j - 1;
				if (i <= j)
				{
					temp = a[i]; a[i] = a[j]; a[j] = temp;
					i = i + 1; j = j - 1;
				}
			} while (!(i > j));
			if (i < d)
			{
				is = is + 1; stiva[is - 1].s = i; stiva[is - 1].d = d;
			}
			d = j;
		} while (!(s >= d));
	} while (!(is == 0));
} /*quicksort_nerecursiv*/

void deplasare(tip_element a[], int stanga, int dreapta)
{
	int fiu = 2 * stanga + 1;
	while (fiu <= dreapta)
	{
		if (fiu < dreapta && a[fiu].cheie < a[fiu + 1].cheie)
			//daca al doilea fiu are cheia cea mai mare
			fiu++;								//retinem al doilea fiu
		if (a[stanga].cheie < a[fiu].cheie)  //daca este necesar 
		{										 //schimba parinte cu fiu
			swap(&a[stanga], &a[fiu]);			 //si deplaseaza in jos
			stanga = fiu;
			fiu = 2 * stanga + 1;
		}
		else
			fiu = dreapta + 1;
	}
}

void mergesort(tip_element A[], tip_element temp[], int left, int right) {
	if (left == right) return; // secventa de un element
	int mid = (left + right) / 2;
	mergesort(A, temp, left, mid);
	mergesort(A, temp, mid + 1, right);
	for (int i = left; i <= right; i++) temp[i] = A[i]; // se copiaza secventa in temp
	int i1 = left; int i2 = mid + 1; // interclasare inapoi in A
	for (int index = left; index <= right; index++) {
		if (i1 == mid + 1) A[index] = temp[i2++];  // s-a epuizat secventa din stanga
		else if (i2 > right) A[index] = temp[i1++]; // s-a epuizat secventa din dreapta
		else if (temp[i1].cheie < temp[i2].cheie) A[index] = temp[i1++];
		else A[index] = temp[i2++];
	}
}


void heapsort(tip_element a[], int n)
{
	int i;
	//algoritmul lui Floyd 
	for (i = n / 2 - 1; i >= 0; i--) //se creaza ansamblul
		deplasare(a, i, n - 1);
	//extragerea maximului si refacerea ansamblului
	for (i = n - 1; i >= 1; i--)
	{
		swap(&a[0], &a[i]);			//mutare element maxim pe pozitia a[i]
		deplasare(a, 0, i - 1);		//se reface proprietatea de ansamblu
	}
}

void sortare_liniara(tip_element a[], tip_element b[], int n)
{
	int i;
	for (i = 0; i < n; i++)
		b[a[i].cheie] = a[i];
}
void afisare(tip_element a[], int n)
{
	int i;
	for (i = 0; i < n; ++i)
		printf("%d ", a[i].cheie);
	printf("\n");
}
void binsort(tip_element a[], int n)
{
	int i;
	for (i = 0; i < n; i++)
		while (a[i].cheie != i)
			swap(&a[i], &a[a[i].cheie]);
}


#define M 10
typedef int tip_cheie;


tip_cheie numar[M];

void countingsort(tip_element a[], tip_element b[], int n)
{
	int i, j;
	for (j = 1; j <= M - 1; j++) numar[j] = 0; //initializare tablou contorizare distributie elemente
	for (i = 1; i <= n; i++) numar[a[i - 1].cheie] = numar[a[i - 1].cheie] + 1; //numararea valorilor elementelor 
	for (j = 1; j <= M - 1; j++) numar[j] = numar[j - 1] + numar[j]; //ajustare valori contoare
	for (i = n; i >= 1; i--) //mutare elemente pe poztia ordonata in tabloul temporar b
	{
		b[numar[a[i - 1].cheie] - 1] = a[i - 1];
		numar[a[i - 1].cheie] = numar[a[i - 1].cheie] - 1;
	}
	//copiere elemente in tabloul initial
	for (i = 1; i <= n; i++) a[i - 1] = b[i - 1];
}

unsigned biti(unsigned x, int k, int j)
{
	return (x >> k) & ~(~0 << j);
}

void radinters(int stanga, int dreapta, int b, int a[])
/*stanga, dreapta - limitele curente ale tabloului de sortat*/
/*b - lungimea în biţi a cheii de sortat -1*/
{
	int i, j;
	int t_;
	if ((dreapta > stanga) && (b >= 0))
	{
		i = stanga; j = dreapta;
		do {
			while ((biti(a[i], b, 1) == 0) && (i < j)) i = i + 1;
			while ((biti(a[j], b, 1) == 1) && (i < j)) j = j - 1;
			t_ = a[i]; a[i] = a[j]; a[j] = t_;
		} while (!(j == i));
		if (biti(a[dreapta], b, 1) == 0)
			j = j + 1;  /* daca ultimul bit testat este 0 se reface lungimea partitiei */
		radinters(stanga, j - 1, b - 1, a);
		radinters(j, dreapta, b - 1, a);
	}
} /*RadixInterschimb*/


#define m 2
#define m1 m*m
int t[m1];
void radixdirect(int a[], int n, int b)
//global tipElement a[]. int N
// b-numarul de biti pe care este reprezentata cheia -1
{
	int i, j, trecere;
	int numar[m1]; /*m1:=2^m*/
	int aux;
	for (trecere = 0; trecere <= (b / m) - 1; trecere++)
	{
		for (j = 0; j <= m1 - 1; j++)
			numar[j] = 0;
		for (i = 0; i <= n - 1; i++)
		{
			aux = biti(a[i], trecere * m, m);
			numar[aux] = numar[aux] + 1;
		}
		for (j = 1; j <= m1 - 1; j++)        /* {*} */
			numar[j] = numar[j - 1] + numar[j];
		for (i = n - 1; i >= 0; i--)
		{
			aux = biti(a[i], trecere * m, m);
			t[numar[aux] - 1] = a[i];           /* {**}      */
			numar[aux] = numar[aux] - 1;
		}
		for (i = 0; i < n; i++) a[i] = t[i];
	}
} /* radixdirect*/



int main(void)
{
	n = 10;
	generare(a, n);
	afisare(a, n);
	//insertion_sort(a, n);
	//selection_sort(a, n);
	//bubble_sort(a, n);
	//shell_sort(a, n);
	//quicksort(a, 0, n-1);
	//qsortnerec(a, n);
	mergesort(a, aa, 0, n - 1);
	//heapsort(a, n);
	//binsort(a, n);
	//countingsort(a, b, n);
	//radinters(0, n - 1, 4, a);
	//radixdirect(a, n, 4);
	afisare(a, n);
	return 0;
}