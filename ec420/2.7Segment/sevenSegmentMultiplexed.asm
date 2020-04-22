;8-7 Segment Display

			org 0000h
				mov p1, #0ffh
				mov p2, #00h
				
startOver:		mov dptr, #_H
				acall display1
				
				mov dptr, #_E
				acall display2
				
				mov dptr, #_L
				acall display3
				
				mov dptr, #_L
				acall display4
				
				mov dptr, #_O
				acall display5
				
				mov dptr, #_
				acall display6
				
				mov dptr, #_
				acall display7
				
				mov dptr, #_
				acall display8
				
				
				sjmp startOver
				
display1:		clr p1.7
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.7
				ret
				
display2:		clr p1.6
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.6
				ret
				
display3:		clr p1.5
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.5
				ret
				
display4:		clr p1.4
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.4
				ret
				
display5:		clr p1.3
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.3
				ret
				
display6:		clr p1.2
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.2
				ret
				
display7:		clr p1.1
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.1
				ret
				
display8:		clr p1.0
				clr a
				movc a, @a+dptr
				mov p2, a
				acall lessDelay
				setb p1.0
				ret
				
				
				
delay:			mov r3, #05h
loop3:			mov r0, #0ffh
loop2:			mov r1, #0ffh
loop1:			djnz r1, loop1
				djnz r0, loop2
				djnz r3, loop3
				ret

display:		clr a
				movc a, @a+dptr
				mov p2, a
				acall delay
				acall off
				ret
				
off:			clr a
				mov p2, a
				acall lessDelay
				ret
				
lessDelay:		mov r0, #0fh
loop5:			mov r1, #127
loop4:			djnz r1, loop4
				djnz r0, loop5
				ret
				
			org 500h
				numbers: db 11111100b, 01100000b, 11011010b, 11110010b, 01100110b, 10110110b, 10111110b, 11100000b, 11111110b, 11110110b
				_H: db 01101110b
				_E: db 10011110b
				_L: db 00011100b
				_O: db 11111100b
				_A: db 11101110b
				_F: db 10001110b
				_Z: db 11011010b
				_C:	db 10011100B
				_:	db 00000001b
						
					
				end