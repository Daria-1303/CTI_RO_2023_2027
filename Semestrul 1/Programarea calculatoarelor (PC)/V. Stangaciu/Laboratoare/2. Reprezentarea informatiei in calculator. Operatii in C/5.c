/*5. Să se implementeze un calculator cu următoarele opțiuni: 1-Adunare, 2-Scădere, 3-Înmulțire, 4-Împărțire, 5-Ieșire. După ce se afișează pe ecran acest meniu, se va cere un cod de operație. Dacă s-a introdus 5, programul se va termina. Altfel, se cer două numere reale și se afișează rezultatul operației selectate.
*/
#include <stdio.h>

int main()
{
    int cod,x,y;
    printf("1-Adunare, 2-Scădere, 3-Înmulțire, 4-Împărțire, 5-Ieșire");
    printf("Introdu cod:");
    scanf("%d",&cod);
    if(cod==5)
    {
        printf("gata");
    }
    else
    {
        scanf("%d %d",&x,&y);
        if(cod==1)
        {
            int s=x+y;
            printf("%d",s);
        }
        
            if(cod==2)
        {
            int d=x-y;
            printf("%d",d);
        }
        
        if(cod==3)
        {
            int i=x*y;
            printf("%d",i);
        }
        
        if(cod==4)
        {
            int im=x/y;
            printf("%d",im);
        }
    }
    
    return 0;
}
