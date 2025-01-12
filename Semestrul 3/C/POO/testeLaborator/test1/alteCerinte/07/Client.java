/*
Creează un sistem de gestionare a produselor într-un magazin, cu suport pentru aplicarea de reduceri și afișarea prețurilor finale.

Clasa Produs: conține numele produsului, ID-ul unic, prețul și stocul disponibil.
Clasa Reducere: conține un procent de reducere și o dată de expirare.
Clasa Magazin: gestionează lista de produse și reduceri aplicabile.
Metodă pentru a adăuga un nou produs.
Metodă pentru a adăuga o reducere pentru un anumit produs.
Metodă pentru a calcula prețul final al unui produs, ținând cont de reducerile active.
Metodă pentru a elimina produsele cărora le-a expirat stocul.
Suprascrie equals și toString pentru Produs și Reducere, comparând produsele după ID și reducerile după dată și procent. În Magazin, adaugă o metodă pentru a afișa toate produsele care au o reducere activă și prețul final actualizat.
 */