class OpenSourceProject extends Project{
    // numar nelimitat de membrii
    private String mailingList;

    public OpenSourceProject(String title, String objective, long funds, Member manager, String mailingList) {
        super(title, objective, funds, manager, 1000);  // Maxim 1000 membri pentru open-source
        this.mailingList = mailingList;
    }

    public double getRisk() {
        return memberCount / (double) funds;
    }
}
