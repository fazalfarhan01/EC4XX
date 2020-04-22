;serially send hello with a baudrate of 4800 (FA)



			org 0000h
				mov tmod, #20h
				mov th1, #-6
				mov tl1, #-6
				mov scon, #40h
				setb tr1
				mov r0, #00h

				mov dptr, #myData
mainLoop:		mov p1, #00h
				clr a
				movc a,@a+dptr
				jz over
				mov sbuf, a
				mov p1,#0ffh
timerLoop:		jnb ti, timerLoop
				clr ti
				inc dptr
				inc r0
				sjmp mainLoop
over:			mov p1, #10
				sjmp over
			org 200h
				myData: db "Hello",0

				end