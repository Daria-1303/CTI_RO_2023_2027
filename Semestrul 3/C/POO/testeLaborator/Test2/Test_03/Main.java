import java.util.ArrayList;

interface ITest{
    public int getNumarTeste();
}

abstract class TestSoftware implements ITest{
    
} 

abstract class SingleTest extends TestSoftware{
    protected String numeTest;
    protected int indexCalitate;

    public SingleTest(String numeTest, int indexCalitate) throws WrongQualityIndicatorException{
        if(indexCalitate < 1 || indexCalitate > 10){
            throw new WrongQualityIndicatorException("Indexul de calitate trebuie sa fie intre 1 si 10 \n");
        }

        this.numeTest = numeTest;
        this.indexCalitate = indexCalitate;
    }

    public int getNumarTeste(){
        return 1;
    }
}

class IntegrationTest extends SingleTest{

    // trebuie sa dam throw la exceptie si aici nu doar in abstract
    public IntegrationTest(String numeTest, int indexCalitate) throws WrongQualityIndicatorException{
        super(numeTest, indexCalitate);
    }

    public String toString(){
        return "IntegrationTest(name = " + this.numeTest + ", quality = " + this.indexCalitate + ")";
    }
}

class ComponentTest extends SingleTest{
    private int complexitateComponenta;

    public ComponentTest(String numeTest, int indexCalitate, int complexitateComponenta) throws WrongQualityIndicatorException, WrongComponentComplexityIndicatorException{
        super(numeTest, indexCalitate);

        if(complexitateComponenta < 0){
            throw new WrongComponentComplexityIndicatorException("Complexitatea componentei trebuie sa fie un numar natural pozitiv \n");
        }

        this.complexitateComponenta = complexitateComponenta;
    }

    public String toString(){
        return "ComponentTest(name = " + this.numeTest + ", quality = " + this.indexCalitate + ", complexity = " + this.complexitateComponenta + ")";
    }
}

class WrongQualityIndicatorException extends RuntimeException{
    public WrongQualityIndicatorException(String mesaj){
        super(mesaj);
    }
}

class WrongComponentComplexityIndicatorException extends RuntimeException{
    public WrongComponentComplexityIndicatorException(String mesaj){
        super(mesaj);
    }
}

class TestSuite extends TestSoftware{
    private ArrayList<TestSoftware> teste;

    public TestSuite(ArrayList<TestSoftware> teste){
        this.teste = new ArrayList<TestSoftware>(teste);
    }

    public boolean addNewIntegrationTest(String name, int indicator){
        try {
            teste.add(new IntegrationTest(name, indicator));
            return true;
        } catch (WrongQualityIndicatorException e) {
            return false;
        }
    }

    public boolean addNewComponentTest(String name, int indicator, int complexity) throws WrongComponentComplexityIndicatorException{
        try {
            teste.add(new ComponentTest(name, indicator, complexity));
            return true;
        } catch (WrongQualityIndicatorException e) {
            return false;
        } 
    }

    public int getNumarTeste(){
        int numarTeste = 0;

        for(TestSoftware t : teste){
            numarTeste += t.getNumarTeste();
        }

        return numarTeste;
    }

    public String toString(){
        return "TestSuite : " + teste.toString();
    }
}

class Main{
    public static void main(String[] args) {
        TestSuite testSuite = new TestSuite(new ArrayList<TestSoftware>());

        boolean tmp = testSuite.addNewIntegrationTest("IntegrationTest1", 5);
        System.out.println(tmp);
        tmp = testSuite.addNewIntegrationTest("IntegrationTest2", 15);
        System.out.println(tmp);

        try{
            tmp = testSuite.addNewComponentTest("ComponentTest1", 5, 10);
            System.out.println(tmp);
            tmp = testSuite.addNewComponentTest("ComponentTest2", 5, -10);
            System.out.println(tmp);
        }catch(WrongComponentComplexityIndicatorException e){
            System.out.println("a aparut o exceptie");
        }

        System.out.println(testSuite.getNumarTeste());
        System.out.println(testSuite.toString());
    }
}