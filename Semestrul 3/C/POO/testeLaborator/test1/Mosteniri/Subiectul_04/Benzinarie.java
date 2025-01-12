class Benzinarie{
    private int cantitateBenzina;
    private Masina [] masini = new Masina[10];
    private int numarMasini;

    public Benzinarie(){
        this.numarMasini = 0;
    }

    public boolean alimenteazaMasina(Masina masina){
        if(cantitateBenzina >= masina.getCapacitateRezervor()){
            cantitateBenzina -= masina.getCapacitateRezervor();
            return true;
        }

        if(numarMasini < 10){
            masini[numarMasini ++] = masina;
            return true;
        }

        return false;
    }

    public String toString(){
        String rezultat = "Coada benzinarie : \n";

        for(int i = 0; i < numarMasini; i++){
            rezultat += masini[i].toString() + "\n";
        }

        return rezultat;
    }

    public void alimenteazaBenzinarie(int refillBenzina){
        cantitateBenzina += refillBenzina;

        while(numarMasini > 0){

            if(cantitateBenzina >= masini[0].getCapacitateRezervor()){
                cantitateBenzina -= masini[0].getCapacitateRezervor();

                for(int i = 1 ; i < numarMasini; i++){
                    masini[i - 1] = masini[i];
                }

                numarMasini--;
            }
            else{
                break;
            }
        }
    }

}