#include<stdio.h>
#include<string.h>
#include<stdlib.h>

typedef struct Pasager
{
    int cod;
} Pasager;

typedef struct Flight
{
    char nume[30];
    int contor;
    Pasager p[10];
    struct Flight *urm;
} Flight;

typedef struct
{
    Flight *prim;
} Flights;

Flights a;

void adaugareFlight(char nume[])
{
    Flight *r;
    r=(Flight*)malloc(sizeof(Flight));
    strcpy(r->nume,nume);
    r->contor=0;
    r->urm=NULL;
    if(a.prim==NULL)
    {
        a.prim=r;
    }
    else
    {
        Flight *o=a.prim;
        for(; a.prim->urm; a.prim=a.prim->urm);
        a.prim->urm=r;
        a.prim=o;
    }
}

void adaugarePasager(char nume[],int cod)
{
    Flight *o=a.prim;
    for(; a.prim; a.prim=a.prim->urm)
    {
        if(strcmp(a.prim->nume,nume)==0)
        {
            a.prim->p[a.prim->contor].cod=cod;
            a.prim->contor++;
        }
    }
    a.prim=o;
}

void scoaterePasager(int cod)
{
    Flight *o=a.prim;
    for(; a.prim; a.prim=a.prim->urm)
    {
        for(int i=0; i<a.prim->contor; i++)
        {
            if(a.prim->p[i].cod==cod)
            {
                for(int j=i; j<a.prim->contor-1; j++)
                {
                    a.prim->p[j].cod=a.prim->p[j+1].cod;
                    a.prim->contor--;
                }
            }
        }
    }
    a.prim=o;
}

void afisare()
{
    Flight *o=a.prim;
    for(; a.prim; a.prim=a.prim->urm)
    {
        printf("%s->",a.prim->nume);

        for(int i=0; i<a.prim->contor; i++)
        {
            printf("%d ",a.prim->p[i].cod);
        }

        printf("\n");
    }
    a.prim=o;
}

int main()
{
    adaugareFlight("a1");
    adaugareFlight("a2");
    adaugareFlight("a3");
    adaugareFlight("a4");
    adaugarePasager("a1",1);
    adaugarePasager("a1",2);
    adaugarePasager("a1",3);
    adaugarePasager("a2",7);
    adaugarePasager("a2",5);
    adaugarePasager("a3",10);
    adaugarePasager("a3",2);
    adaugarePasager("a3",11);
    adaugarePasager("a4",12);
    adaugarePasager("a4",14);
    afisare();
    scoaterePasager(2);
    afisare();
    return 0;
}

