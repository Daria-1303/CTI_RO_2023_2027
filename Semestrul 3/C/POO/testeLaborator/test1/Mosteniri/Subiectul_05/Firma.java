class Firma{
    //caracteristici
    private String numeFirma;
    private int bugetFirma;
    private Angajat [] angajatiFirma = new Angajat[30];
    private int numarAngajati;

    //Constructor

    public Firma(String numeFirma, int bugetFirma){
        this.numeFirma = numeFirma;
        this.bugetFirma = bugetFirma;
        //this.angajatiFirma = new Angajat[30];
        this.numarAngajati = 0;
    }

    public boolean adaugaAngajat(Angajat angajatAdaugat){
        if(numarAngajati < 30){
            for(int i = 0; i < numarAngajati; i++){
                if(angajatiFirma[i].equals(angajatAdaugat)){
                    //angajatul exista deja deci nu poate fi adaugat
                    return false;
                }
            }

            angajatiFirma[numarAngajati] = angajatAdaugat;
            numarAngajati++;

            return true;
        }

        return false;
    }

    public String toString(){
        String rezultat = numeFirma + ": ";

        for(int i = 0; i < numarAngajati; i++){
            rezultat = rezultat + angajatiFirma[i].toString() + "\n";
        }

        return rezultat;
    }

    public int platesteSalarii(){
        int salariiTotale = 0;

        for(int i = 0; i < numarAngajati; i++){
            salariiTotale += angajatiFirma[i].getSalariuAngajat();
        }

        return (bugetFirma - salariiTotale);
    }

    public Angajat stergeAngajat(String nume){
        for(int i = 0; i < numarAngajati; i++){
            if(angajatiFirma[i].getNumeAngajat().equals(nume)){
                Angajat angajatSters = angajatiFirma[i];

                //am mutat toti angajatii
                for(int j = i; j < numarAngajati - 1; j ++){
                    angajatiFirma[j] = angajatiFirma[j + 1];
                }

                angajatiFirma[--numarAngajati] = null;

                return angajatSters;
            }
        }

        return null;
    }
}