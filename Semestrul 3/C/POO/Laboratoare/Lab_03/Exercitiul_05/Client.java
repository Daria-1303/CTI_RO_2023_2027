class Client{
    public static void main(String args[]){
        int rez1 = Suma.suma(5, 10);
        int rez2 = Suma.suma(5, 10, 5);
        int rez3 = Suma.suma(5, 10, 5, 5);

        System.out.println("Suma 1 : " + rez1);
        System.out.println("Suma 2 : " + rez2);
        System.out.println("Suma 3 : " + rez3);
    }
}
