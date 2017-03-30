; ISR_example.asm: a) Increments/decrements a BCD variable every half second using
; an ISR for timer 2; b) Generates a 2kHz square wave at pin P3.7 using
; an ISR for timer 0; and c) in the 'main' loop it displays the variable
; incremented/decremented using the ISR for timer 0 on the LCD.  Also resets it to 
; zero if the 'BOOT' pushbutton connected to P4.5 is pressed.
$NOLIST
$MODLP52
$LIST

CLK           EQU 22118400 ; Microcontroller system crystal frequency in Hz
TIMER0_RATE   EQU 4096     ; 2048Hz squarewave (peak amplitude of CEM-1203 speaker)
TIMER0_RELOAD EQU ((65536-(CLK/TIMER0_RATE)))
TIMER2_RATE   EQU 1000     ; 1000Hz, for a timer tick of 1ms
TIMER2_RELOAD EQU ((65536-(CLK/TIMER2_RATE)))

BOOT_BUTTON   equ P4.5
SOUND_OUT     equ P3.7
UPDOWN        equ P0.0
HOUR_BUTTON   equ P2.0
MINUTE_BUTTON equ P2.1
SECOND_BUTTON equ P2.2
PAUSE_BUTTON  equ P2.3
ALARM_BUTTON  equ P2.4
; Reset vector
org 0000H
    ljmp main

; External interrupt 0 vector (not used in this code)
org 0003H
	reti

; Timer/Counter 0 overflow interrupt vector
org 000BH
	ljmp Timer0_ISR

; External interrupt 1 vector (not used in this code)
org 0013H
	reti

; Timer/Counter 1 overflow interrupt vector (not used in this code)
org 001BH
	reti

; Serial port receive/transmit interrupt vector (not used in this code)
org 0023H 
	reti
	
; Timer/Counter 2 overflow interrupt vector
org 002BH
	ljmp Timer2_ISR

dseg at 30h
Count1ms:     ds 2 ; Used to determine when half second has passed
BCD_counter:  ds 1 ; The BCD counter incrememted in the ISR and displayed in the main loop
seconds:      ds 1
minutes:      ds 1
hours:		  ds 1
aseconds:	  ds 1
aminutes:	  ds 1
ahours:		  ds 1
tempvar:	  ds 1
tempvar2:	  ds 1


bseg
seconds_flag: dbit 1 ; Set to one in the ISR every time 500 ms had passed
minutes_flag: dbit 1 ;set to one in ISR every time 
hours_flag:	  dbit 1
am_pm_flag:	  dbit 1
alarm_ap_flag:dbit 1
temp_flag:	  dbit 1
temp_flag2:	  dbit 1
alarm_flag:   dbit 1
CHECK_SIGNAL: dbit 1

cseg
; These 'equ' must match the wiring between the microcontroller and the LCD!
LCD_RS equ P1.4
LCD_RW equ P1.5
LCD_E  equ P1.6
LCD_D4 equ P3.2
LCD_D5 equ P3.3
LCD_D6 equ P3.4
LCD_D7 equ P3.5
$NOLIST
$include(LCD_4bit.inc) ; A library of LCD related functions and utility macros
$LIST

;                     1234567890123456    <- This helps determine the position of the counter
Initial_Message: db  ' xx:xx:xx AM    ', 0
Alarm_Message:   db  'Alarm xx:xx:xxAM', 0
AM_Message:       db 'AM', 0
PM_Message:       db 'PM', 0

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 0                     ;
;---------------------------------;
Timer0_Init:
	mov a, TMOD
	anl a, #0xf0 ; Clear the bits for timer 0
	orl a, #0x01 ; Configure timer 0 as 16-timer
	mov TMOD, a
	mov TH0, #high(TIMER0_RELOAD)
	mov TL0, #low(TIMER0_RELOAD)
	; Enable the timer and interrupts
	  ; Start timer 0
	setb ET0 ; Enable timer 0 interrupt
    setb EA   ; Enable Global interrupts
	
	mov a, seconds
	anl a, aseconds
	mov CHECK_SIGNAL, a
	jnb CHECK_SIGNAL, done3
check_mins:
	mov a, minutes
	anl a, aminutes
	mov CHECK_SIGNAL, a
	jnb CHECK_SIGNAL, done3
check_hours:
	mov a, hours
	anl a, ahours
	mov CHECK_SIGNAL, a
	jnb CHECK_SIGNAL, done3
	
	mov c, alarm_ap_flag
	anl c, am_pm_flag
	mov CHECK_SIGNAL, c
	jb  CHECK_SIGNAL, sound_alarm
	mov c, alarm_ap_flag
	orl c, am_pm_flag
	mov CHECK_SIGNAL, c
	jnb CHECK_SIGNAL, sound_alarm
	sjmp done3
sound_alarm:
done3:
	ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P3.7 ;
