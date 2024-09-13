/*
Se va scrie un program ce contine o baza de date de vehicule, implementata 
printr-un tablou.
Un element de tip vehicul va avea urmatoarele proprietati
vechicul
{
    nr_roti
    tip vehicul { trotineta, biciclta, automobil, autobuz }
    caracteristici 
          trotineta { electrica ; clasica }
	  bicicleta { nr viteze }
	  automobil { an fabricatie }
	  autobuz { nr locuri }
} 

se vor defini in detaliu structurile de date necesare implementarii unui element de tip vehicul de mai sus
- carateristicile sunt date in functie de tipul de vehicul si nu pot exista in acelasi timp, fiind disjuncte
*/

#include <stdio.h>
#include <stdint.h>

#define SIZE 10


// tip enum pentru definirea tipului de vehicul
enum tip_vehicul_t
  {
    trotineta,
    bicicleta,
    automobil,
    autobuz,
  };
// tip enum pentru definirea tipului de trotineta
enum tip_trotineta_t
  {
    electrica,
    clasica,
  };


/* un union ce implementeaza caracteristicile unui vehicul
 toate campurile vor partaja aceeasi zona de memorie si vor fi accesate
 in functie de necesitate
*/
union caracteristica_t
{
  enum tip_trotineta_t tip_trotineta; // pentru trotineta
  uint8_t nr_viteze; // pentru bicicleta
  uint16_t an_fabricatie; // pentru automobil
  uint8_t nr_locuri; // pentru autobuz
};


// tipul de date de tip vehicul
struct vehicul
{
  uint8_t nr_roti;
  enum tip_vehicul_t tip_vehicul;
  union caracteristica_t caracteristica;
};


/* functie de printare la stdout a unui element de tip vehicul
- primeste ca si argument un pointer catre o structura de tip vehicul
- nu se opteaza spre a se trimite o structura de tip vehicul ca si argument
pentru a se optimiza cantitatea de memorie ce va fi copiata pe stiva
--> se trimite astfel un pointer spre o zona de memorie ce contine structura
- pointerul s-a facut const pentru a se limita scrierea accidentala
 */
void print_vehicul(const struct vehicul *v)
{
  printf ("nr roti: %d\n", v->nr_roti);
  printf ("tip vehicul ");
  /*se face selectia dupa tipul vehiculului
  - pentru fiecare vehicul se va accesa un membru diferit din union ce are insemnatate
  pentru acel tip de vehicul
  */
  switch (v->tip_vehicul)
    {
    case trotineta:
      {
	printf ("trotineta ");
	switch (v->caracteristica.tip_trotineta)
	  {
	  case electrica:
	    {
	      printf ("electrica ");
	      break;
	    }
	  case clasica:
	    {
	      printf ("clasica ");
	      break;
	    }
	  }
	break;
      }
    case bicicleta:
      {
	printf ("bicicleta ");
	printf ("nr viteze: %d ", v->caracteristica.nr_viteze);
	break;
      }
    case automobil:
      {
	printf ("auto ");
	printf ("an fabricatie: %d", v->caracteristica.an_fabricatie);
	break;
      }
    case autobuz:
      {
	printf ("autobuz ");
	printf ("nr locuri %d", v-> caracteristica.nr_locuri);
      }
    }
  printf ("\n");
}


/* functie ce printeaza un tablou de vehicule
se itereaza tabloul si pentru fiecare element se apeleaza functia precedenta
- se primeste ca argument tabloul de vehicule (ca si pointer) si dimensiunea acestuia
 */
void print_vehicule(struct vehicul *vehicul, int count)
{
  for (int i = 0; i < count; i++)
    {
      print_vehicul(&vehicul[i]);
    }
}

int main(void)  
{
  uint32_t i = 0; // index pentru adaugarea unui tablou
  struct vehicul vehicule[SIZE]; // se declara un tablou de vehicule

  // se declara o trotineta si se completeaza campurile cu date
  struct vehicul trotineta1;
  trotineta1.nr_roti = 2;
  trotineta1.tip_vehicul = trotineta; // trotineta vine de la enum-ul tip_vehicul_t
  trotineta1.caracteristica.tip_trotineta = electrica; // electrica vine de la enum-ul tip_trotineta_t
  vehicule[i++] = trotineta1; // se adauga structura trotinetei in tabloul de vehicule

  // se declara o bicicleta si se completeaza campurile de date
  struct vehicul bici;
  bici.nr_roti = 2;
  bici.tip_vehicul = bicicleta; // bicicleta vine de la enum-ul tip_vehicul_t
  bici.caracteristica.nr_viteze = 18;
  vehicule[i++] = bici; // se adauga structura bicicletei in tabloul de vehicule

  // se declara un automobil si se completeaza campurile de date
  struct vehicul auto1;
  auto1.nr_roti = 4;
  auto1.tip_vehicul = automobil; // automobil vine de la enum-ul tip_vehicul_t
  auto1.caracteristica.an_fabricatie = 2020;
  vehicule[i++] = auto1; // se adauga structura automobilului in tabloul de vehicule

  // se declara un autobuz si se completeaza campurile de date
  struct vehicul autobuz1;
  autobuz1.nr_roti = 4;
  autobuz1.tip_vehicul = autobuz; // autobuz vine de la enum-ul tip_vehicul_t
  autobuz1.caracteristica.nr_locuri = 30;
  vehicule[i++] = autobuz1; // se adauga structura autobuzului in tabloul de vehicule

  // se apeleaza functia de printare a bazei de date implementata sub forma unui tablou de vehicule
  print_vehicule(vehicule, i); 
  
  return 0;
}
