public abstract class Oras
{
	protected String nume;
	
	public Oras(String nume)
	{
		this.nume = nume;
	}
	
	public abstract void actioneazaRunda(Resursa resursa);
	public abstract double proceseazaCastigator();
	
	@Override
	public String toString()
	{
		return nume;
	}
}
