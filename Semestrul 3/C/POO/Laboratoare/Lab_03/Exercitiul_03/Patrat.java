class Patrat{
    private int latura;

    public Patrat(){
        this.latura = 10;
    }

    public Patrat(int latura){
        this.latura = latura;
    }

    public int getArie(){
        return latura * latura;
    }

    public void afiseazaInformatii(){
        System.out.println("Patratul are latura : " + latura + " si aria : " + getArie());
    }

}
