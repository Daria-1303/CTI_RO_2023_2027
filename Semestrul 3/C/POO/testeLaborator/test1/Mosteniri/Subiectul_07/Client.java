class Client{
    public static void main(String[] argv){
        Vocabular v1 = new Vocabular("da");
        Vocabular v2 = new Vocabular("nu");

        String [] cuv1 = {"nu", "oare" , "barcelona"}; 
        String [] cuv2 = {"oare" , "Messi"}; 

        v1.adaugaCuvinte(cuv1);
        v2.adaugaCuvinte(cuv2);

        System.out.println(v1.toString());
        System.out.println(v2.toString());

        int diferente = v2.determinaDiferente(v1);

        System.out.println("Diferente : " + diferente);

    }
}