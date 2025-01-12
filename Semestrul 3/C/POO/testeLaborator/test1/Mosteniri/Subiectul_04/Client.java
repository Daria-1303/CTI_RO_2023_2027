class Client{
    public static void main(String [] args){
        Benzinarie OMV = new Benzinarie();

        Masina masina1 = new Masina("MH 23 ZLY", 5);
        Masina masina2 = new Masina("CS 26 SKY", 10);
        Masina masina3 = new Masina("CS 13 SKY", 15);

        OMV.alimenteazaMasina(masina1);
        OMV.alimenteazaMasina(masina2);
        OMV.alimenteazaMasina(masina3);

        System.out.println(OMV.toString());

        OMV.alimenteazaBenzinarie(15);

        System.out.println(OMV.toString());
    } 
}