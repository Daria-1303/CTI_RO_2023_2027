/*directive de preprocesor pentru evitarea incluziunilor multiple
- preprocesorul C verifica daca e definit macro-ul __COMPLEX_H
- daca nu e definit se intra pe ramura de true a directivei #ifndef,
se defineste macro-ul __COMPLEX_H si se parcurge restul fisierului
- daca e definit macro-ul __COMPLEX_H (de la o parcurgere anterioara...)
atunci nu se va intra pe ramura de true a directivei #ifndef si preprocesurul
va sari direct la #endif
*/
#ifndef __COMPLEX_H 
#define __COMPLEX_H

/* declaratia unui tip de date (cu typedef) ce contine o structura (struct)
ce modeleaza un numar complex (aceasta este o definitie utilizator a unui tip, 
limbajul C nestiind ce e acela un numar complex)
 */
typedef struct
{
  int x; // parte reala
  int y; // parte imaginara
}COMPLEX;

// declaratii de functii (antet urmat de ; fara implementare - bloc de cod)
void print_complex(COMPLEX *n); // functie de printare a unui nr complex
COMPLEX read_complex(void); // functie de citire a unui numar complex

/* declaratie de variabila (cu extern) - nu definitie
- spune compilatorului ca variabila count sa o considere simbol extern
sa o declare doar, si sa nu o defineasca (sa nu-i aloce memorie)
*/
extern int count;

#endif
