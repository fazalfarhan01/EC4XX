//to toggle all the bits of p2 continuously every 50ms.Use timer 1 in mode2 configuration with XTAL=11.0592MHz
/*max delay in 8bit mode at 11.0592 Mhz is 277.77 microseconds
for a delay of 200 micro seconds we need 184.32 machine cycles; ~184 MC
in order to get 184 machine cycles, th1 must be loaded with 72 ie 0x48 */
#include <reg51.h>

void delay(){
    int i;
    TH1 = 0X48;
    TL1 = 0X48;                 //for a delay of 200 micro seconds
    TR1 = 1;
    for(i=0; i<250; i++){       //200uS * 250 = 50mS
        while (TF1 != 1)
        {
            ;
        }
        TF1 = 0;
    }
    TR1 = 0;          
}

void main(){
    TMOD = 0x20;                //timer 1 in mode 2 configuration
    
    while (1)
    {
        P2 = ~P2;
        delay();
    }
    
}