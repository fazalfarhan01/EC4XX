//serial communication, sending hello with a baud rate of 4800

#include <reg51.h>



void initialliseUART()
{
	TH1 = -6;
	TL1 = -6;
	TMOD = 0x20;
	SCON = 0x40;
	TR1 = 1;
}

void transmit(char txData)
{
	SBUF = txData;
	while (TI != 1);
	TI=0;
}

void myData(char *string)
{
	int i;
	for (i=0;string[i]!=0;i++)
	{
		transmit(string[i]);
	}
}



void main()
{
	initialliseUART();
	myData("Hello");
	while (1);
}