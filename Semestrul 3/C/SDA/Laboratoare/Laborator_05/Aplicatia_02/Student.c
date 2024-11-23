#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STUDENTI 100
#define MAX_NUME 100

typedef struct {
    char nume[MAX_NUME];
    float nota;
} Student;

// Funcția de citire a datelor din fișier
int citesteStudenti(Student studenti[], const char* nume_fisier) {
    FILE* fisier = fopen(nume_fisier, "r");
    if (!fisier) {
        perror("Eroare la deschiderea fisierului");
        return 0;
    }

    int nr_studenti = 0;
    while (nr_studenti < MAX_STUDENTI && 
           fgets(studenti[nr_studenti].nume, MAX_NUME, fisier) != NULL) {
        
        // Elimină caracterul '\n' din nume
        size_t len = strlen(studenti[nr_studenti].nume);
        if (len > 0 && studenti[nr_studenti].nume[len - 1] == '\n') {
            studenti[nr_studenti].nume[len - 1] = '\0';
        }

        // Citește nota
        if (fscanf(fisier, "%f\n", &studenti[nr_studenti].nota) != 1) {
            fprintf(stderr, "Eroare la citirea notei pentru %s\n", studenti[nr_studenti].nume);
            break; // Ieșire din buclă în caz de eroare
        }

        nr_studenti++;
    }

    fclose(fisier);
    return nr_studenti;
}

// Funcția de sortare alfabetică după numele studenților
void sortareAlfabetica(Student studenti[], int nr_studenti) {
    for (int i = 0; i < nr_studenti - 1; i++) {
        for (int j = i + 1; j < nr_studenti; j++) {
            if (strcmp(studenti[i].nume, studenti[j].nume) > 0) {
                Student temp = studenti[i];
                studenti[i] = studenti[j];
                studenti[j] = temp;
            }
        }
    }
}

// Funcția pentru a pune studenții promovați la început
void separarePromovati(Student studenti[], int nr_studenti) {
    int i = 0, j = nr_studenti - 1;
    while (i < j) {
        while (i < nr_studenti && studenti[i].nota >= 5.0) i++;
        while (j >= 0 && studenti[j].nota < 5.0) j--;
        if (i < j) {
            Student temp = studenti[i];
            studenti[i] = studenti[j];
            studenti[j] = temp;
        }
    }
}

// Funcția de sortare crescătoare după nota studenților folosind qsort
int comparaNota(const void* a, const void* b) {
    float nota_a = ((Student*)a)->nota;
    float nota_b = ((Student*)b)->nota;
    return (nota_a > nota_b) - (nota_a < nota_b);
}

void sortareNota(Student studenti[], int nr_studenti) {
    qsort(studenti, nr_studenti, sizeof(Student), comparaNota);
}

// Funcția principală
int main() {
    Student studenti[MAX_STUDENTI];
    int nr_studenti = citesteStudenti(studenti, "Studenti2.txt");

    // S2 - Sortare alfabetică
    sortareAlfabetica(studenti, nr_studenti);
    printf("Studenți ordonați alfabetic:\n");
    for (int i = 0; i < nr_studenti; i++) {
        printf("%s - %.2f\n", studenti[i].nume, studenti[i].nota);
    }

    // S2' - Separare studenți promovați/nepromovați
    separarePromovati(studenti, nr_studenti);
    printf("\nStudenți cu promovații la început:\n");
    for (int i = 0; i < nr_studenti; i++) {
        printf("%s - %.2f\n", studenti[i].nume, studenti[i].nota);
    }

    // S3 - Sortare crescătoare după nota
    sortareNota(studenti, nr_studenti);
    printf("\nStudenți ordonați crescător după notă:\n");
    for (int i = 0; i < nr_studenti; i++) {
        printf("%s - %.2f\n", studenti[i].nume, studenti[i].nota);
    }

    return 0;
}
