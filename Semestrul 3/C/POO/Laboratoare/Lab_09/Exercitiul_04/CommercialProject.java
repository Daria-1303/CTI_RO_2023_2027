class CommercialProject extends Project implements Risky{
    //maxim 15 membrii
    private String deadline;
    //egale cu jumatate din fondurile normale si un nr de echipe mai mic decat nr de membrii
    private long marketingFunds;

    public CommercialProject(String title, String objective, long funds, Member manager, String deadline) {
        super(title, objective, funds, manager, 15);  // Limităm numărul de membri la 15
        this.deadline = deadline;
        this.marketingFunds = funds / 2;
    }

    public double getRisk() {
        int numTeams = memberCount < members.length ? memberCount : members.length - 1;

        return (numTeams * 3.0) / memberCount / (funds - marketingFunds);
    }
}
