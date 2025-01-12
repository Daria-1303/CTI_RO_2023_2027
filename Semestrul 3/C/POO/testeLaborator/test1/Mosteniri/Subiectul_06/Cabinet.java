class Cabinet{
    private String numeAvocat;
    private int numarCazuri = 0;
    private String [] cazuriInDerulare;

    public Cabinet(String numeAvocat){
        this.numeAvocat = numeAvocat;
        this.numarCazuri = 0;
        this.cazuriInDerulare = new String [40];
    }

    public boolean adaugaCaz(String reclamant, String acuzat){
        if(numarCazuri < 40){
            cazuriInDerulare[numarCazuri ++] = reclamant + " vs. " + acuzat;
            return true;
        }

        return false;
    }

    public Cabinet formeazaAlianta(Cabinet cabinet2){
        if((this.numarCazuri + cabinet2.numarCazuri) < 40){
            Cabinet cabinetCreat = new Cabinet(this.numeAvocat + " - " + cabinet2.numeAvocat);

            cabinetCreat.numarCazuri = this.numarCazuri + cabinet2.numarCazuri;

            for(int i = 0; i < this.numarCazuri; i++){
                cabinetCreat.cazuriInDerulare[i] = this.cazuriInDerulare[i] + "\n";
            }

            for(int i = 0; i < cabinet2.numarCazuri; i++){
                cabinetCreat.cazuriInDerulare[this.numarCazuri + i] = cabinet2.cazuriInDerulare[i] + "\n";
            }

            return cabinetCreat;
        }

        return null;
    }

    public String toString(){
        String rezultat = this.numeAvocat + "\n";

        for(int i = 0; i < numarCazuri; i++){
            rezultat += "" + cazuriInDerulare[i] + "\n";
        }

        return rezultat;
    }
}