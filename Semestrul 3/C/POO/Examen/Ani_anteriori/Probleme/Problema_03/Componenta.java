import java.util.*;

public abstract class Componenta
{
    private ArrayList<Eveniment> evenimente;
	
	public Componenta()
	{
		evenimente = new ArrayList<Eveniment>();
	}
	
	public abstract void trateaza(Eveniment ev);
	public abstract void continua(Eveniment ev);
	public void incearcaTratareEveniment(Eveniment ev)
	{
		if( evenimente.contains( ev ) )
			trateaza( ev );
		else continua( ev );
	}
	
	public void inregistreazaEveniment(Eveniment ev)
	{
		if( !evenimente.contains( ev ) )
			evenimente.add( ev );
	}
}
