class Telefon{
    private String numeProprietar;
    private String [] apelatori = new String[100];
    private int contorApeluri;


    public Telefon(String numeProprietar){
        this.numeProprietar = numeProprietar;
        this.contorApeluri = 0;
    }

    /*
    public boolean apeleaza1(Telefon apelator){
        if(this.contorApeluri < 100){
            apelatori[contorApeluri++] = apelator.numeProprietar;
            return true;
        }

        return false;
    }
    */


    public boolean apeleaza(Telefon telefonApelat){
        if(this.contorApeluri < 100){
            telefonApelat.apelatori[telefonApelat.contorApeluri++] = this.numeProprietar;
            return true;
        }

        return false;
    }

    public Integer numarDeApeluri(String numeProprietarTelefon){
        Integer nrApeluri = 0;

        for(int i = 0; i < contorApeluri; i++){
            if(apelatori[i].equals(numeProprietarTelefon)){
                nrApeluri++;
            }
        }

        return nrApeluri;
    }

    public String toString(){
        String output = "Nume proprietar : " + numeProprietar + "\n Apelanti : ";
        String temp[] = new String[100];

        //asta afiseaza toti apelatorii
        for(int i = 0; i < this.contorApeluri; i++){
            output += apelatori[i] + " ";
        }


        //for(int i = 0;  )

        return output;
    }

}
