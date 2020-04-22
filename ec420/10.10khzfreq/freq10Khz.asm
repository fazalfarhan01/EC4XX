;XTAL = 22Mhz				|			Square wave to generate is of 10Khz i.e. of time period of 100 micro seconds
; in timer 0 mode 2. mode 2 is 8 bit auto reload. max delay is 139.636 micro seconds 	|		545.4545 nanoSeconds
; for a delay for 50 micro seconds, we need 91.66 ~ 92 cycles. for 92 cycles, TH0 and TL0 should be loaded with 164 = 0xA4



				org 0000h
					mov tmod, #02h
startOver:			cpl p1.4
					acall delay
					sjmp startOver


delay:				mov th0, #0a4h
					mov tl0, #0a4h
					setb tr0
timerLoop:			jnb tf0, timerLoop
					clr tf0
					clr tr0
					ret
					
					end