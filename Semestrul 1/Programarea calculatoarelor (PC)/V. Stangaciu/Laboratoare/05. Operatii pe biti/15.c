#include <stdio.h>
#include <stdint.h>

/*
Să se scrie o funcție care ia un număr fără semn n și returnează
numărul de segmente de biți consecutivi egali.
Exemplu: 000100 are 3 segmente: 000, 1, 00, deci programul va returna 3
*/

uint64_t seg_consec(uint64_t num)
{
    uint64_t seg = 1, mask = 1UL << 63;
    uint8_t prev = (num & mask) != 0; // 0 pt ca numarul este fara semn

    mask >>= 1;
    while(mask)
    {
        if (prev != ((num & mask) != 0))
        {
            prev = (num & mask) != 0;
            seg++;
        }

        mask >>= 1;
    }

    return seg;
}

int main(void)
{
    uint64_t num = 0b0010100;
    printf("%llu", seg_consec(num));
    return 0;
}

/*

#include <stdio.h>
#include <stdint.h>

uint32_t segment(uint32_t n)
{
  if ( n == 0 )
    {
      return 1;
    }
  uint32_t nr_seg = 1; // primul bit
  int ultim_bit = n & 1; // luam primul bit
  n = n >> 1; // sarim peste primul bit
  while( n > 0)
    {
      int bit_curent = n & 1; // luam bitul curent
      if(bit_curent != ultim_bit) // daca bitul curent e diferit de ultimul bit
	{
	  nr_seg ++;         // crestem nr de seg   
	  ultim_bit = bit_curent; // ultimul bit devine bitul curent
	}
      n = n >> 1; // sarim la urmatorul bit
    }
  return nr_seg + 1; // adaugam 1 pentru ca nu am luat in considerare ultimul bit
}

int main(void)
{
  uint32_t n; 
  printf("Introduceti un numar fara semn: ");
  scanf("%u", &n);

  uint32_t rez = segment(n);

  printf("Nr de seg este: %u" , rez);
  return 0;
}

*/