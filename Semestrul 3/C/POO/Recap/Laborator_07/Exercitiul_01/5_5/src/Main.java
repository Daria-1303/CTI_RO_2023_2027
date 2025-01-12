class NumarComplex {
    protected double re,im;
    public NumarComplex(double re, double im) {
        this.re = re;
        this.im = im;
    }
    public NumarComplex adunare(NumarComplex a) {
        return new NumarComplex(re + a.re, im + a.im);
    }
    public double modul() {
        return Math.sqrt( re * re + im * im );
    }
    public String toString() {
        return re + " + " + im + " * i";
    }
}

class NumarReal extends NumarComplex {
    public NumarReal(double re) {
        super(re,0);
    }
    public boolean maiMare(NumarReal a) {
        return re > a.re;
    }
}

class Client {
    public static void main(String argv[]) {
        NumarComplex a = new NumarComplex(1,1);
        NumarReal b = new NumarReal(5);
        // un numar complex poate fi adunat cu un numar real deaorece metoda adunare poate primi ca parametru si
        // o instanta numar real datorita mostenirii de tip
        System.out.println("Suma este:" + a.adunare(b));
        //Se obtine aceeasi suma si astfel
        System.out.println("Suma este:" + b.adunare(a));
    }
}