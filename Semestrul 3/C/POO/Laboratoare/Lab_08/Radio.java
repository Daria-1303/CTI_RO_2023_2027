class Radio{
    public void porneste(){
        System.out.println("Radioul s-a pornit!");
    }

    public void opreste(){
        System.out.println("Radioul s-a oprit!");
    }

    /* 
    public void cautaFrecventa(){
        System.out.println("S-a gasit un canal!");
    }
    */
    public void cautaFrecventa(int timpCautare, int frecMin, int frecMax){
        System.out.println("S-a gasit un canal!");
    }

}


//mosteneste metodele din clasa Radio
class RadioAutomat extends Radio{
    public void porneste(){
        /* 
        System.out.println("Radioul s-a pornit!");
        System.out.println("S-a gasit un canal!");
        */
        //avem acelasi output, se apeleaza linie cu linie din superclasa
        super.porneste();
        System.out.println("S-a gasit un canal!");
    }

    public void cautaFrecventa(int timpCautare, int frecMin, int frecMax){
        System.out.println("S-a gasit un canal!");
    }
    //nu se poate rescrie o metoda daca avem un modificator de acces restrictiv
    //daca functia returneaza Radio -> functia noastra poate returna orice subclasa de a clasei tipului
}

class Client{
    public static void main(String[] args) {
        RadioAutomat radioAutomat = new RadioAutomat();
        radioAutomat.porneste();
    }
}