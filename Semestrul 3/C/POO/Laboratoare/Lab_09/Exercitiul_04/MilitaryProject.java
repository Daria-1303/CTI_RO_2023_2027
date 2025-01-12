class MilitaryProject extends Project{
    //maxim 15 membrii
    private String deadline;
    private String password;

    public MilitaryProject(String title, String objective, long funds, Member manager, String password, String deadline) {
        super(title, objective, funds, manager, 15);  // Limităm numărul de membri la 15
        this.password = password;
        this.deadline = deadline;
    }

    public double getRisk() {
        return memberCount / (double) password.length() / funds;
    }

}
