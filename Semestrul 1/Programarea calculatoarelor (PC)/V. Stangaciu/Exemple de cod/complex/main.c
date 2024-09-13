/* se include complex.h pentru a avea acces la declaratia tipului si la 
declaratiile functilor
- declaratiile sunt folosite in procesul de compilare pentru verificarea
sintaxei si a regulilor limbajului C
*/
#include "complex.h"
#include <stdio.h>


// un scurt program de test
int main(void)
{
  COMPLEX nr;
  nr = read_complex();
  print_complex(&nr);
  print_complex(&nr);
  print_complex(&nr);
  printf ("nr apeluri: %d\n", count);
  return 0;
}
