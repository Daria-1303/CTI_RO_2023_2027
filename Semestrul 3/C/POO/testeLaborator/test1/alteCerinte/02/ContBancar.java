class ContBancar{
    private int numarUnic;
    private String numeTitular;
    private double soldCurent;

    public ContBancar(int numarUnic, String numeTitular, double soldCurent){
        this.numarUnic = numarUnic;
        this.numeTitular = numeTitular;
        this.soldCurent = soldCurent;
    }

    //gettere 
    public int getNumarUnic(){
        return numarUnic;
    }

    public String getNumeTitular(){
        return numeTitular;
    }

    public double getSoldCurent(){
        return soldCurent;
    }


    public boolean equals(Object obj){
        if(obj instanceof ContBancar){
            ContBancar otherContBancar = (ContBancar) obj;

            return this.getNumarUnic() == otherContBancar.getNumarUnic();
        }

        return false;
    }

    public String toString(){
        return "Numar cont: " + numarUnic + ", Titular: " + numeTitular + ", Sold: " + soldCurent;
    }
}