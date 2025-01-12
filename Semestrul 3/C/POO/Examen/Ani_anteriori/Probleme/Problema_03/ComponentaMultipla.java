import java.util.*;

public class ComponentaMultipla extends Componenta
{
	private ArrayList<Componenta> componente;
	
	public ComponentaMultipla()
	{
		componente = new ArrayList<Componenta>();
	}
	
	public void adaugaComponenta(Componenta componenta)
	{
		componente.add( componenta );
	}
	
	@Override
	public void trateaza(Eveniment ev)
	{
		System.out.println( this );
	}
	
	@Override
	public void continua(Eveniment ev)
	{
		for(Componenta tmp : componente)
			tmp.incearcaTratareEveniment( ev );
	}
	
	@Override
	public String toString()
	{
		String text = "";
		
		int i;
		for(i=0; i < componente.size() - 1; i++)
			text += componente.get( i ) + ", ";
		if(componente.size() != 0)
			text += componente.get( 0 );
		
		return "ComponentaMultipla[" + componente + "]";
	}
}
