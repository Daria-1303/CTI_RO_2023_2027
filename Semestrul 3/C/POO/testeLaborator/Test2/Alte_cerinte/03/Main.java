/*
Într-un magazin online, fiecare produs este caracterizat prin:

    nume (String),
    preț (double),
    stoc (int).

La adăugarea unui produs, dacă:
    Prețul este mai mic sau egal cu 0, se aruncă excepția InvalidPriceException.
    Stocul este negativ, se aruncă excepția InvalidStockException.

Metode necesare:
    Constructorul validării produsului.
    Metodă updateStock pentru a scădea sau adăuga produse în stoc, care poate arunca OutOfStockException dacă stocul devine insuficient.
 */

import java.util.ArrayList;

class Produs{
    private String nume;
    private double pret;
    private int stoc;

    public Produs(String nume, double pret, int stoc) throws InvalidPriceException, InvalidStockException{
        if(pret <= 0){
            throw new InvalidPriceException("Pretu nu e valid\n");
        }

        if(stoc < 0){
            throw new InvalidStockException("Stocul nu e valid\n");
        }

        this.nume = nume;
        this.pret = pret;
        this.stoc = stoc;
    }

    public int getStoc(){
        return stoc;
    }

    public void  setStoc(int stoc){
        this.stoc = stoc;
    }

    public String toString(){
        return "Nume : " + nume + " - Pret : " + pret + " - Stoc : " + stoc;
    }
}


class Magazin{
    ArrayList <Produs> produse = new ArrayList<>();

    public void adaugaProdus(Produs produs){
        if(!(produse.contains(produs))){
            produse.add(produs);
        }
    }

    public void updateStock(Produs produs, int cantitate, boolean adauga) throws OutOfStockException{ //true - adauga // false -sterge
        if(produse.contains(produs)){
            if(adauga){
                produs.setStoc(produs.getStoc() + cantitate);
            }
            else{
                if(produs.getStoc() - cantitate < 0){
                    throw new OutOfStockException("Nu sunt suficiente produse in stoc\n");
                }
                else{
                    produs.setStoc(produs.getStoc() - cantitate);
                }
            }
            
        }
    }

    public String toString(){
        return produse.toString();
    }
}

class InvalidPriceException extends Exception{ //RuntimeException
    public InvalidPriceException(String mesaj){
        super(mesaj);
    }
}

class InvalidStockException extends Exception{
    public InvalidStockException(String mesaj){
        super(mesaj);
    }
}

class OutOfStockException extends Exception{
    public OutOfStockException(String mesaj){
        super(mesaj);
    }
}

class Main{
    public static void main(String[] args) {
        Magazin m = new Magazin();
    

        try{
            Produs p1 = new Produs("mar", 3, 10);
            Produs p2 = new Produs("pere", 5, 20);
            Produs p3 = new Produs("prune", 4, 30);

            m.adaugaProdus(p1);
            m.adaugaProdus(p2);
            m.adaugaProdus(p3);

            System.out.println(m.toString());

            m.updateStock(p1, 5, true);
            m.updateStock(p2, 10, false);
            m.updateStock(p3, 20, false);

            System.out.println(m.toString());
        }catch(InvalidPriceException e1){
            System.out.println(e1.getMessage());
        }catch(InvalidStockException e2){
            System.out.println(e2.getMessage());
        }catch(OutOfStockException e3){
            System.out.println(e3.getMessage());
        }

        
    }
}