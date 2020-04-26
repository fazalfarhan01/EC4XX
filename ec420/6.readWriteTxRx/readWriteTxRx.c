#include <reg51.h>


void initialliseUART(){
    TMOD = 0X20;            //TIMER 1 IN MODE 2; 8-BIT AUTO RELOAD
    TH1 = -3;
    TL1 = -3;
    SCON = 0X50;            //SERIAL MODE 1, VARIABLE BIT RATE UART, WITH RECIEVE ENABLE
    P1 = 0XFF;              //CONFIGURING AS INPUT PORT
    IE = 0X90;              //ENABLING INTERRUPTS WITH SERIAL INTERRUPT
    TR1 = 1;                //START TIMER
}

void serial() interrupt 4{
    if(TI == 1){
        TI = 0;
        SBUF = P1;
    }
    else{
        P0 = SBUF;
        RI = 0;
    }
}


void main(){
    initialliseUART();
    SBUF = P1;
    while (1)
    {
        P2 = P1;
    }
}