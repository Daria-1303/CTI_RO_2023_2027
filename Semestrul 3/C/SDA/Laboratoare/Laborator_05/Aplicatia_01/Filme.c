#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FILME 10000
#define MAX_TITLU 100
#define MAX_CATEGORIE 50

typedef struct {
    int an;
    int durata;
    char titlu[MAX_TITLU];
    char categorie[MAX_CATEGORIE];
    int premii; // 1 pentru "Da", 0 pentru "Nu"
} Film;


int citesteFilme(Film filme[], const char* nume_fisier) {
    FILE* fisier = fopen(nume_fisier, "r");
    if (!fisier) {
        perror("Eroare la deschiderea fișierului");
        return 0;
    }

    int nr_filme = 0;
    char premii[4]; // Buffer pentru "Da" sau "Nu"

    // Ignorăm prima linie (header)
    fscanf(fisier, "%*[^\n]\n");

    while (nr_filme < MAX_FILME && fscanf(fisier, "%d\t%d\t%[^\t]\t%[^\t]\t%s\n",
        &filme[nr_filme].an,
        &filme[nr_filme].durata,
        filme[nr_filme].titlu,
        filme[nr_filme].categorie,
        premii) == 5) {
        
        
        filme[nr_filme].premii = (strcmp(premii, "Da") == 0) ? 1 : 0;
        nr_filme++;
    }

    fclose(fisier);
    return nr_filme;
}


void sortareAlfabetica(Film filme[], int nr_filme) {
    for (int i = 0; i < nr_filme - 1; i++) {
        for (int j = i + 1; j < nr_filme; j++) {
            if (strcmp(filme[i].titlu, filme[j].titlu) > 0) {
                Film temp = filme[i];
                filme[i] = filme[j];
                filme[j] = temp;
            }
        }
    }
}


void separarePremiate(Film filme[], int nr_filme) {
    int i = 0, j = nr_filme - 1;
    while (i < j) {
        while (i < nr_filme && filme[i].premii == 1) i++;
        while (j >= 0 && filme[j].premii == 0) j--;
        if (i < j) {
            Film temp = filme[i];
            filme[i] = filme[j];
            filme[j] = temp;
        }
    }
}


int comparaAn(const void* a, const void* b) {
    return ((Film*)a)->an - ((Film*)b)->an;
}

void sortareAn(Film filme[], int nr_filme) {
    qsort(filme, nr_filme, sizeof(Film), comparaAn);
}

int main() {
    Film filme[MAX_FILME];
    int nr_filme = citesteFilme(filme, "Filme.txt");

    if (nr_filme == 0) {
        printf("Nu s-au citit filme din fișier sau fișierul este gol.\n");
        return 1;
    }

    // S2 - Sortare alfabetică
    sortareAlfabetica(filme, nr_filme);
    printf("Filme ordonate alfabetic:\n");
    for (int i = 0; i < nr_filme; i++) {
        printf("%d\t%d\t%s\t%s\t%s\n", filme[i].an, filme[i].durata, filme[i].titlu, filme[i].categorie, filme[i].premii ? "Da" : "Nu");
    }

    // S2' - Separare filme premiate/nepremiate
    separarePremiate(filme, nr_filme);
    printf("\nFilme cu premiile la început:\n");
    for (int i = 0; i < nr_filme; i++) {
        printf("%d\t%d\t%s\t%s\t%s\n", filme[i].an, filme[i].durata, filme[i].titlu, filme[i].categorie, filme[i].premii ? "Da" : "Nu");
    }

    // S3 - Sortare crescătoare după an
    sortareAn(filme, nr_filme);
    printf("\nFilme ordonate crescător după an:\n");
    for (int i = 0; i < nr_filme; i++) {
        printf("%d\t%d\t%s\t%s\t%s\n", filme[i].an, filme[i].durata, filme[i].titlu, filme[i].categorie, filme[i].premii ? "Da" : "Nu");
    }

    return 0;
}
