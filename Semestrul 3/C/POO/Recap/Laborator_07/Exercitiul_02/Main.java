/*
     Fie o clasa Punct care are doua campuri private x si y - coordonatele unui punct in plan.
     Clasa are un singur constructor cu doi parametri care permite init¸ializarea
    coordonatelor unui obiect Punct la crearea sa. 
    Clasa PunctColorat extinde (mosteneste) clasa Punct ¸si mai cont¸ine un cˆamp c reprezentˆand codul unei culori. 
    Argumentat¸i dac˘a este sau nu necesar˘a existent¸a unui constructor ˆın clasa PunctColorat    
    pentru ca s˘a putem crea obiecte PunctColorat ¸si, dac˘a da, dat¸i un exemplu de posibil
    constructor pentru aceast˘a clas˘a
 */

class Punct{
    private int x;
    private int y;

    public Punct(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

class PunctColorat extends Punct{
    private String c; // codul unei culori

    /*
     *  Da este necesar un constructor in clasa PunctColorat pentru a putea crea obiecte de tip PunctColorat
     *  Deoarece campurile x si y sunt private in clasa Punct, constructorul din clasa Punct nu poate fi apelat
     */
    public PunctColorat(int x, int y, String c) {
        super(x, y);
        this.c = c;
    }
}

class Main {
    public static void main(String[] args) {
        PunctColorat p = new PunctColorat(1, 2, "red");

        System.out.println(p);
        
        // PunctColorat p = new PunctColorat(1, 2); // eroare de compilare

        
    }    
}
