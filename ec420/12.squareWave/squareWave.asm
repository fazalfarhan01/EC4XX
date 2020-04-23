;generate a square wave of 10 KHz with timer0 in mode2 at p1.3 using interrupt mode. 
;Also display a value ‘A’ at P2 and ‘B’ at P0.  Assume XTAL=22MHz

;for a wave of 10Khz, on time and off time is 50 microSecond
;for timer in mode 2 | 8-bit auto reload | 91.66 (92) Machine Cycles are required | so th0 and tl0 must be loaded with 164 | 0xA4

                org 0000h
                ljmp mainProgram

                org 000bh
                ljmp wave

                org 0050h

mainProgram:    mov tmod, #02h                  ;timer 0 mode 2
                mov p1, #00h
                mov ie, #82h
                mov th0, #164
                mov tl0, #164
                setb tr0
                
keepDoing:      mov p2, #'A'
                mov p0, #'B'
                sjmp keepDoing

wave:           clr tf0
                cpl p1.3
                reti

                end