/*   Reducere la forma scara pe linii si la forma scara redusa */

# include <stdio.h>
# include <stdlib.h>
# include <math.h>

# define toler 0.1e-7// orice numar mai mic  in valoare absoluta decat toler este considerat a fi 0.0


typedef struct
{
    double **matr;
    int lin; // nr de linii
    int col; // nr de coloane ale matricii
} Matrice;
/*----------------------------------------------------*/


/* Functii ce implementeaza cele trei transformari elementare pe linii */

Matrice trLin1(Matrice A, int i, int j)  // L_i<-->L_j
{
      int k;
      double hp;
      for (k=0; k < A.col; k++)
         {
              hp = A.matr[i][k];
              A.matr[i][k] = A.matr[j][k];
              A.matr[j][k] = hp;
          }
      return  A;
}

/* --------------------------------------------------------------------- */

Matrice trLin2 (Matrice A,  double a, int i)  // a*L_i-->L_i
{
      int j;
      for (j=0; j < A.col; j++)
          A.matr[i][j] = a * A.matr[i][j];
      return A;
}

/* --------------------------------------------------------------------- */

Matrice trLin3(Matrice A,  double a,  int i, int j)  // a*L_i+L_j-->L_j
{
      int k;
      for (k = 0; k < A.col; k++)
          A.matr[j][k] += a * A.matr[i][k];
      return A;
}


/* --------------------------------------------------------------------- */

void afisMatrice(Matrice A)
{
    int i, j;
    printf ( "\n\n" );
    for (i=0;i<A.lin;i++)
    {
    for (j=0;j<A.col;j++)
        printf("\t%.2lf",A.matr[i][j] );// am setat numarul de zecimale afisate la 2 ca sa nu umple ecranul
    printf ("\n\n");
    }
  }

/*--------------------------------------------------------------------- */


void redScara(Matrice A)// Reducerea la forma scara uzuala
{
int i, j, flagPiv, pozL=0, pozC=0;
double pivot;
for(j=pozC;j < A.col;j++)
    {
    flagPiv=-1;
    pivot=0.0;

/* Pivotare partiala: determina cel mai mare pivot in coloana de sub pozitia viitorului pivot */

    for (i = pozL;i<A.lin;i++)
        {
        if(fabs(A.matr[i][j])> fabs(pivot)+toler)
            {
                pivot = A.matr[i][j];
        flagPiv = i;
            }
        }

/* trec la coloana urmatoare daca am deja zerouri.  */

    if (flagPiv != -1)
        {
        if (flagPiv != pozL)
        A = trLin1( A, flagPiv, pozL);

        if (pivot != 1.0)
                A = trLin2 ( A,  1.0/pivot, pozL );

        for (i=pozL+1;i< A.lin;i++)
            {
        if (fabs (A.matr[i][j]) < toler)
                    A.matr[i][j] = 0.0;
                else
            A = trLin3(A,-A.matr[i][j], pozL,i);
            }
            pozL++;
        }
    }

}

/*------------------------------------------------------*/
void redScaraRed (Matrice A)//Reduce matricea in forma scara la forma redusa
{
    int i, j, pozI = 1, pozJ = 1;
    if (A.lin>1)
    {
    while ((pozI<A.lin) && (pozJ<A.col))
        {
        if (fabs (A.matr[pozI][pozJ]) < toler)
         pozJ++;
            else
            {
          for (i=0; i<pozI; i++)
                  {
              if (fabs(A.matr[i][pozJ]) >toler)
                      {
               for (j =pozJ+1;j<A.col;j++ )
                A.matr[i][j] -= A.matr[i][pozJ] * A.matr[pozI][j];
                      }
              A.matr[i][pozJ] = 0.0;
                  }
          pozI++;
          pozJ++;
            }
        }
    }
}

/*------------------------------------------------------*/
int  main (void)
{
    int i, j;
    FILE *fis;
    Matrice A;
    fis=fopen("matrice.txt", "r");
    if(fis==NULL) {printf("\n  Nu am gasit fisierul de date"); exit(1);}

    fscanf(fis, "%d", &A.lin);
    fscanf(fis,"%d%", &A.col);
    A.matr=(double **) malloc(A.lin*sizeof(double *));

    for(i=0;i<A.lin;i++) // aloca memorie pt elem din linia i
    if((A.matr[i]=(double *)malloc(A.col*sizeof(double)))==NULL)
      {
      printf("\n  alocare esuata");
      exit(1) ;
      }

      // Citeste elementele matricii sistemului din fisier
    for(i=0;i<A.lin;i++)
        for(j=0;j<A.col;j++)
            fscanf(fis,"%lf", &A.matr[i][j]);

    printf("\n\n        Matricea citita este");
    afisMatrice(A);

    redScara(A);

    printf("\n        Forma scara generala  a matricii");
    afisMatrice(A);
    redScaraRed(A);
    printf("\n        Forma scara redusa a aceleiasi matrici");
    afisMatrice(A);

    return 1;
}


