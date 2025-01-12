// program cat mai eficient pt a determina duplicatele

#include <stdio.h>
#include <stdlib.h>


int areDuplicate(int v[], int size) {
	for (int i = 0; i < size; i++) {
		for (int j = i + 1; j < size; j++) {
			if (v[i] == v[j]) {
				return 1;
			}
		}
	}

	return 0;
}

int areDuplicateHashTable(int v[], int size) {
	int* hashTable = (int*)calloc(size, sizeof(int));

	for (int i = 0; i < size; i++) {
		if (hashTable[v[i]] == 1) {
			free(hashTable);
			return 1;
		}

		hashTable[v[i]] = 1; // la fiecare element unic din vector -> punem 1
	}

	free(hashTable);
	return 0;
}

int main(void) {
	int v[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 1 };

	int size = sizeof(v) / sizeof(v[0]);

	if (areDuplicate(v, size)) {
		printf("Exista duplicate in vector\n");
	}
	else {
		printf("Nu exista duplicate in vector\n");
	}

	if (areDuplicateHashTable(v, size)) {
		printf("Exista duplicate in vector\n");
	}
	else {
		printf("Nu exista duplicate in vector\n");
	}

	return 0;

}