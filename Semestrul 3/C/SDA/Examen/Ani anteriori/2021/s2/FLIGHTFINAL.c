#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct passenger{
  int nr;
  struct passenger *urm;
}passenger;

typedef struct flight{
  char name[100];
  passenger *p;
  struct flight *urm;
}flight;

flight* zbor(char name[100])
{
  flight *f=(flight*)malloc(sizeof(flight));
  if(f==NULL){
    printf("Nu s-a reusit alocarea\n");
    exit(EXIT_FAILURE);
  }
  strcpy(f->name,name);
  f->p=NULL;
  f->urm=NULL;
  return f;
}

passenger* pasager(int nr)
{
  passenger *p=(passenger *)malloc(sizeof(passenger));
  if(p==NULL)
  {
    printf("Nu s-a reusit alocarea");
    exit(EXIT_FAILURE);
  }
  p->nr=nr;
  p->urm=NULL;
}

void add_flight(flight *f,flight **l)
{
  if(*l==NULL)
    (*l)=f;
  else{
    flight *aux=*l,*aux2;
    for(;aux->urm;aux2=aux,aux=aux->urm){}
     aux->urm=f;
  }
}

passenger* add_pasager(flight *f,passenger *p)
{
  if(f->p==NULL)
  {
    f->p=p;
    return f->p;
  }
  else{
    if(f->p->nr>p->nr)
    {
      p->urm=f->p;
      f->p=p;
      return f->p;
    }
    else{
      passenger *aux=f->p,*aux2=f->p->urm;
      for(;aux2 && aux2->nr<p->nr;aux=aux2,aux2=aux->urm){}
       p->urm=aux2;
       aux->urm=p;
       return f->p;
    }
  }
}

void remove_pasager(flight **l,int nr)
{
  flight *aux=*l;
  for(;aux;aux=aux->urm)
  {
    if(aux->p)
    {
      passenger *p=aux->p;
      if(p->nr==nr)
        aux->p=aux->p->urm;
      else{
        passenger *p2=p->urm;
        for(;p2;p=p2,p2=p2->urm)
          if(p2->nr==nr)
          {
            p->urm=p2->urm;
            free(p2);
            break;
          }
      }
    }
  }
}

void afisare(flight *l)
{
  for(;l;l=l->urm)
  {
    printf("%s: ",l->name);
    afisare2(l->p);
    printf("\n");
  }
}

void afisare2(passenger *l)
{
  for(;l;l=l->urm)
  {
    printf("%d ",l->nr);
  }
}

void eliberare(flight **l)
{
  flight *aux;
  while(*l)
  {
    aux=(*l)->urm;
    free(*l);
    *l=aux;
  }
}

int main()
{
  flight *l=NULL;
  flight *a,*b,*c;
  a=zbor("zbor1");
  add_flight(a,&l);
  passenger *p1,*p2,*p3,*p4,*p5;
  p1=pasager(5);
  p2=pasager(1);
  p3=pasager(7);
  p4=pasager(8);


  a->p=add_pasager(a,p1);
  a->p=add_pasager(a,p2);
  a->p=add_pasager(a,p3);
  a->p=add_pasager(a,p4);


  b=zbor("zbor2");
  add_flight(b,&l);
  c=zbor("zbor3");
  add_flight(c,&l);

  remove_pasager(&l,1);
  remove_pasager(&l,5);
  remove_pasager(&l,10);

  afisare(l);
  eliberare(&l);
  return 0;
}
