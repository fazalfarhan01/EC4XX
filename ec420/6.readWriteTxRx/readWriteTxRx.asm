				org 0000h
				ljmp mainProgram

				org 0023h
				ljmp serialInt



				org 0050h
mainProgram:	mov tmod, #20h				;timer 1 in more 2
				mov th1, #-3				;for a baud rate of 9600
				mov tl1, #-3				;not actually required, redundent
				mov scon, #50h				;enabling serial communication in mode 1, 8bit-UART, with receive enable
				mov p1, #0ffh				;configuring as input port
				mov ie, #90h				;interrupt enabled with serial interrupt
				setb tr1

				mov a, p1
				mov p2,a
				mov sbuf, a

keepDoing:		mov a, p1
				mov p2, a
				sjmp keepDoing


serialInt:		jb ti, transmitInt
				mov a, sbuf
				mov p0, a
				clr ri
				reti

transmitInt:	clr ti
				mov a, p1
				mov sbuf, a
				reti
				
				end