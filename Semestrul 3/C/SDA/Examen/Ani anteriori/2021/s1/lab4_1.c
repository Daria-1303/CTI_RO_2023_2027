#include<stdio.h>
#include<stdlib.h>
#include<string.h>

//structura de forma: <an, durata, titlu, categorie, premii>
typedef struct
{
    int an;
    int durata;
    char titlu[50];
    char categorie[20];
    char premii[5];
} Film;

void afisare(Film o[], int n)
{
    int i;
    for(i=0; i<n; i++)
        printf("%d\t%d\t%s\t%s\t%s\n",o[i].an,o[i].durata,o[i].titlu,o[i].categorie,o[i].premii);
}

//fuctia scriere_fisier scrie elementele tabloului a, dat ca parametru, intr-un fisier cu numele nume[], de asemenea dat ca parametru.
void scriere_fisier(Film a[], int n, char nume[])
{
    int i;
    FILE *fiss;
    if((fiss=fopen(nume,"w"))==NULL)
    {
        printf("eroare deschidere fisier");
        return;
    }
    for(i=0; i<n; i++)
        fprintf(fiss,"%d\t%d\t%s\t%s\t%s\n",a[i].an,a[i].durata,a[i].titlu,a[i].categorie,a[i].premii);
    fclose(fiss);
}

//functia heapsort folosita pentru a ordona invers-alfabetic titlurile din tabloul a
void deplasare(int *s, Film *temp, int *d, Film a[])
{
    int i, j;
    int ret = 0;
    i = *s;
    j = 2 * i;
    *temp = a[i];
    ret = 0;
    while ((j <= *d) && (!ret))
    {
        if (j < *d && strcmp(a[j].titlu,a[j + 1].titlu)>0)
            j = j + 1;

        if (strcmp((*temp).titlu,a[j].titlu)>0)
        {
            a[i] = a[j];
            i = j;
            j = 2 * i;
        }
        else
            ret = 1;
    }
    a[i] = *temp;
}

void heapsort(Film a[], int n)
{
    int s, d;
    Film temp;
    s = (n / 2) + 1;
    d = n - 1;
    while (s>0)
    {
        s = s - 1;
        deplasare(&s, &temp, &d, a);
    }
    while (d>0)
    {
        temp = a[0];
        a[0] = a[d];
        a[d] = temp;
        d = d - 1;
        deplasare(&s, &temp, &d, a);
    }
}

//functia quicksort partitionata pe 3 intervale
void quicksort3way(Film a[], int s, int d)
{
    int i = s - 1, j = d, left = s - 1, right = d, k;
    char pivot[20],temp[20];
    strcpy(pivot,a[d].categorie);
    if (d <= s)
        return;
    while (1)
    {
        //descrescator (nu dupa da)
        while (strcmp(a[++i].categorie,pivot)<0) ;
        while (strcmp(a[--j].categorie,pivot)>0)
            if (j == s)
                break;
        if (i >= j)
            break;
        //swap(a[i].cheie,a[j].cheie);
        strcpy(temp,a[i].categorie);
        strcpy(a[i].categorie,a[j].categorie);
        strcpy(a[j].categorie,temp);
        if (strcmp(a[i].categorie,pivot)==0)
        {
            left++;
            //swap(a[left].cheie,a[i].cheie);
            strcpy(temp,a[left].categorie);
            strcpy(a[left].categorie,a[i].categorie);
            strcpy(a[i].categorie,temp);
        }
        if (strcmp(a[j].categorie,pivot)==0)
        {
            right--;
            //swap(a[j].cheie,a[right].cheie);
            strcpy(temp,a[j].categorie);
            strcpy(a[j].categorie,a[right].categorie);
            strcpy(a[right].categorie,temp);
        }
    }
    //swap(a[i].cheie,a[d].cheie);
    strcpy(temp,a[i].categorie);
    strcpy(a[i].categorie,a[d].categorie);
    strcpy(a[d].categorie,temp);
    j = i - 1;
    i++;
    for (k = s; k < left; k++, j--)
    {
        //swap(a[k].cheie,a[j].cheie);
        strcpy(temp,a[k].categorie);
        strcpy(a[k].categorie,a[j].categorie);
        strcpy(a[j].categorie,temp);
    }
    for (k = d- 1; k > right; k--, i++)
    {
        //swap(a[i].cheie,a[k].cheie);
        strcpy(temp,a[i].categorie);
        strcpy(a[i].categorie,a[k].categorie);
        strcpy(a[k].categorie,temp);
    }
    quicksort3way(a, s, j);
    quicksort3way(a, i, d);
}

void insertie(Film a[],int n)
{
    int i,j;
    for( i=n-2; i>=0; i--)
    {
        strcpy(a[n].premii,a[i].premii);
        j=i+1;
        while(strcmp(a[j].premii,a[n].premii)<0)
        {
            strcpy(a[j-1].premii,a[j].premii);
            j++;
        }
        strcpy(a[j-1].premii,a[n].premii);
    }
}

//functia radix directa modificata pentru a ordona descrescator vectorii de tip int
unsigned biti(unsigned x, int k, int j)
{
    return (x>>k)&~(~0<<j);
}

#define m 2
#define m1 m*m
int t[m1];

void radixdirect_desc(int a[], int n, int b)
{
  int i,j,trecere;
  int numar[m1];
  int aux;
  for( trecere= 0; trecere<=(b/m)-1; trecere ++)
  {
    for( j= 0; j <= m1-1; j ++)
      numar[j]= 0;
    for( i= 0; i <= n-1; i ++)
    {
       aux=biti(a[i],trecere*m,m);
       numar[aux]= numar[aux]+1;
    }
    for( j= 1; j <= m1-1; j ++)
      numar[j]= numar[j]+numar[j-1];
    for( i= n-1; i >=0; i--)
    {
      aux=biti(a[n-1-i],trecere*m,m);
      t[numar[aux]-1]= a[n-1-i];
      numar[aux]= numar[aux]-1;
    }
    for( i= 0; i <n; i ++) a[n-1-i]= t[i];
  }
}

int main()
{
    Film o[5000];
    FILE *fis;
    char c[100],*a,nr[10];
    int i=0,n=0;
    if((fis=fopen("filme.txt","r"))==NULL)
    {
        printf("eroare deschidere fisier");
        exit(EXIT_FAILURE);
    }
    fgets(c,100,fis);
    fgets(c,100,fis);
    while(!feof(fis))
    {
        c[strcspn(c,"\n")]='\0';
        a=strtok(c,"\t");
        o[n].an=atoi(a);
        a=strtok(NULL,"\t");
        o[n].durata=atoi(a);
        a=strtok(NULL,"\t");
        strcpy(o[n].titlu,a);
        a=strtok(NULL,"\t");
        strcpy(o[n].categorie,a);
        a=strtok(NULL,"\0");
        strcpy(o[n].premii,a);
        fgets(c,100,fis);
        n++;
    }
    heapsort(o,n);
    scriere_fisier(o,n,"nume_filme.txt");
    quicksort3way(o,0,n);
    scriere_fisier(o,n,"categorii_filme.txt");
    insertie(o,n);
    scriere_fisier(o,n,"premii_filme.txt");
    fclose(fis);
    return 0;
}
