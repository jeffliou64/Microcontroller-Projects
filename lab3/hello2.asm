$NOLIST
$MODLP52
$LIST

org 0000H
   ljmp MainProgram

; These ’EQU’ must match the wiring between the microcontroller and ADC
CE_ADC EQU P2.0
MY_MOSI EQU P2.1
MY_MISO EQU P2.2
MY_SCLK EQU P2.3 

FREQ EQU 22118400
BAUD EQU 115200
T1LOAD EQU 256-(FREQ/(16*BAUD))


DSEG at 30H
x: ds 4
y: ds 4
bcd: ds 5
result: ds 4
print: ds 4
BCD_counter: ds 4

BSEG
mf: dbit 1

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
$include(math32.inc)
$LIST
;                     1234567890123456    
Initial_Message: db  '   temp: xx C   ', 0

CSEG

INIT_SPI:
	setb MY_MISO ; Make MISO an input pin
	clr MY_SCLK ; For mode (0,0) SCLK is zero
	ret

DO_SPI_G:
	push acc
	mov R1, #0 ; Received byte stored in R1
	mov R2, #8 ; Loop counter (8-bits)
DO_SPI_G_LOOP:
	mov a, R0 ; Byte to write is in R0
	rlc a ; Carry flag has bit to write
	mov R0, a
	mov MY_MOSI, c
	setb MY_SCLK ; Transmit
	mov c, MY_MISO ; Read received bit
	mov a, R1 ; Save received bit in R1
	rlc a
	mov R1, a
	clr MY_SCLK
	djnz R2, DO_SPI_G_LOOP
	pop acc
	ret

Do_Something_With_Result:
	mov x+0, Result+0
	mov x+1, Result+1
	mov x+2, #0
	mov x+3, #0
	load_y(500)
	lcall mul32
	load_y(1023)
	lcall div32
	load_y(273)
	lcall sub32
	mov a, x
	da a
	mov print, a
	lcall print2lcd
	lcall hex2bcd

	mov a, bcd+1
	swap a
	anl a, #0x0f
	orl a, #0x30
	lcall putchar

	mov a, bcd+1
	anl a, #0x0f
	orl a, #0x30
	lcall putchar

	mov a, bcd+0
	swap a
	anl a, #0x0f
	orl a, #0x30
	lcall putchar

	mov a, bcd+0
	anl a, #0x0f
	orl a, #0x30
	lcall putchar

	; Send new line / carriage return
	mov a, #'\r'
	lcall putchar
	mov a, #'\n'
	lcall putchar
	ret

print2lcd:
	mov BCD_counter, print
	Set_Cursor(1, 10)
	Display_BCD(BCD_counter)
	ret

delay:
	mov R2, #200
L12: mov R1, #100
L11: mov R0, #100
L10: djnz R0, L10
	djnz R1, L11
	djnz R2, L12
	ret

; Configure the serial port and baud rate using timer 2
InitSerialPort:
	clr TR1 ; Disable timer 1
	anl TMOD, #0x0f ; Clear bits of timer 1
	orl TMOD, #020H ; timer 1 as 8-bit auto r
	mov TH1, #T1LOAD
	mov TL1, #T1LOAD
	orl PCON, #80H ; Set SMOD to 1
	setb TR1 ; Enable timer 1
	mov SCON, #52H
	ret

; Send a character using the serial port
putchar:
    JNB TI, putchar
    CLR TI
    MOV SBUF, a
    RET

; Send a constant-zero-terminated string through the serial port
SendString:
    CLR A
    MOVC A, @A+DPTR
    JZ SendStringDone
    LCALL putchar
    INC DPTR
    SJMP SendString
SendStringDone:
    ret

MainProgram:
    MOV SP, #7FH ; Set the stack pointer to the begining of idata
    mov PMOD, #0 ; Configure all ports in bidirectional mode
    
    lcall LCD_4BIT
    Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)    
    LCALL InitSerialPort
    ;MOV DPTR, #Hello_World
    ;LCALL SendString
    
	lcall INIT_SPI
Forever:
	clr CE_ADC
	mov R0, #00000001B ; Start bit:1
	lcall DO_SPI_G
	
	mov R0, #10000000B ; Single ended, read channel 0
	lcall DO_SPI_G
	mov a, R1 ; R1 contains bits 8 and 9
	anl a, #00000011B ; We need only the two least significant bits
	mov Result+1, a ; Save result high.
	
	mov R0, #55H ; It doesn't matter what we transmit...
	lcall DO_SPI_G
	mov Result, R1 ; R1 contains bits 0 to 7. Save result low.
	setb CE_ADC
	lcall Delay
	
	lcall Do_Something_With_Result
	sjmp Forever

END