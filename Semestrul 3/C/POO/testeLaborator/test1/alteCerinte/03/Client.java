/*
Creează un program care gestionează o bibliotecă de articole științifice. Fiecare articol are un titlu, 

autor și un an de publicare. Creează două clase, BibliotecaArticole și Articol, și implementează:

adaugaArticol(Articol articol): adaugă un articol în bibliotecă doar dacă nu există deja un articol 
cu același titlu și autor.

afiseazaArticole(): afișează toate articolele din bibliotecă în formatul "Titlu: [titlu], Autor: 
[autor], An: [an]".

articoleDupaAn(int an): returnează o listă cu toate articolele publicate într-un anumit an.

articoleAutor(String autor): returnează o listă cu toate articolele scrise de un anumit autor.
 */

class Client{
    public static void main(String []args){
        BibliotecaArticole biblioteca = new BibliotecaArticole();

        Articol articol1 = new Articol("IT", "Bianca", 2024);
        Articol articol2 = new Articol("IDK", "Daria", 2020);
        Articol articol3 = new Articol("MOR", "Daria", 2004);

        biblioteca.adaugaArticol(articol1);
        biblioteca.adaugaArticol(articol2);
        biblioteca.adaugaArticol(articol3);

        System.out.println("Toate articolele:\n" + biblioteca.afiseazaArticole());

        System.out.println(biblioteca.articoleDupaAn(2020));
        System.out.println(biblioteca.articoleAutor("Daria"));
    }
}