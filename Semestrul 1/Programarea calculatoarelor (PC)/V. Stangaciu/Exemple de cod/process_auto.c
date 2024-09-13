#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
/*
program ce citeste un fisier precum parc-auto-2013.csv ce contine linii in 
format CSV cu campuri de date desparite prin virgula. fisierul contine si un
"cap de tabel" ce explica campurile
Programul citeste un astfel de fisier primit ca si argument in linie de comanda
si extrage campurile judet, marca, descriere, si total
Se poate observa ca in fisierul de test fiecare camp este pus intre ghilimele
si astfel se va dori eliminarea acestora
 */

// o dimensiune maxima a unui camp
#define SIZE_TEXT 100
// o dimensiune maxima considerata a unei linii
#define LINE_SIZE 5000

// tipul de date utilizator denumit AUTO ce contine o structura 
typedef struct
{
  char judet[SIZE_TEXT + 1];
  char marca[SIZE_TEXT + 1];
  char denumire[SIZE_TEXT + 1];
  uint32_t total;
}AUTO;


// functie de printare a unui element de tip AUTO
void printAuto(AUTO *data)
{
  printf ("%s - %s - %s - %d\n", data-> judet, data->marca, data->denumire, data->total); 
}

/*
functie de de procesare a unei linii. aceasta functie primeste ca argument
print "line" o linie in formatul asteptat, cauta campurile necesare desparite
print virgula si le scrie in zona de memorie de tip AUTO, denumita data
data este ptr deoarece functia va scrie in aceasta variabila - parametrul data
il consideram un parametru de iesire pentru functie
- functia returneaza 0 daca a reusit sa proceseze cu succes o linie si a reusit
sa extraga datele conform specificatiei
- functia returneaza o valoare != 0 daca nu a reusit sa proceseze corect o linie
 */
uint8_t processLine(char *line, AUTO *data)
{
  char *field = NULL; // variabila auxiliara pentru a referentia un camp extras cu strtok
  /*
se apeleaza prima data strtok in care i se da linia si delimitatorul ( in cazul nostru.. virgula)
strtok returneaza NULL cand nu mai gaseste vreun delimitator
   */
  field = strtok(line, ",");
  if (field == NULL)
    {
      return 1;
    }
    
  // judet
  /* se copiaza campul extras de strtok in data->judet
     se copiaza incepand cu  field[1] ca sa nu se copieze caracterul ghilimele
de la inceput
   */
  strcpy(data->judet, field + 1);
  // se elimina caracterul ghilimele de la sfarsit
  data->judet[strlen(data->judet)-1] = 0;      

  /*
se apeleaza strtok a doua oara. pentru a se pastra acelasi string ce s-a dat
la apelul anterior strtok cere conform documentatiei sa se apele cu NULL ca prim
argument. daca s-ar apela cu un nou string atunci se va obtine campul pentru acela
daca se apeleaza din nou cu line atunci se va obtine acelasi lucru ca si la apelul anterior
se tot apeleaza strtok pana cand se ajunge la campul de interes --> evident, se putea folosi intr-o bucla for, s-a implementat asa doar din motive didactice
   */
  
  field = strtok(NULL, ",");
  if (field == NULL)
    {
      return 1;
    }

  field = strtok(NULL, ",");
  if (field == NULL)
    {
      return 1;
    }


  /* se extrage campul marca si se aplica acelasi algoritm pentru a se evita
copierea ghilimelelor 
se copiaza datele din data->marca
   */
  field = strtok(NULL, ",");
  if (field == NULL)
    {
      return 1;
    }
  strcpy(data->marca, field + 1);
  data->marca[strlen(data->marca)-1] = 0;

  // se extrage campul denumire si se copiaza in data->denumire
  field = strtok(NULL, ",");
  if (field == NULL)
    {
      return 1;
    }
  strcpy(data->denumire, field + 1);
  data->denumire[strlen(data->denumire)-1] = 0;

  /* se extrage campul total si se converteste la intreg inainte de a se putea
scrie in data->total
      */
  field = strtok(NULL, ",");
  if (field == NULL)
    {
      return 1;
    }
  /* se apeleaza strtol pentru conversie de la string la intreg in baza 10
   se converteste incepand cu field[1] pentru a se evita caracterul
ghilimea de la inceput. strtol va converti pana la primul caracter ce nu e digit
in cazul nostru pana la urmatoarea ghilimea
- se putea scrie si strtol(&field[1], NULL, 10);
  */
  data->total = strtol(field + 1, NULL, 10);    

  return 0;
}


