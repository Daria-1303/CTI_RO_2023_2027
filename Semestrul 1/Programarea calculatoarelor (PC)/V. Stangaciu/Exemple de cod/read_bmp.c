#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/*
Un program ce citeste cateva campuri dintr-un fisier bmp
Se citeste semnatura de la inceput, campul ce contine dimensiunea lui DIB header
si campurile ce contine rezolutia width si height
- s-a folosit structura unui fisier bmp de la urmatorul link:

https://en.wikipedia.org/wiki/BMP_file_format

bmp-ul folosit este de tip BM - Windows 3.1x, 95, NT, ... etc in care
DIB header-ul este de tip BITMAPINFOHEADER

programul aceasta nu are sens fara consultarea documentatiei despre fisierul
bmp din link-ul precedent
 */


int main(void)
{
  FILE *f = NULL;
  
  if ((f = fopen("electro.bmp", "r")) == NULL)
    {
      perror(NULL);
      exit(-1);
    }

  // se citeste semnatura header field din bitmap file header, de la offset 0, 2 bytes
  char header[3];
  uint32_t file_size = 0;
  fread(header, sizeof(char), 2, f); 
  header[2]=0; // conform documentatiei ne asteptam sa fie 2 litere deci vom interpreta ca string si deci punem \0 la final
  printf ("%s\n", header); // printam semnatura obtinuta (BM)

  // citim campul ce contine dimenisunea fisierului
  // din bitmap file header, offset 0x02 pe 4 bytes
  fread(&file_size, sizeof(uint32_t), 1, f);
  printf ("%d - %08X\n", file_size, file_size); // printam dimensiunea in zecimal si hexazecimal

  /* conform documentatiei mergem in fisier la offsetul 0x0E fata de inceput
     ca sa ajungem la DIB header de tip BITMAPINFOHEADER
     citim de acolo de la offsetul 0x0E dimensiunea DIB headerului pe 4 bytes
     care conform documentatiei trebuie sa fie 40 bytes
   */
  fseek(f, 0x0E, SEEK_SET); // mergem la deplasamentul 0x0E fata de inceputul fisierului
  uint32_t size2;
  fread(&size2, sizeof(uint32_t), 1, f); // citim un intreg pe 4 bytes
  printf ("%d\n", size2);

  /*
    dupa campul cu domensiunea dib header-ului urmeaza o campuri de 4 bytes
    fiecare ce contin rezolutia
    le citim pe fiecare in 2 variabile diferite
   */
  uint32_t w,h;
  fread(&w, sizeof(uint32_t), 1, f); // citim width
  fread(&h, sizeof(uint32_t), 1, f); // citim height
  printf ("%dx%d\n", w, h); // printam rezolutie


  
  if (fclose(f) != 0) // inchidem fisierul
    {
      perror(NULL);
      exit(-1);
    }
  return 0;
}
