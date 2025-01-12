class Member{
    /*
        participanti + manager -> programatori

        Un programator poate participa in mai multe proiecte
    */
    //caracteristici
    private int age;
    private String name;

    //constructor
    public Member(int age, String name){
        this.age = age;
        this.name = name;
    }

    //getters

    public int getAge(){
        return age;
    }

    public String getName(){
        return name;
    }
}
