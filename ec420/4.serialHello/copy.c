/*
 * 8051_Serial_UART
 * http://www.electronicwings.com
 */

#include <reg51.h>		/* Include x51 header file */

void UART_Init()
{
	TMOD = 0x20;		/* Timer 1, 8-bit auto reload mode */
	TH1 = 0xFD;		/* Load value for 9600 baud rate */
	SCON = 0x50;		/* Mode 1, reception enable */
	TR1 = 1;		/* Start timer 1 */
}

void Transmit_data(char tx_data)
{
	SBUF = tx_data;		/* Load char in SBUF register */
	while (TI==0);		/* Wait until stop bit transmit */
	TI = 0;			/* Clear TI flag */
}

void String(char *str)
{
	int i;
	for(i=0;str[i]!=0;i++)	/* Send each char of string till the NULL */
	{
		Transmit_data(str[i]);	/* Call transmit data function */
	}
}	

void main()
{
	UART_Init();		/* UART initialize function */
	String("test");		/* Transmit 'test' */
	while(1);
}