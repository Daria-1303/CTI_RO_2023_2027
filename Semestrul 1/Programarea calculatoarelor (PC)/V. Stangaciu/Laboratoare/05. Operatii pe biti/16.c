/*
16
Scrieti si testati cu date de la intrare o functie care ia ca parametri doua numere intregi si returneaza suma lor,
 folosind operatori pe biti. Calculati suma bit cu bit, cu propagarea transportului, cu algoritmul de adunare pe hartie pencil-and-paper,
  fara a folosi operatori aritmetici.
PROBLEMA 17:
  Scrieti si testati cu date de la intrare o functie care ia ca parametri doua numere intregi si returneaza diferenta lor, folosind operatori pe biti. 
  Calculati diferenta bit cu bit, cu propagarea transportului, cu algoritmul de scadere pe hartie pencil-and-paper, fara a folosi operatori aritmetici.
*/

#include <stdio.h>
#include <stdint.h>

uint32_t suma(uint32_t a, uint32_t b)
{
  uint32_t suma = 0;
  uint32_t transport = 0;
  uint32_t bit_a, bit_b, bit_suma;
  for(int i = 0; i < 32; i++)
    {
      bit_a = a & 1; // luam bitul curent din a
      bit_b = b & 1; // luam bitul curent din b

      bit_suma = bit_a ^ bit_b ^ transport; // calculam bitul sumei

      transport = (bit_a & bit_b) | (bit_a & transport) | (bit_b & transport); // calculam 
      
      suma |= bit_suma << i; // punem bitul sumei la locul lui

      a = a >> 1; // sarim la urmatorul bit
      b = b >> 1; // sarim la urmatorul bit
    }

  return suma;
}

int add(int x, int y) {
    while (y != 0) {
        int carry = x & y; // calculam transportul
        x = x ^ y; // calculam bitul sumei
        y = carry << 1; // sarim la urmatorul bit
    }
    return x;
}

int subtract(int x, int y) {
    while (y != 0) {
      // luam bitul curent din y si il adunam cu bitul curent din x
        int carry = (~x) & y; // calculam transportul
        x = x ^ y; // calculam bitul sumei
        y = carry << 1; // sarim la urmatorul bit
    }
    return x;
}

int main(void)
{
  uint32_t a, b;
  printf("Introduceti doua numere intregi: ");
  scanf("%u %u", &a, &b);

  uint32_t rez = suma(a, b);

  printf("Suma este: %u", rez);

  int rez2 = subtract(a, b);
  printf("\nDiferenta este: %d", rez2);

  return 0;
}