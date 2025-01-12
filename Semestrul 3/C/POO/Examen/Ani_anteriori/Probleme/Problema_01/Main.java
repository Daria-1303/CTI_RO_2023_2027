import java.util.Arrays;
public class Main
{
	public static void main(String[] args)
	{
		Resursa r1 = new ResursaEconomica("resursa1", 10, 0.5);
		Resursa r2 = new ResursaEconomica("resursa2", 5, 0.8);
		Resursa r3 = new ResursaEconomica("resursa3", 8, 0.4);
		
		Resursa r4 = new ResursaCulturala("resursa4", 4, "comp1", "comp2", "comp3");
		Resursa r5 = new ResursaCulturala("resursa5", 10, "comp14", "comp4", "comp30");
		Resursa r6 = new ResursaCulturala("resursa6", 15, "comp10", "comp20", "comp30");
		
		Oras o1 = new OrasComercial("Timisoara", r1);
		Oras o2 = new OrasComercial("Lugoj", r1, r2, r3, r3, r5, r6);
		Oras o3 = new OrasLegatura("Kolozsvar", o1, o2);
		Oras o4 = new OrasLegatura("Marosvasarhely", o1, o2, o3);
		
		Modelator m = new Modelator(5, o1, o2, o3, o4);
		
        Oras castigator = m.desfasoaraJoc(Arrays.asList(r1, r2, r3, r4, r5, r6 ) );
		
		System.out.println( castigator );
	}
}
