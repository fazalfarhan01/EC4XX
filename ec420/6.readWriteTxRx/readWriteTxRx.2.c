#include <reg51.h>

void initialliseUART(){
    TH1 = -3;
    TL1 = -3;
    TMOD = 0x20;
    SCON = 0x40;
    TR1 = 1;
}


void main(){
		unsigned char txData;
    P1 = 0xff;					//initiallise as input port
    initialliseUART();
    while(1){
        P2 = P1;
        SBUF = P1;
        while (TI!=1)
        {
            ;
        }
        TI = 0;
    }
}