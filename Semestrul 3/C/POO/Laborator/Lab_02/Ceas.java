class Ceas{

    private static int nrCeasuri;
    private int ora, minut, secunda;



    /*
    public void setOra(int oraNoua){
        if(oraNoua >= 0 && oraNoua < 24){
            ora = oraNoua;
        }
    }

    public void setMinut(int minutNou){
        if(minutNou >= 0 && minutNou < 60){
            minut = minutNou;
        }
    }

    public void setSecunda(int secundaNoua){
        if(secundaNoua >= 0 && secundaNoua < 60){
            secunda = secundaNoua;
        }
    }
    */

    //Constructori nu are tip doar ca si clasa numele
    //daca nu e specificat exista doar ca ascuns

    /*
    public Ceas(int oraNoua, int minutNou, int secundaNoua){
    //putem lasa si un mesaj ca sa stim ca s-a creat un obiect nou
        ora = oraNoua;
        minut = minutNou;
        secunda = secundaNoua;
    }
    //e acelasi lucru ca setarele de sus

    */
    public static int getNumarCeasuri(){
        return nrCeasuri;
    }

    //mai merge si asa
    public Ceas(int ora, int minut, int secunda){
        //this se refera la clasa, la obiectul actual, da valoarea campului nostru
        nrCeasuri++;
        this.ora = ora;
        this.minut = minut;
        this.secunda = secunda;

    }

    public void afiseaza(){
        System.out.println(ora + ":" + minut + ":" + secunda);
    }


}