;---------------------------------;
Timer0_ISR:
	; Define a latency correction for the timer reload
	CORRECTION EQU (4+4+2+2+4+4) ; lcall+ljmp+clr+mov+mov+setb
	; In mode 1 we need to reload the timer.
	clr TR0
	mov TH0, #high(TIMER0_RELOAD+CORRECTION)
	mov TL0, #low(TIMER0_RELOAD+CORRECTION)
	setb TR0
	cpl SOUND_OUT ; Connect speaker to P3.7!
	reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
Timer2_Init:
	mov T2CON, #0 ; Stop timer.  Autoreload mode.
	; One millisecond interrupt
	mov RCAP2H, #high(TIMER2_RELOAD)
	mov RCAP2L, #low(TIMER2_RELOAD)
	; Set the 16-bit variable Count1ms to zero
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Enable the timer and interrupts
    setb ET2  ; Enable timer 2 interrupt
    setb TR2  ; Enable timer 2
    setb EA   ; Enable Global interrupts
	ret

;---------------------------------;
; ISR for timer 2                 ;
;---------------------------------;
Timer2_ISR:
	clr TF2  ; Timer 2 doesn't clear TF2 automatically in ISR
	cpl P3.6 ; To check the interrupt rate with oscilloscope. It must be a 1 ms pulse.
	
	; The two registers used in the ISR must be saved in the stack
	push acc
	push psw
	
	; Increment the 16-bit counter
	inc Count1ms+0    ; Increment the low 8-bits first
	mov a, Count1ms+0 ; If the low 8-bits overflow, then increment high 8-bits
	jnz Inc_Done
	inc Count1ms+1

Inc_Done:
	; Check if half second has passed
	mov a, Count1ms+0
	cjne a, #low(100), mid_jump
	mov a, Count1ms+1
	cjne a, #high(100), mid_jump
	
	setb seconds_flag ; Let the main program know half second had passed
	cpl TR1 ; This line makes a beep-silence-beep-silence sound
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a

	mov a, seconds
	cjne a, #0x59, not_minute
	setb minutes_flag  ;reached one minute
	clr a
	mov seconds, a
	mov a, minutes
	
	cjne a, #0x59, not_hour
	setb hours_flag  ;reached one hour
	clr a
	mov minutes, a
	mov a, hours
	cjne a, #0x11, not_switch_ampm
	cpl am_pm_flag
not_switch_ampm:
	cjne a, #0x12, no_hour_reset
	mov a, #0x00
no_hour_reset:
	add a, #0x01
	da a
	mov hours, a
	sjmp finish
mid_jump:
	sjmp Timer2_ISR_done
not_minute:
	jnb UPDOWN, Timer2_ISR_decrement
	add a, #0x01
	da a
	mov seconds, a
	sjmp finish
not_hour:
	mov a, minutes
	add a, #0x01
	da a
	mov minutes, a
finish:
	sjmp Timer2_ISR_da
Timer2_ISR_decrement:
	mov a, seconds
	subb a, #0x01
	da a
	mov seconds, a
Timer2_ISR_da:
	clr a
Timer2_ISR_done:
	pop psw
	pop acc
	reti

add_hour:
	mov a, hours
	cjne a, #0x11, not_change_ampm
	cpl am_pm_flag
not_change_ampm:
	cjne a, #0x12, no_hour_reset2
	mov a, #0x00
no_hour_reset2:
	add a, #0x01
	da a
	mov hours, a
	ret
add_minute:
	mov a, minutes
	cjne a, #0x59, not_reset_minute
	mov a, #0x00
	sjmp donem
not_reset_minute:
	add a, #0x01
donem:
	da a
	mov minutes, a
	ret
add_second:
	mov a, seconds
	cjne a, #0x59, not_reset_second
	mov a, #0x00
	sjmp dones
not_reset_second:
	add a, #0x01
dones:
	da a
	mov seconds, a
	ret
	
aadd_hour:
	mov a, ahours
	cjne a, #0x11, anot_change_ampm
	cpl alarm_ap_flag
anot_change_ampm:
	cjne a, #0x12, ano_hour_reset2
	mov a, #0x00
ano_hour_reset2:
	add a, #0x01
	da a
	mov ahours, a
	ret
aadd_minute:
	mov a, aminutes
	cjne a, #0x59, anot_reset_minute
	mov a, #0x00
	sjmp adonem
anot_reset_minute:
	add a, #0x01
adonem:
	da a
	mov aminutes, a
	ret
aadd_second:
	mov a, aseconds
	cjne a, #0x59, anot_reset_second
	mov a, #0x00
	sjmp adones
anot_reset_second:
	add a, #0x01
adones:
	da a
	mov aseconds, a
	ret
	
