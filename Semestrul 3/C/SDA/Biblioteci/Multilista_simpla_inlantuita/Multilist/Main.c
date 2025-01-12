#include "Multilist.h"

int main() {
    
    Nod_lp* prim = NULL;

    
    Nod_lp* nod1 = init_nod_lp(1, "Lista 1");
    Nod_lp* nod2 = init_nod_lp(2, "Lista 2");
    Nod_lp* nod3 = init_nod_lp(3, "Lista 3");

   
    adauga_nod_principal(&prim, nod1);
    adauga_nod_principal(&prim, nod2);
    adauga_nod_principal(&prim, nod3);

    
    adauga_nod_secundar(nod1, init_nod_ls(11, "Element 1.1"));
    adauga_nod_secundar(nod1, init_nod_ls(12, "Element 1.2"));

    adauga_nod_secundar(nod2, init_nod_ls(21, "Element 2.1"));

    adauga_nod_secundar(nod3, init_nod_ls(31, "Element 3.1"));
    adauga_nod_secundar(nod3, init_nod_ls(32, "Element 3.2"));
    adauga_nod_secundar(nod3, init_nod_ls(33, "Element 3.3"));

   
    printf("Structura multilistei:\n");
    afiseaza_multilista(prim);

    elibereaza_multilista(prim);

    return 0;
}
