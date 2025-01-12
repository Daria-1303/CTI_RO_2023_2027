class Suma{
    private static int aduna(int a, int b){
        return a + b;
    }

    //returneaza suma
    public static int suma(int a, int b){
        return aduna(a, b);
    }

    public static int suma(int a, int b, int c){
        return aduna(suma(a, b), c);
    }

    public static int suma(int a, int b, int c, int d){
        return aduna(suma(a,b,c), d);
    }

}
