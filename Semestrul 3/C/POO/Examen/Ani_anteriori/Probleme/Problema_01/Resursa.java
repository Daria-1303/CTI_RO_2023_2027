public abstract class Resursa
{
	protected String nume;
	protected int cantitate;
	
	public Resursa(String nume, int cantitate)
	{
		this.nume = nume;
		this.cantitate = cantitate;
	}
	
	public abstract double calculeazaValoare();
	
}
