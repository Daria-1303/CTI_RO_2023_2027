#ifndef MULTILIST_H
#define MULTILIST_H

#include <stdio.h>
#include <stdlib.h>

typedef struct Nod_ls {
    int cheie;                    
    char info_ls[50];              
    struct Nod_ls* urm_ls;         
} Nod_ls;

typedef struct Nod_lp {
    int cheie;                    
    char info_lp[50];              
    struct Nod_lp* urm_lp;         
    struct Nod_ls* prim_ls;        
} Nod_lp;


Nod_lp* init_nod_lp(int cheie, const char* info);
Nod_ls* init_nod_ls(int cheie, const char* info);

void adauga_nod_secundar(Nod_lp* nod_principal, Nod_ls* nod_secundar);
void adauga_nod_principal(Nod_lp** prim, Nod_lp* nod_principal);

void afiseaza_multilista(Nod_lp* prim);
void elibereaza_multilista(Nod_lp* prim);

#endif // MULTILIST_H

