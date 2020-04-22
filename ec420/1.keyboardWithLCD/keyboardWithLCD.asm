;interfacing 8*8 keyboard

			org 0000h
continueReading:mov p3, #00h					;for rows H
				mov p1, #0ffh					;for columns V
				
				mov a, p1						;read column
				cjne a, #0ffh, keyPress			;some key pressed
				sjmp continueReading
				
				
keyPress:		mov p3, #11111110b				;clearing p3.0
				mov a , p1						;reading columns
				cjne a, #0ffh, keyPressInRow1	;check if any key press, if yes, go and find key
				
				mov p3, #11111101b				;clearing p3.1
				mov a , p1						;reading columns
				cjne a, #0ffh, keyPressInRow2	;check if any key press, if yes, go and find key
				
				mov p3, #11111011b				;clearing p3.2
				mov a , p1						;reading columns
				cjne a, #0ffh, keyPressInRow3	;check if any key press, if yes, go and find key
				
				mov p3, #11110111b				;clearing p3.3
				mov a , p1						;reading columns
				cjne a, #0ffh, keyPressInRow4	;check if any key press, if yes, go and find key
				
				mov p3, #11101111b				;clearing p3.1
				mov a , p1						;reading columns
				cjne a, #0ffh, keyPressInRow5	;check if any key press, if yes, go and find key
				
				mov p3, #11011111b				;clearing p3.1
				mov a , p1						;reading columns
				cjne a, #0ffh, keyPressInRow6	;check if any key press, if yes, go and find key
				
				;mov p3, #10111111b				;clearing p3.1
				;mov a , p1						;reading columns
				;cjne a, 0ffh, keyPressInRow7	;check if any key press, if yes, go and find key
				
				;mov p3, #01111111b				;clearing p3.1
				;mov a , p1						;reading columns
				;cjne a, 0ffh, keyPressInRow8	;check if any key press, if yes, go and find key
				
				
keyPressInRow1:	mov dptr, #row1
				sjmp findKey
keyPressInRow2:	mov dptr, #row2
				sjmp findKey
keyPressInRow3:	mov dptr, #row3
				sjmp findKey
keyPressInRow4:	mov dptr, #row4
				sjmp findKey
keyPressInRow5:	mov dptr, #row5
				sjmp findKey
keyPressInRow6:	mov dptr, #row6
				sjmp findKey
keyPressInRow7:	mov dptr, #row7
				sjmp findKey
keyPressInRow8:	mov dptr, #row8
				sjmp findKey

findKey:		mov r0, #8
repeatAgain:	rrc a
				jnc found
				inc dptr
				djnz r0, repeatAgain

found:			acall start				;selecting 5*7
				acall lcdOnAndClear		;subroutine to turn on LCD, and Cursor, and clear it
				acall setCursorToFirstLine
				clr a
				movc a, @a+dptr
				acall display
				mov a, 30h
				ljmp programEnding 		;continueReading or programEnding

			org 600h
				row1:	db '0','1','2','3','4','5','6','7'
				row2:	db '8','9','A','B','C','D','E','F'
				row3:	db 'G','H','I','J','K','L','M','N'
				row4:	db 'O','P','Q','R','S','T','U','V'
				row5:	db 'W','X','Y','Z','!','@','#','$'
				row6:	db '%','^','&','*','(',')','_','+'
				row7:
				row8:


setCursorToFirstLine:mov a, #80h
			acall command
			ret

setCursorToSecondLine:mov a, #0c0h
			acall command
			ret

start:		mov a, #38h		;selecting 5*7 of both lines
			acall command
			ret
			
			
lcdOnAndClear:mov a, #0fh		;LCD ON, Cursor ON + Blinking
			acall command
			mov a, #01h		;Clearing Display
			acall command
			ret
			
			
command:	mov p2, a		;sending data to data bus ;port 3
			clr p3.6		;clearing RS (Selecting command reg.)
			setb p3.7		;enable signal
			clr p3.7		;falling edge
			acall delay
			ret
			
			
display:	mov p2, a		;sending data to data bus ;port 3
			setb p3.6		;setting RS (selecting data register)
			setb p3.7		;enable signal
			clr p3.7		;falling edge
			acall delay
			ret
			
delay:		mov r0, #0ffh
	loop2:	mov r1, #0ffh
	loop1:	djnz r1, loop1
			djnz r0, loop2
			ret


programEnding:	
				end