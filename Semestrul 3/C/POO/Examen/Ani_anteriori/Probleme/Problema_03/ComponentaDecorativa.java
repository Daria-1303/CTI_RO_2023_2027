public class ComponentaDecorativa extends Componenta
{
	private Componenta componenta;
	
	public ComponentaDecorativa(Componenta componenta)
	{
		this.componenta = componenta;
	}
	
	@Override
	public void trateaza(Eveniment ev)
	{
		System.out.println( this );
	}
	
	@Override
	public void continua(Eveniment ev)
	{
		componenta.incearcaTratareEveniment( ev );
	}
	
	@Override
	public String toString()
	{
	return "ComponentaDecorativa[" + componenta + "]";
	}
}
