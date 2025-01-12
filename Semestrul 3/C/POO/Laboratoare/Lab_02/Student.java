class Student{
    private String nume;
    private int varsta;
    //private permite ca variabila sa fie folosita doar in cadrul acelei clase

    //getter
    public int getVarsta(){
        return varsta;
    }

    //setter
    public void setVarsta(int varstaNoua){
        if(varstaNoua > 0){
            varsta = varstaNoua;
        }
    }

    //adaugam public
    public void invata(){
        System.out.println("Studentul " + nume + " invata...");
    }


}
