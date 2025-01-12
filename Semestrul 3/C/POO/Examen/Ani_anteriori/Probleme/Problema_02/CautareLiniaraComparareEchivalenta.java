public class CautareLiniaraComparareEchivalenta extends Algoritm
{
	public CautareLiniaraComparareEchivalenta(int N)
	{
		super( N );
	}
	
	@Override
	public String toString()
	{
		return "CautareLiniaraComparareEchivalenta " + super.toString();
	}
	
	@Override
	public boolean search(Integer val)
	{
		for(int i=0; i < N; i++)
			if( val.equals( arr[ i ] ) ){
				return true;
			}
			return false;
	}
}
