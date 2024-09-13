/* incluziuni
- in cazul unei incluziuni cu fisierul pus intre ghilimele " " prepropcesorul C
va interpreta continutul dintre ghilimele ca si o cale (absoluta sau relativa)
de fisier
- in acest caz ca cauta fisierul complex.h in acelasi directoru cu fisierul care
a facut incluziunea (in cazul nostru complex.c)
- se poate pune si #include "/home/student/complex/complex.h"

- in cazul unei incluziuni cu fisierul pus intre semnele < .. > preprocesorul
C va interpreta continutul ca si un fisier pe care il va cauta in caile de 
incluziuni implicite ale compilatorului sau a celor ce sunt date in linie de
comanda compilatorului

- se includ doar fisiere header 
- NU se includ fisiere C
*/

/*
este necesara includerea fisierului header complex.h pentru a folosi tipul de
date declarat si antetele functiilor
 */
#include "complex.h"
#include <stdio.h>

int count = 0; // variabila count definita la nivelul fisierului obiect rezultat


// implementarea functiilor declarate in fisierul header
// printarea numar complex sub forma algebrica
// numarul complex este dat ca si argument de tip pointer 
void print_complex(COMPLEX *n)
{
  printf ("%d + %dj\n", n->x, n->y);
  count++;
}
// citirea unui numar complex de la tastatura
// numarul complex va fi returnat
COMPLEX read_complex(void)
{
  COMPLEX nr;
  scanf("%d %d", &nr.x, &nr.y);
  return nr;
}
