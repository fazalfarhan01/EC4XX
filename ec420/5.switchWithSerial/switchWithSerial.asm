;switchWithSerial


			org 0000h
				mov tmod, #20h
				mov th1, #-3
				mov tl1, #-3
				mov scon, #40h
				setb tr1

				mov p2, #0ffh
				mov a, p2
				rrc a
				jnc msgHello
				mov dptr, #welcome
				acall serialSend
msgHello:		mov dptr, #hello
				acall serialSend


serialSend:		clr a
				movc a, @a+dptr
				jz done
				mov sbuf, a
interruptLoop:	jnb ti, interruptLoop
				clr ti
				inc dptr
				sjmp serialSend

done:			sjmp done
				ret


				
			org 600h
				hello: db "HELLO",0
				welcome: db "WELCOME",0

				end