display:
	clr seconds_flag ; We clear this flag in the main loop, but it is set in the ISR for timer 0
    clr minutes_flag
    clr hours_flag
    mov BCD_counter, seconds
	Set_Cursor(1, 8)     ; the place in the LCD where we want the BCD counter value
	Display_BCD(BCD_counter) ; This macro is also in 'LCD_4bit.inc'
	mov BCD_counter, minutes
	Set_Cursor(1, 5)
	Display_BCD(BCD_counter)
	mov BCD_counter, hours
	Set_Cursor(1, 2)
	Display_BCD(BCD_counter)
	jnb am_pm_flag, print_AM
    Set_Cursor(1,11)
    Display_char(#'P')
	sjmp alarm_display
print_AM:
    Set_Cursor(1,11)
    Display_char(#'A')
alarm_display:
	mov BCD_counter, aseconds
	Set_Cursor(2, 13)     ; the place in the LCD where we want the BCD counter value
	Display_BCD(BCD_counter) ; This macro is also in 'LCD_4bit.inc'
	mov BCD_counter, aminutes
	Set_Cursor(2, 10)
	Display_BCD(BCD_counter)
	mov BCD_counter, ahours
	Set_Cursor(2, 7)
	Display_BCD(BCD_counter)
	jnb alarm_ap_flag, print_AM2
    Set_Cursor(2, 15)
    Display_char(#'P')
	sjmp done_display
print_AM2:
    Set_Cursor(2, 15)
    Display_char(#'A')
done_display:
	ret
;---------------------------------;
; Main program. Includes hardware ;
; initialization and 'forever'    ;
; loop.                           ;
;---------------------------------;
main:
	; Initialization
    mov SP, #7FH
    mov PMOD, #0 ; Configure all ports in bidirectional mode
    lcall Timer0_Init
    lcall Timer2_Init
    lcall LCD_4BIT
    ; For convenience a few handy macros are included in 'LCD_4bit.inc':
    Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)
    Set_Cursor(2, 1)
    Send_Constant_String(#Alarm_Message)
    clr alarm_flag
    setb am_pm_flag
    setb seconds_flag
    setb minutes_flag
    setb hours_flag
	mov BCD_counter, #0x000
	
	; After initialization the program stays in this 'forever' loop
loop:
	jb PAUSE_BUTTON, alarm_loop  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb PAUSE_BUTTON, alarm_loop  ; if the 'BOOT' button is not pressed skip
	jnb PAUSE_BUTTON, $
	cpl TR2
	
alarm_loop:
	jb ALARM_BUTTON, alarm_set   ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb ALARM_BUTTON, alarm_set  ; if the 'BOOT' button is not pressed skip
	jnb ALARM_BUTTON, $
	cpl alarm_flag
	
recheck:
	jb ALARM_BUTTON, acheck_hours   ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb ALARM_BUTTON, acheck_hours  ; if the 'BOOT' button is not pressed skip
	jnb ALARM_BUTTON, $
	cpl alarm_flag
	
acheck_hours:
	jb HOUR_BUTTON, ano_hour  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb HOUR_BUTTON, ano_hour ; if the 'BOOT' button is not pressed skip
	jnb HOUR_BUTTON, $
	lcall aadd_hour
	lcall display
	
ano_hour:
	jb MINUTE_BUTTON, ano_minute ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb MINUTE_BUTTON, ano_minute ; if the 'BOOT' button is not pressed skip
	jnb MINUTE_BUTTON, $
	lcall aadd_minute
	lcall display
	
ano_minute:
	jb SECOND_BUTTON, loop_alarm  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb SECOND_BUTTON, loop_alarm  ; if the 'BOOT' button is not pressed skip
	jnb SECOND_BUTTON, $
	lcall aadd_second
	lcall display
loop_alarm:
	jb alarm_flag, recheck

alarm_set:
	jb HOUR_BUTTON, no_hour_changed  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb HOUR_BUTTON, no_hour_changed  ; if the 'BOOT' button is not pressed skip
	jnb HOUR_BUTTON, $
	lcall add_hour
	lcall display
no_hour_changed:
	jb MINUTE_BUTTON, no_minute_changed  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb MINUTE_BUTTON, no_minute_changed  ; if the 'BOOT' button is not pressed skip
	jnb MINUTE_BUTTON, $
	lcall add_minute
	lcall display
no_minute_changed:
	jb SECOND_BUTTON, return_clock  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb SECOND_BUTTON, return_clock  ; if the 'BOOT' button is not pressed skip
	jnb SECOND_BUTTON, $
	lcall add_second
	lcall display
	
return_clock:
	jb BOOT_BUTTON, pause_loop  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb BOOT_BUTTON, pause_loop  ; if the 'BOOT' button is not pressed skip
	jnb BOOT_BUTTON, $		; wait for button release
	; A clean press of the 'BOOT' button has been detected, reset the BCD counter.
	; But first stop the timer and reset the milli-seconds counter, to resync everything.
	clr TR0
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Now clear the BCD counter
	mov BCD_counter, #0x00
	mov seconds, #0x00
	mov minutes, #0x00
	mov hours, #0x11
	mov aseconds, #0x00
	mov aminutes, #0x00
	mov ahours, #0x00
	Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)
    Set_Cursor(2, 1)
    Send_Constant_String(#Alarm_Message)
    clr am_pm_flag
	clr alarm_ap_flag
	clr alarm_flag
	setb TR0                ; Re-enable the timer
	lcall display
pause_loop:
	lcall display
    ljmp loop
END