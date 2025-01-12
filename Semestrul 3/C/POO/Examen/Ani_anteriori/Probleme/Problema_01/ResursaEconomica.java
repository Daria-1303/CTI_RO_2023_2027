public class ResursaEconomica extends Resursa
{
	private double raritate;
	
	public ResursaEconomica(String nume, int cantitate, double raritate)
	{
		super(nume, cantitate);
		this.raritate = raritate;
	}
	
    @Override
	public double calculeazaValoare()
	{
		return raritate*cantitate;
	}
	
	@Override
	public String toString()
	{
		return "Economica: " + nume + " " + cantitate + " " + raritate;
	}
}
