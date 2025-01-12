#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Funcție care verifică dacă un pattern cu '*' se potrivește cu un șir dat
int matches(const char* pattern, const char* str) {
    while (*pattern && *str) {
        if (*pattern == '*') {
            pattern++;
            if (!*pattern) return 1; // '*' la sfârșit se potrivește cu orice
            while (*str) {
                if (matches(pattern, str)) return 1;
                str++;
            }
            return 0;
        }
        else if (*pattern == *str) {
            pattern++;
            str++;
        }
        else {
            return 0;
        }
    }
    while (*pattern == '*') pattern++; // Ignoră '*' rămase la final
    return !*pattern && !*str;
}

// Funcție pentru a găsi cea mai lungă potrivire într-un fișier
void find_longest_match(const char* pattern, const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        perror("Eroare la deschiderea fișierului");
        return;
    }

    char line[1024];
    char* longest_match = NULL;
    size_t max_length = 0;

    while (fgets(line, sizeof(line), file)) {
        // Elimină newline-ul de la sfârșitul liniei
        line[strcspn(line, "\n")] = '\0';

        if (matches(pattern, line)) {
            size_t line_length = strlen(line);
            if (line_length > max_length) {
                max_length = line_length;
                if (longest_match) {
                    free(longest_match); // Eliberăm memoria anterioară
                }
                // Alocăm memorie și copiem manual șirul
                longest_match = (char*)malloc((line_length + 1) * sizeof(char));
                if (longest_match) {
                    strcpy(longest_match, line);
                }
            }
        }
    }

    if (longest_match) {
        printf("Cea mai lunga+ potrivire: %s\n", longest_match);
        free(longest_match);
    }
    else {
        printf("Nicio potrivire găsită.\n");
    }

    fclose(file);
}

// Funcția principală pentru a trata argumentele din linia de comandă
int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Utilizare: %s <pattern> <nume_fisier>\n", argv[0]);
        return 1;
    }

    const char* pattern = argv[1];
    const char* filename = argv[2];

    find_longest_match(pattern, filename);

    return 0;
}
