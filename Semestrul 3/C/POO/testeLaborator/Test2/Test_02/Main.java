import java.util.HashSet;
//nu permite duplicate

interface IStatistica{
    public void calculeaza(HashSet<String> secventa_stringuri);
}

abstract class Statistica implements IStatistica{
    //protected HashSet<String> secventa_stringuri;
    protected String jurnal;
    protected int numar_aparitii;


    public Statistica(){
        jurnal = "";
        numar_aparitii = 0;
    }
}

class StatisticaNumarAparitii extends Statistica{
    private HashSet<String> cautate; //asta e ce cautam

    public StatisticaNumarAparitii(HashSet<String> cautate){
        super();
        this.cautate = new HashSet<String>(cautate);
    }

    public void calculeaza(HashSet<String> secventa_stringuri){
        //jurnal = "";
        numar_aparitii = 0;
        for(String s : secventa_stringuri){
            if(cautate.contains(s)){
                numar_aparitii++;
            }
        }

        jurnal += "In secventa " + secventa_stringuri + " apar " + numar_aparitii + " siruri din secventa " + cautate + "\n";
    }

    public String toString(){
        return jurnal;
    }
}

class StatisticaNumeraleNonReale extends Statistica{


    public void calculeaza(HashSet<String> secventa_stringuri){
        //jurnal = "";
        numar_aparitii = 0;
        for(String s : secventa_stringuri){
            try {
                Double.parseDouble(s);
            } catch (NumberFormatException e) {
                numar_aparitii++;
            }
        }

        jurnal += "In secventa " + secventa_stringuri + " apar " + numar_aparitii + " siruri care nu sunt numere reale\n";
    }

    public String toString(){
        return jurnal;
    }
}

class Executor{
    private HashSet<Statistica> statistici;

    public Executor(HashSet<Statistica> statistici){
        this.statistici = new HashSet<Statistica>(statistici);
    }

    public void executa(HashSet<String> secventa_stringuri){
        for(Statistica s: statistici){
            s.calculeaza(secventa_stringuri);
            System.out.println(s.toString());
        }
    }
}

class Main{
    public static void main(String[] args) {
        HashSet<String> secventa_stringuri = new HashSet<String>();
        secventa_stringuri.add("mere");
        secventa_stringuri.add("pere");
        secventa_stringuri.add("banane");

        StatisticaNumarAparitii s1 = new StatisticaNumarAparitii(secventa_stringuri);

        StatisticaNumeraleNonReale s2 = new StatisticaNumeraleNonReale();

        HashSet<Statistica> statistici = new HashSet<Statistica>();
        statistici.add(s1);
        statistici.add(s2);

        Executor ex = new Executor(statistici);

        HashSet<String> secv1 = new HashSet<String>();
        secv1.add("Ana");
        secv1.add("are");
        secv1.add("mere");

        HashSet<String> secv2 = new HashSet<String>();
        secv2.add("Maria");
        secv2.add("are");
        secv2.add("pere");

        ex.executa(secv1);
        System.out.println("-------------------------------------------------");
        ex.executa(secv2);
    }
}