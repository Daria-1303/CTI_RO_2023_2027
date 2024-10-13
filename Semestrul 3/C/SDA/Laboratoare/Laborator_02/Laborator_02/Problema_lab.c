#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 10

typedef struct Person {
    char CNP[14];
    int an_nastere;
    char gen;
} Person_t;

typedef struct set {
    Person_t* persoane;
    int size;
} Set_t;

Set_t* creeazaSet(int size) {
    Set_t* v = (Set_t*)malloc(sizeof(Set_t));

    if (!v) {
        printf("Eroare la alocarea memoriei.\n");
        return NULL;
    }
    v->persoane = (Person_t*)malloc(size * sizeof(Person_t));

    if (!v->persoane) {
        printf("Eroare la alocarea memoriei pentru persoane.\n");
        free(v); 
        return NULL;
    }
    v->size = 0;
    return v;
}


int existaInSet(Set_t* v, char cnp[]) {
    if (v->size > 0) {
        for (int i = 0; i < v->size; i++) {
            if (strcmp(v->persoane[i].CNP, cnp) == 0) {
                return 1; // Elementul existã deja în set
            }
        }
    }
    return 0;
}

Set_t* add_to_set(Set_t* v, Person_t p) {
    if (v == NULL) {
        printf("Setul nu existã.\n");
        return NULL;
    }

    if (!existaInSet(v, p.CNP)) {
        if (v->size < MAX_SIZE) {
            v->persoane[v->size++] = p;
            //printf("succes adaugare persoane\n");
        }
        else {
            printf("Full\n");
        }
    }
    else {
        printf("Persoana exista in set.\n");
    }
    return v;
}

void afisare(Set_t* v) {
    if (v == NULL || v->size == 0) {
        printf("Setul este gol.\n");
        return;
    }
    for (int i = 0; i < v->size; i++) {
        printf("CNP: %s - An nastere: %d -Gen: %c\n", v->persoane[i].CNP, v->persoane[i].an_nastere, v->persoane[i].gen);
    }
}

Set_t* remove_from_set(Set_t* v, char cnp[]) {
    if (v == NULL || v->size == 0) {
        printf("Setul este gol sau nu exista.\n");
        return v;
    }

    for (int i = 0; i < v->size; i++) {
        if (strcmp(v->persoane[i].CNP, cnp) == 0) {
            for (int j = i; j < v->size - 1; j++) {
                v->persoane[j] = v->persoane[j + 1]; 
            }
            v->size--;
            printf("Persoana cu CNP %s a fost eliminata.\n", cnp);
            return v;
        }
    }
    printf("Persoana nu a fost gasita in set.\n");
    return v;
}

int count(Set_t* v) {
    return v->size;
}

int main(void) {
    Set_t* set = creeazaSet(MAX_SIZE);
    int size = 0;

    Person_t p1 = { "1234567890123", 2005, 'M' };
    add_to_set(set, p1);

    Person_t p2 = { "9876543210987", 2004, 'F' };
    add_to_set(set, p2);

    afisare(set);
    size = count(set);
    printf("Mai sunt %d persoane \n", size);

    remove_from_set(set, "1234567890123");
    afisare(set);


    size = count(set);
    printf("Mai sunt %d persoane \n", size);


    return 0;
}
