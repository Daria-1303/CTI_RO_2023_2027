import java.util.ArrayList;
abstract class Destinatar{
    protected String nume; // acesta este unic
    
    public Destinatar(String nume){
        this.nume = nume;
    }

    public abstract void receptioneaza(Utilizator expeditor, String mesaj);
    public abstract String toString();
    public abstract boolean equals(Object o);
}

class Utilizator extends Destinatar{
    private String jurnal; //aici se acumuleaza toate mesajele trimise / primite

    public Utilizator(String nume){
        super(nume);
        jurnal = "";
    }

    public void receptioneaza(Utilizator expeditor, String mesaj){
        if(expeditor.equals(this)){
            return ;
        }

        jurnal += "Primit de la " + expeditor.nume + " mesajul: " + mesaj + "\n";
    }

    public void trimite(Destinatar destinatar, String mesaj){
        jurnal += "Trimis catre " + destinatar.nume + "   mesajul: " + mesaj + "\n";
        destinatar.receptioneaza(this, mesaj);
    }

    public boolean equals(Object o){
        if(o instanceof Utilizator){
            Utilizator otherUtilizator = (Utilizator) o;

            return this.nume.equals(otherUtilizator.nume);
        }

        return false;
    }

    public String toString(){
        return nume + ":\n" + jurnal;
    }
}

class Grup extends Destinatar{
    private ArrayList<Destinatar> destinatari;

    public Grup(String nume){
        super(nume);
        destinatari = new ArrayList<Destinatar>();
    }

    public void inscrie(Destinatar destinatar) throws DestinatarDuplicat{
        if(destinatari.contains(destinatar)){
            throw new DestinatarDuplicat("Destinatarul " +destinatar.nume +" este deja inscris in grupul : " + this.nume);
        }

        destinatari.add(destinatar);

        // se va trata catch-ul in main
    }

    public void receptioneaza(Utilizator expeditor, String mesaj){
        for(Destinatar destinatar : destinatari){
            destinatar.receptioneaza(expeditor, mesaj);
        }
    }

    public String toString(){
        String rezultat = nume + ":\n";

        for(Destinatar destinatar : destinatari){
            rezultat += destinatar.toString() + "\n";
        }

        return rezultat;
    }
    
    /*
     * public String toString(){
     *    return nume + ":\n" + destinatari.toString();
     * }
     */

    public boolean equals(Object o){
        if(o instanceof Grup){
            Grup otherGrup = (Grup) o;

            return this.nume.equals(otherGrup.nume);
        }

        return false;
    }
}

class DestinatarDuplicat extends Exception{
    public DestinatarDuplicat(String mesaj){
        super(mesaj);
    }
}

class Main{
    public static void main(String[] args) {
        // creare grupuri
        Grup grup1 = new Grup("Carnivorii");

        // creare utilizatori
        Utilizator utilizator1 = new Utilizator("Dan");
        Utilizator utilizator2 = new Utilizator("Marius");
        Utilizator utilizator3 = new Utilizator("Alex");

        // inscriere utilizatori in grupuri
        try{
            grup1.inscrie(utilizator1);
            grup1.inscrie(utilizator2);
            grup1.inscrie(utilizator3);
            grup1.inscrie(utilizator1); // ar trebui sa arunce exceptie
        }catch(DestinatarDuplicat e){
            System.out.println(e.getMessage());
        }

        // trimitere mesaje
        utilizator3.trimite(grup1, "Am deschis magazinul");
        utilizator2.trimite(grup1, "Vin acuma");

        // afisare jurnale
        //System.out.println(grup1);

        System.out.println(utilizator1);
        System.out.println(utilizator2);
        System.out.println(utilizator3);
    }
}
