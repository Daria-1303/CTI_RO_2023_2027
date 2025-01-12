#include <stdio.h>
#ifndef pixel
//#define pixel
typedef struct pixel {
	int vizit;
	int stare;
}pixel;

void eliberare2(pixel** s, int n, int m);

void citire2(pixel** s, int n, int m, FILE* f);

int pix(pixel** s, int n, int m);

#endif