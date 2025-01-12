public class CautareLiniaraComparareIdentitate extends Algoritm
{
	public CautareLiniaraComparareIdentitate(int N)
	{
		super( N );
	}
	
	@Override
	public String toString()
	{
		return "CautareLiniaraComparareIdentitate " + super.toString();
	}
	
	@Override
	public boolean search(Integer val)
	{
		for(int i=0; i < N; i++)
			if(arr[ i ].intValue() == val.intValue() ){
				return true;
			}
		return false;
	}
}
