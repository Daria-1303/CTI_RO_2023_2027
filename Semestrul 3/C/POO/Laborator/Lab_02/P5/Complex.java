class Complex{
    public static int nrNumere;
    private double re, im;

    public Complex(double re, double im){
        nrNumere++;
        this.re = re;
        this.im = im;
    }

    public static int getNumarNumere(){
        return nrNumere;
    }

    public double modul(){
        return Math.sqrt(re * re + im * im);
    }

    public void afiseazaNumar(){
        System.out.println(re + " i * " + im);
    }

    public Complex suma(Complex numarAdunat){
        return new Complex(this.re + numarAdunat.re, this.im + numarAdunat.im);
    }

}

//la p3, m2 pointeaza catre m1