/* functie ce adauga un element de tip AUTO dat de parametru data 
intr-un tablou de astfel de structuri dat de parametrul array de dimensiune size
- se face o adaugare intr-un tablou declarat static de o dimensiune maxima fixa
- functia verifica sa nu depaseasca limita si returneaza index-ul pana la care a adaugat
 */
int32_t addAutoStatic(AUTO *array, AUTO *data, uint32_t size)
{
  static uint32_t index = 0;
  if (index < size)
    array[index++] = *data;
  return index;
}

// functie de printare a tabloului de structuri
void printArray(AUTO *array, uint32_t size)
{
  for (int i = 0; i < size; i++)
    {
      printAuto(&array[i]);
    }
}


/*
functie ce scrie in fisierul cu calea data de argumentul filename,
toate masinile de o anumita marca din tabloul array de dimensiune size
functia scrie in fisier si numarul total de masini de marca data ca argument
 */
void printCars(AUTO *array, uint32_t size, char *filename, char *marca)
{
  FILE *out = NULL;
  if ((out = fopen(filename, "w")) == NULL)
    {
      perror(NULL);
      exit(-1);
    }
  uint32_t count = 0;
  for (int i = 0; i < size; i++)
    {
      if (strcmp(array[i].marca, marca) == 0)
	{
	  AUTO *data = &array[i];
	  fprintf (out, "%s - %s - %s - %d\n", data-> judet, data->marca, data->denumire, data->total);
	  count = count + data->total;
	}
    }
  fprintf(out, "total %s = %d\n", marca, count);
  fclose(out);
}


/*
programul accepta ca argumente
1 - calea fisierului de intrare (parc-auto-2013.csv)
2 - calea fisierul de iesire (ex: output.txt)
3 - marca de masini (ex: DACIA)
 */
int main(int argc, char **argv)
{
  static char line[LINE_SIZE + 1]; // un buffer auxiliar pentru citirea unei linii
  static AUTO array[300000]; // un tablou de tipuri de date AUTO declarat cu static pentru a nu depasi stiva
  AUTO e;
  uint32_t count = 0;
  if (argc < 4) // verificarea numarului de argumente cu care programul a fost lansat in linie de comanda
    {
      printf ("usage error\n");
      exit(-1);
    }
  FILE *f = NULL;
  if ((f = fopen(argv[1], "r")) == NULL)
    {
      perror(argv[1]);
      exit(-1);
    }
  fgets(line, LINE_SIZE, f);
  uint32_t index = 0;
  while (fgets(line, LINE_SIZE, f) != NULL)
    {
      // se citeste fisierul linie cu linie pana cand nu mai sunt linii de citit
      // se proceseaza linia si se vor scrie rezultate in variabila e (trimisa ca ptr cu & (adresa) )
      if (processLine(line, &e) == 0) 
	{
	  // daca linia corecta s-a procesat corect, elementul rezultat se adauga in tabloul array
	  index = addAutoStatic(array, &e, 300000);
	}

    }
  // se printeaza tabloul intreg la stdout
  printArray(array, index);
  printCars(array, index, argv[2], argv[3]);// se apeleaza functia printCars cu argumentele necesare
  // se inchide fisierul
  if (fclose(f) != 0)
    {
      perror(NULL);
      exit(-1);
    }
  
  return 0;
}
