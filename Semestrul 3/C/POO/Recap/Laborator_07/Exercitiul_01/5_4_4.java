/*
Sa consideram o aplicatie ˆın care lucr˘am cu numere complexe ¸si cu numere reale: trebuie
s˘a putem calcula modulul unui num˘ar complex, trebuie s˘a putem calcula modulul unui
num˘ar real, trebuie s˘a putem afi¸sa numerele reale ¸si complexe ˆın forma real + imaginar
* i, trebuie s˘a putem compara dou˘a numere reale.
 */

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
        System.out.println("Numarul este: " + a);
        System.out.println("Modulul sau este: " + a.modul());
        NumarReal c = new NumarReal(5);
        NumarReal d = new NumarReal(-6);
        System.out.println("Primul numar este: " + c);
        System.out.println("Modulul sau este: " + c.modul());
        System.out.println("Al doilea numar este: " + d);
        System.out.println("Modulul sau este: " + d.modul());
        System.out.println("E primul numar mai mare ca al doilea? - " +
                c.maiMare(d));
    }
}