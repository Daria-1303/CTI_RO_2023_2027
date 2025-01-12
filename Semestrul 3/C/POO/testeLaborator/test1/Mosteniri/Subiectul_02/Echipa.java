class Echipa{
    private Jucator [] titulari = new Jucator[11];
    private Jucator [] rezerve = new Jucator[13];

    public Echipa(Jucator[] titulari, Jucator[] rezerve){
        this.titulari =  titulari;
        this.rezerve = rezerve;
    }

    public boolean efectueazaSchimbare(Jucator titularSchimbat, Jucator rezervaIntrodusa){
        int pozitieTitular = -1;
        int pozitieRezerva = -1;

        for(int i = 0; i < titulari.length; i++){
            if(titulari[i].equals(titularSchimbat)){
                pozitieTitular = i;
                break;
            }
        }

        if(pozitieTitular == -1){
            return false;
        }

        for(int i = 0; i < rezerve.length; i++){
            if(rezerve[i].equals(rezervaIntrodusa)){
                pozitieRezerva = i;
                break;
            }
        }

        if(pozitieRezerva == -1){
            return false;
        }

        titulari[pozitieTitular] = rezervaIntrodusa;
        rezerve[pozitieRezerva] = titularSchimbat;

        return true;
    }
    

    public boolean efectueazaSchimbare2(Jucator titularSchimbat, Jucator rezervaIntrodusa){
        int pozitieTitular = 0;
        int pozitieRezerva = 0;

        for(Jucator j : this.titulari){
            //practic j == titulari[0], j == titulari[1] si tot asa
            
            if(titularSchimbat.equals(j)){

                for(Jucator k : this.rezerve){
                    if(rezervaIntrodusa.equals(k)){

                        titulari[pozitieTitular] = rezervaIntrodusa;
                        rezerve[pozitieRezerva] = titularSchimbat;

                        //j = rezervaIntrodusa;
                        //k = titularSchimbat;

                        return true;
                    }
                    pozitieRezerva++;
                }

                return false;
            }

            pozitieTitular++;
        }

        return false;
    }

    public String toString(){
        String rezultat = "Titulari : \n"; //sau new String("Titulari : ")

        for(int i = 0; i < titulari.length; i++){
            rezultat +=  titulari[i].toString() + "\n";
        }

        rezultat += "Rezerve: \n";

        for(int i = 0; i < rezerve.length; i++){
            rezultat +=  rezerve[i].toString() + "\n";
        }

        return rezultat;
    }

}