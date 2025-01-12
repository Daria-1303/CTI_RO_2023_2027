class Client{
    public static void main(String []args){
        Firma firma = new Firma("Lidl", 5000);

        Angajat angajat1 = new Angajat("Daria", 700);
        Angajat angajat2 = new Angajat("Bianca", 1300);
        Angajat angajat3 = new Angajat("Marc", 1000);

        firma.adaugaAngajat(angajat1);
        firma.adaugaAngajat(angajat2);
        firma.adaugaAngajat(angajat3);

        //System.out.println(firma.toString());

        firma.adaugaAngajat(angajat3);

        System.out.println(firma.toString());

        System.out.println("Bugetul ramas / care lipseste in urma platii este : " + firma.platesteSalarii());

        Angajat angajatSters = firma.stergeAngajat("Bianca");

        if(angajatSters != null){
            System.out.println("Angajatul sters este : " + angajatSters.toString());
        }

        System.out.println(firma.toString());
    }
}