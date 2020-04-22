			org 0000h
				mov p1, #0ffh			;initiallise as input port
				;assuming serial tx is with a baud rate of 9600
				mov tmod, #20h
				mov th1, #-3
				mov tl1, #-3
				mov scon, #40h
				setb tr1			;timer start
				
doItAgain:		mov a, p1				;reading from port 1
				mov p2, a				;sending it to port 2
				mov sbuf, a				;sending data to serial buffer
tiLoop:			jnb ti, tiLoop
				clr ti
				sjmp doItAgain
				
				end