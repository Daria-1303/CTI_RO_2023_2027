#include "Multilist.h"
#include <string.h>


Nod_lp* init_nod_lp(int cheie, const char* info) {
    Nod_lp* nod = (Nod_lp*)malloc(sizeof(Nod_lp));
    nod->cheie = cheie;
    strcpy(nod->info_lp, info);
    nod->urm_lp = NULL;
    nod->prim_ls = NULL;
    return nod;
}


Nod_ls* init_nod_ls(int cheie, const char* info) {
    Nod_ls* nod = (Nod_ls*)malloc(sizeof(Nod_ls));
    nod->cheie = cheie;
    strcpy(nod->info_ls, info);
    nod->urm_ls = NULL;
    return nod;
}


void adauga_nod_secundar(Nod_lp* nod_principal, Nod_ls* nod_secundar) {
    if (nod_principal->prim_ls == NULL) {
        nod_principal->prim_ls = nod_secundar;
    }
    else {
        Nod_ls* temp = nod_principal->prim_ls;
        while (temp->urm_ls != NULL) {
            temp = temp->urm_ls;
        }
        temp->urm_ls = nod_secundar;
    }
}

void adauga_nod_principal(Nod_lp** prim, Nod_lp* nod_principal) {
    if (*prim == NULL) {
        *prim = nod_principal;
    }
    else {
        Nod_lp* temp = *prim;
        while (temp->urm_lp != NULL) {
            temp = temp->urm_lp;
        }
        temp->urm_lp = nod_principal;
    }
}

void afiseaza_multilista(Nod_lp* prim) {
    Nod_lp* nod_principal = prim;
    while (nod_principal != NULL) {
        printf("Nod principal: %d - %s\n", nod_principal->cheie, nod_principal->info_lp);
        Nod_ls* nod_secundar = nod_principal->prim_ls;
        while (nod_secundar != NULL) {
            printf("  Nod secundar: %d - %s\n", nod_secundar->cheie, nod_secundar->info_ls);
            nod_secundar = nod_secundar->urm_ls;
        }
        nod_principal = nod_principal->urm_lp;
    }
}

void elibereaza_multilista(Nod_lp* prim) {
    while (prim != NULL) {
        Nod_lp* temp_principal = prim;
        prim = prim->urm_lp;

        Nod_ls* nod_secundar = temp_principal->prim_ls;
        while (nod_secundar != NULL) {
            Nod_ls* temp_secundar = nod_secundar;
            nod_secundar = nod_secundar->urm_ls;
            free(temp_secundar);
        }
        free(temp_principal);
    }
}
