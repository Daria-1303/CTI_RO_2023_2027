/*
    Se dorește gestionarea utilizatorilor dintr-un sistem prin verificarea atributelor acestora. 
    Fiecare utilizator este caracterizat printr-un nume (String) și o vârstă (int). 
  
    La crearea unui utilizator, dacă numele este gol sau null, se va arunca o excepție InvalidNameException. 
  
    Dacă vârsta este mai mică decât 18 sau mai mare decât 100, se va arunca o excepție InvalidAgeException.
    Metode necesare:

        Constructorul pentru validare.
        Metodă toString pentru reprezentare.
 */

import java.util.ArrayList;

class Utilizator{
    private String nume;
    private int varsta;

    public Utilizator(String nume, int varsta) throws InvalidNameException, InvalidAgeException{
        if(nume == null || nume == ""){
            throw new InvalidNameException("Nu ati dat un nume valid \n");
        }

        this.nume = nume;

        if(varsta < 18 || varsta > 100){
            throw new InvalidAgeException("Varsta nu este valida \n");
        }

        this.varsta = varsta;
    }

    public String toString(){
        return "Nume : " + nume + " - Varsta : " + varsta;
    }
}

class InvalidNameException extends Exception{
    public InvalidNameException(String mesaj){
        super(mesaj);
    }
}

class InvalidAgeException extends Exception{
    public InvalidAgeException(String mesaj){
        super(mesaj);
    }
}

class Main{
    public static void main(String[] args) {
        ArrayList<Utilizator> utilizatori = new ArrayList<>();

        try {
            utilizatori.add(new Utilizator("Daria", 20));
            utilizatori.add(new Utilizator("Dana", 25));
            System.out.println(utilizatori.get(0).toString());
            utilizatori.add(new Utilizator("D", 15)); // se va produce exceptie
        } catch (InvalidNameException e) {
            System.out.println(e.getMessage());
        }catch(InvalidAgeException e2){
            System.out.println(e2.getMessage());
        }
    }
}