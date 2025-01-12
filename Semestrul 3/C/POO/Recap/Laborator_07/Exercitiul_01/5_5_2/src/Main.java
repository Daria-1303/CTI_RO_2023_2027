class NumarComplex{
    //folosim protected pentru a putea fi accesate de clasele care mostenesc
    protected double re,im;

    public NumarComplex(double re, double im) {
        this.re = re;
        this.im = im;
    }
    public double modul() {
        return Math.sqrt( re * re + im * im );
    }

    @Override
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
    public static void main(String[] args) {
        NumarComplex x = new NumarComplex(1,2);
        if (x instanceof NumarReal)
            System.out.println("NumarReal");
        else
            System.out.println("NumarComplex");
    }
}
