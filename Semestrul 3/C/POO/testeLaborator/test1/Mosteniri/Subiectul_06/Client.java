class Client{
    public static void main(String []argv){
        Cabinet c1 = new Cabinet("Daria");  
        Cabinet c2 = new Cabinet("Anisia");

        c1.adaugaCaz("r1", "a1");
        c1.adaugaCaz("r2", "a2");

        //System.out.println(c1.toString());

        c2.adaugaCaz("r3", "a3");
        c2.adaugaCaz("r4", "a4");
        c2.adaugaCaz("r5", "a5");

        //System.out.println(c2.toString());

        Cabinet c3 = c1.formeazaAlianta(c2);

        System.out.println(c3.toString());
    }
}