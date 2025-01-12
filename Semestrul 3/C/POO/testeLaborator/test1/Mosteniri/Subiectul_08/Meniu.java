class Meniu{
    private int cantitateMaximaCaloriiPermise;
    private FelDeMancare [] feluriMancare;
    private int numarFeluriMancare;

    public Meniu(int cantitateMaximaCaloriiPermise){
        this.cantitateMaximaCaloriiPermise = cantitateMaximaCaloriiPermise;
        this.feluriMancare = new FelDeMancare[10];
        this.numarFeluriMancare = 0;
    }

    private int totalCaloriiMeniu(){
        int total = 0;
        for(int i = 0; i < numarFeluriMancare; i++){
            total += feluriMancare[i].getNumarCalorii();
        }

        return total;
    }

    public boolean adaugaFelDeMancare(FelDeMancare felAdaugat){
        int totalCalorii = totalCaloriiMeniu() + felAdaugat.getNumarCalorii();
        if((numarFeluriMancare < 10) && (totalCalorii < cantitateMaximaCaloriiPermise)) {
            feluriMancare[numarFeluriMancare++] = felAdaugat;

            return true;
        }

        return false;
    }

    public String toString(){
        String rezultat = "Meniu cu maxim " + cantitateMaximaCaloriiPermise + " calorii: ";

        for(int i = 0; i < numarFeluriMancare; i++){
            rezultat += feluriMancare[i].toString() + " ";
        }

        return rezultat;
    }

    public boolean schimbaFelDeMancare(FelDeMancare felIntrodus){
        for(int i = 0; i < numarFeluriMancare; i++){
            if(feluriMancare[i].equals(felIntrodus)){
                feluriMancare[i] = felIntrodus;
                return true;
            }
        }

        return false;
    }
}