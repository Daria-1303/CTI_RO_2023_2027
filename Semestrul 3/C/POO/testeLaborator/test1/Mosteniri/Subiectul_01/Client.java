class Client {
    public static void main(String [] args){
            Desen desen = new Desen("Mona Lisa");
            
            //adaugam 3 figuri in el

            Figura figura1 = new Figura(13);
            Figura figura2 = new Figura(23);
            Figura figura3 = new Figura(3);

            desen.adaugaFigura(figura1);
            desen.adaugaFigura(figura2);
            desen.adaugaFigura(figura3);

            //incercam sa adaugam un obiect deja existent

            desen.adaugaFigura(figura1);

            //afisam desenul

            System.out.println(desen.toString());

            //afisam media arilor

            System.out.println("Media arilor este: " + desen.medieArie() + "\n");
    }
}
