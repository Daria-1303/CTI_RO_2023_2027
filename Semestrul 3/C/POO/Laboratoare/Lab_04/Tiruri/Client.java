class Client{
    public static void main(String[] args) {

        Tir tir1 = new Tir();
        Tir tir2 = new Tir();

        tir1.adaugaRemorca(15, "MH13SKY");
        tir1.adaugaRemorca(20, "CS13SKY");

        Remorca rem3 = new Remorca("TM13SKY");
        tir1.adaugaRemorca(rem3);

        System.out.println("Tir 1 after adding trailers:");
        System.out.println(tir1);

        tir2.adaugaRemorca(15, "CS26SKY");
        tir2.adaugaRemorca(20, "CS31SKY");

        System.out.println("Tir 2 after adding trailers:");
        System.out.println(tir2);

        System.out.println("Are the two TIRs equal? " + tir1.equals(tir2));

        Remorca removedRemorca = tir1.stergeRemorca("TM01XYZ");
        if (removedRemorca != null) {
            System.out.println("Removed trailer: " + removedRemorca);
        }

        System.out.println("Tir 1 after removing a trailer:");
        System.out.println(tir1);
    }
}
