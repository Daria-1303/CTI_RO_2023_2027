import java.util.LinkedList;

interface ISalariu {
    double calculeazaVenit(int minuteVizionate);
}

abstract class User implements ISalariu{
    protected String nume;

    public User(String nume){
        this.nume = nume;
    }
}

class Subscriber extends User{
    private int nivelSubscribtie;

    public Subscriber(String nume, int nivelSubscribtie){
        super(nume);
        this.nivelSubscribtie = nivelSubscribtie;
    }

    public double calculeazaVenit(int minuteVizionate){
        return minuteVizionate * 1.5 * nivelSubscribtie;
    }

    public String toString(){
        return "Nume : " + nume + " - subcriber - Nivel : " + nivelSubscribtie + "\n";
    }
}

class Creator extends User{
    private LinkedList<Subscriber> abonati;

    public Creator(String nume){
        super(nume);
        this.abonati = new LinkedList<Subscriber>();
    }

    public void adaugaSubscriber(Subscriber subscriberDeAdaugat){
        if(!(abonati.contains(subscriberDeAdaugat))){
            abonati.add(subscriberDeAdaugat);
        }
    }

    public double calculeazaVenit(int minuteVizionate){
        double venitTotal = 0;

        for(Subscriber s: abonati){
            venitTotal += s.calculeazaVenit(minuteVizionate);
        }

        return venitTotal;
    }

    public String toString(){
        return "Nume : " + nume + " - creator - Abonati : \n \t \t" + abonati.toString(); 
    }
}

class Platforma{
    LinkedList<User> utilizatori = new LinkedList<User>();

    public boolean adaugaUtilizator(User utilizatoDeAdaugat){
        if(utilizatori.size() < 1000){
            if(!(utilizatori.contains(utilizatoDeAdaugat))){
                utilizatori.add(utilizatoDeAdaugat);
                return true;
            }
        }
        return false;
    }

    public User determinaVIP(int minuteVizionate){
        User utilizatorVIP = null;
        double venitMaxim = -1;
        
        for(User u : utilizatori){
            if(venitMaxim < u.calculeazaVenit(minuteVizionate)){
                venitMaxim = u.calculeazaVenit(minuteVizionate);
                utilizatorVIP = u;
            }
        }

        return utilizatorVIP;
    }
}

class Main{
    public static void main(String[] args) {
        Platforma Youtube = new Platforma();

        Creator creator1 = new Creator("Creator1");
        Creator creator2 = new Creator("Creator2");

        Subscriber subscriber1 = new Subscriber("Subscriber1", 1);
        Subscriber subscriber2 = new Subscriber("Subscriber2", 2);
        Subscriber subscriber3 = new Subscriber("Subscriber3", 3);
        Subscriber subscriber4 = new Subscriber("Subscriber4", 4);
        Subscriber subscriber5 = new Subscriber("Subscriber5", 5);
        Subscriber subscriber6 = new Subscriber("Subscriber6", 6);

        creator1.adaugaSubscriber(subscriber1);
        creator1.adaugaSubscriber(subscriber2);

        creator2.adaugaSubscriber(subscriber3);
        creator2.adaugaSubscriber(subscriber4);
        creator2.adaugaSubscriber(subscriber5);

        Youtube.adaugaUtilizator(creator1);
        Youtube.adaugaUtilizator(creator2);
        Youtube.adaugaUtilizator(subscriber1);

        System.out.println(Youtube.determinaVIP(100).toString());

        System.out.println("------------------------");

        System.out.println(creator1.toString());
        System.out.println(creator2.toString());

    }
}