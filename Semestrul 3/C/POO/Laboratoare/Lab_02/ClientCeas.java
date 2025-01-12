class ClientCeas{
    public static void main(String args[]){
        Ceas ceas1 = new Ceas(23, 20, 30);
        Ceas ceas2 = new Ceas(21, 20, 30);
        // ceas1.setOra(23);
        // ceas1.setMinut(20);
        // ceas1.setSecunda(30);
        ceas1.afiseaza();

        System.out.println(ceas1.getNumarCeasuri());
    }
}
