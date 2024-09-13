#include <stdio.h>
#include <stdlib.h>

#define DEBUG 1

typedef unsigned long long Payload_t;

typedef struct Nod{
    Payload_t info;
    struct Nod* urm;
}Nod_t;


Nod_t* makeNod(Payload_t info){
    Nod_t* nod=malloc(sizeof(Nod_t));
    if (!nod){
        return NULL;
    } 
    nod->info=info;
    nod->urm=NULL;
    //(*nod).urm=NULL;
    return nod;
}

typedef Nod_t* Lista_t; //tipul lista este de fapt un pointer la un nod (primul nod)


//primeste o lista si un nod, adauga nodul la inceputul listei si returneaza lista
Lista_t addFront(Lista_t L, Nod_t* c ){
    if (L==NULL){   //lista e goala
        c->urm=NULL;
        return c;
    }
    else{
        c->urm=L;
        L=c;
        return L;
    }
}

Lista_t deleteFront(Lista_t L){
    Nod_t* aux=L;
    L=L->urm;
    free(aux);
    return L;
}


Lista_t deletePosition(Lista_t L, size_t k){
    if (k==0){
        return deleteFront(L);
    }
    else{
        Lista_t c=L;
        for (int i=0; i<k-2 && c->urm->urm!=NULL; i++){
            c=c->urm;
        }
#if DEBUG==1
        printf("Am ajuns la pozitia cu info %llu\n", c->info);
#endif
        if (c->urm->urm!=NULL){
            Nod_t* aux=c->urm->urm;
            c->urm->urm=c->urm->urm->urm;
            free(aux);
        }
        else{
            Nod_t* aux=c->urm;
            c->urm=NULL;
            free(aux);
        }
    }
    return L;
}

Lista_t addPosition(Lista_t L, size_t k, Nod_t* nod){  
    //adauga nodul pe pozitia k din lista
    if (k==0){
        return addFront(L, nod);
    }
    
    Lista_t c=L;
    for (int i=0; c->urm!=NULL && i<k-1; c=c->urm, i++){
        ;
    }
    nod->urm=c->urm;
    c->urm=nod;
    return L;
}

void printLista(Lista_t L){
    for (Nod_t*c =L; c!=NULL; c=c->urm){
        printf("%llu, ", c->info);
    }
    printf("\n");
}



int main(){

    Lista_t L=NULL;
    
    L=addFront(L, makeNod(10) );
    L=addFront(L, makeNod(20) );
    L=addFront(L, makeNod(30) );
    L=addFront(L, makeNod(40) );
    
    printLista(L);
    L=addPosition(L, 2, makeNod(100));
    L=addPosition(L, 2, makeNod(200));
    printLista(L);
    L=addPosition(L, 0, makeNod(300));
    printLista(L);
    L=addPosition(L, 100, makeNod(999));
    printLista(L);

    L=deleteFront(L);
    printLista(L);

    L=deletePosition(L, 2);
    printLista(L);
    L=deletePosition(L, 200);
    printLista(L);

    return 0;
}