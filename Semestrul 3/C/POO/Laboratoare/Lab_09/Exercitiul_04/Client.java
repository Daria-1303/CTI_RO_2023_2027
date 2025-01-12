class Client{
    public static void main(String[] args) {
        Member manager = new Member(35, "Ion");
        InvestmentCompany company = new InvestmentCompany(10);

        CommercialProject commercial = new CommercialProject("Project A", "Objective A", 100000, manager, "2025-12-31");
        MilitaryProject military = new MilitaryProject("Project B", "Objective B", 50000, manager, "12345", "2025-06-30");
        OpenSourceProject openSource = new OpenSourceProject("Project C", "Objective C", 20000, manager, "opensource@domain.com");

        company.addProject(commercial);
        company.addProject(military);
        company.addProject(openSource);

        Project bestProject = company.getBestInvestment();
        System.out.println("The best investment project is: " + bestProject.title);
    }
}
