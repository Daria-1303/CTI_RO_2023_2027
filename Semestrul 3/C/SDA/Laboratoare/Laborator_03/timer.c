/* fisierul timer.c */
#include <time.h>
#include "timer.h"
clock_t aux; 
void starton(void)
{ aux=clock(); 
} 
float startoff(void)
{ return(clock()-(float)aux)/CLK_TCK;
} 