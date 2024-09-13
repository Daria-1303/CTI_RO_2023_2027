#include <stdio.h>
#include <stdlib.h>

typedef unsigned ListElement_t;

typedef struct ListNode{
	ListElement_t info;
	struct ListNode *urm;
}ListNode_t;

typedef ListNode_t* Lista_t;

Lista_t makeLista(){
	return NULL;
}

void afisLista(Lista_t L){

	for (Lista_t c=L; c!=NULL; c=c->urm){
		printf("%d ", c->info);
	}
	printf("\n");
}


ListNode_t* makeNod(ListElement_t el){

	ListNode_t* node=malloc(sizeof(ListNode_t));
	if (!node){
		return NULL;
	}
	node->urm=NULL;
	node->info=el;
	return node;
}


Lista_t insertFront(Lista_t L, ListElement_t el){

	ListNode_t* nou=makeNod(el);
	if (!nou){
		return NULL;
	}
	nou->info=el;
	nou->urm=L;
	L=nou;
	return L;
}


Lista_t insertPozK(Lista_t L, ListElement_t el, unsigned poz){
	ListNode_t* nou=makeNod(el);
	if (!nou){
		return NULL;
	}
	if (poz==0){

		return insertFront(L, el);
	}

	ListNode_t* c=L;
	for (int i=0; i<poz-1 && c->urm!=NULL; i++){
		c=c->urm;
	}
	printf("Am ajuns la elementul %d\n", c->info); 	
	nou->urm=c->urm;
	c->urm=nou;
	return L;
}


Lista_t deletePozK(Lista_t L, unsigned poz){

    if (poz==0){
    
    }
    
    ListNode_t* c=L;
    for (int i=0; i<poz-1 && c->urm->urm!=NULL; i++){
	c=c->urm;
    } 
    ListNode_t* aux=c->urm;
    c->urm=c->urm->urm;
    free(aux);
    return L;
}

int main(){

	Lista_t L=makeLista();
	L=insertFront(L, 10);
	L=insertFront(L, 20);
	afisLista(L);
	L=insertPozK(L, 100, 1);
	L=insertPozK(L, 200, 10);
	afisLista(L);
	
	L=deletePozK(L, 1);
	L=deletePozK(L, 1000);
	afisLista(L);

return 0;
}