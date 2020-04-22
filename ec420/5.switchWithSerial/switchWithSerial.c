#include<reg51.h>

sbit button = P2^0;

void initialliseUART(){
    TH1 = -3;       //for a baud rate for 9600
    TL1 = -3;
    SCON = 0x40;
    TMOD = 0x20;
    TR1 = 1;
}

void send(char *string){
    int i;
    for(i=0;string[i]!=0;i++){
        SBUF = string[i];
        while(TI!=1){
            ;
        }
        TI = 0;
    }
}


void main(){
    initialliseUART();
    button = 1;
    while (1){
        if(button == 0){
            send("HELLO");
        }
        else{
            send("WELCOME");
        }
    }
}