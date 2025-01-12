public class Main
{
	public static void main(String[] args)
	{
		TestAlgoritm t = new TestAlgoritm();
		CautareLiniaraComparareIdentitate arr1[] = new CautareLiniaraComparareIdentitate[ 500 ];
		for(int i=0; i < arr1.length; i++)
		{
			arr1[ i ] = new CautareLiniaraComparareIdentitate( 100 );
	        try{
			t.addAlgoritm( arr1[ i ]);
			}catch(IllegalArgument ex)
			{
				
			}
		}
		
		Algoritm arr2[] = new Algoritm[ 200 ];
		for(int i=0; i < arr2.length; i++){
			arr2[ i ] = new CautareLiniaraComparareEchivalenta( 100 );
		    try{
			t.addAlgoritm( arr2[ i ] );
			}catch(IllegalArgument ex)
			{
				
			}
		}
		
		t.analyze( 0 );
	}
}
