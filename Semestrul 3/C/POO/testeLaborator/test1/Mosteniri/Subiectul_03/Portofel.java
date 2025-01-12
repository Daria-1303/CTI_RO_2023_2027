class Portofel{
    private String numeProprietar;
    private Card [] carduri = new Card[6];
    private int numarCarduri;

    //constructor
    public Portofel(String numeProprietar){
        this.numeProprietar = numeProprietar;
        this.numarCarduri = 0;
    }

    public boolean adaugaCard(String numarCard, double soldCard){
        if(numarCarduri < 6){
            Card cardAdaugat = new Card(numarCard, soldCard);

            for(int i = 0; i < numarCarduri; i++){
                if(carduri[i].equals(cardAdaugat)){
                    return false;
                }
            }

            carduri[numarCarduri ++] = cardAdaugat;

            return true;
        }

        return false;
    }

    public String toString(){
        String rezultat = "Portofelul lui " + numeProprietar + ": \n";

        for(int i = 0; i < numarCarduri; i++){
            rezultat += (i + 1) + " : " + carduri[i].toString() + "\n";
        }

        return rezultat;
    }

    public double calculeazaSold(){
        double soldTotal = 0;

        for(int i = 0; i < numarCarduri; i++){
            soldTotal += carduri[i].getSoldCard();
        }

        return soldTotal;
    }
}