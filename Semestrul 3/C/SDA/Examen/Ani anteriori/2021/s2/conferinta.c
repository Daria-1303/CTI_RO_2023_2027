#include <stdio.h>
#include <stdlib.h>
typedef struct conferinta{ //lista neordonata
 long meetid;
 long pass;
 struct conferinta *next; //lista inlantuita de conferinte
 struct studenti *head; //lista studentilor dintr o conferinta
 struct strudenti *wr;//lista studentilor din waiting room ul unei confe
}conferinta;

typedef struct studenti{ //lista ordonata alfabetic
 char name[35];
 struct studenti *next;//lista inlantuita de studenti
}studenti;

conferinta *radacina=NULL;//declaram global lista conferintelor
void acceptare(char c)
{
    conferinta *p=radacina;
    while(p!=NULL) //mergem pe lista conferintelor
    {
        studenti *w=p->wr; //lista waiting room
        studenti *s=p->head; //lista studentilor din conferinta
        //mergem pe lista studentilor din waiting room, daca nume[0]==c pentru fiecare stud din lista il adaugam la lista studentilor din conf
        while(w->next!=NULL)
        {
            if(w!=NULL&&w->name==c) //daca un student din lista de waiting poate fi adaugat
        {
            w->next=p->head;
            p->head=w; //il adaugam la inceputul listei
            studenti *next=w->next;
            free(w);
            p->wr=next; //il stergem din lista de wainting room
        }
        w=w->next;
        }
        p=p->next; //mergem la urmatoarele conferinte
    }
}


int main()
{
    printf("Hello world!\n");
    return 0;
}
