; LP52_Copy.asm:  This program copies the bootloader from one
; AT89LP52 (the source) to another AT89LP52 (the target).  The source
; must be a complete running system, with crystal, serial port interface,
; reset and boot pushbuttons, voltage regulator, etc.  The target only
; needs these seven connections:
;
; Target pin:  connected to:
; (GND) 20 --- GND
; (VCC) 40 --- 5V
; (POL) 31 --- GND
; (MOSI) 6 --- pin 1 of source (P1.0)
; (MISO) 7 --- pin 2 of source (P1.1)
; (SLCK) 8 --- pin 3 of source (P1.2)
; (RST)  9 --- pin 4 of source (P1.3)
;
; To start the clonning proccess press the boot button in the source AT89LP52.
;
; Optionally a PNP transistor, like the PN2907A or 2N3906, can be used
; to control the power applied to the target AT89LP52.  Connect the
; 'Emmiter' to 5V, the 'Collector' to pin 40 of the target AT89LP52, and the
; 'Base' to a 330 ohm resistor.  The other pin of the resistor is connected
; to pin 25 of the source AT89LP52 (P2.4).  An LED in series with a 330
; ohms resistor can be connected between pin 40 of the target AT89LP52
; and ground to indicate when the power is on/off.  Only remove/insert
; the target AT89LP52 when the power is off!
;
; The commands used to program the target AT89LP52 are found
; in "Table 17-2. Programming Command Summary" in the user manual of the
; AT89LP52 microcontroller.
;
; By Jesus Calvino-Fraga (2016)

$MODLP52

org 0000H
   ljmp Main_Program

MY_MOSI      EQU  P1.0 ; Connects to P1.5 of target AT89LP52
MY_MISO      EQU  P1.1 ; Connects to P1.6 of target AT89LP52
MY_SCLK      EQU  P1.2 ; Connects to P1.7 of target AT89LP52
TARGET_RESET EQU  P1.3 ; Connects to RST  of target AT89LP52
BOOT_BUTTON  EQU  P4.5
POWER        EQU  P2.4
LED          EQU  P0.1

CLK  EQU 22118400
BAUD equ 115200

TIMER_2_RELOAD equ (0x10000-(CLK/(16*BAUD)))

InitSerialPort:
	mov RCAP2H, #HIGH(TIMER_2_RELOAD);
	mov RCAP2L, #LOW(TIMER_2_RELOAD);
	mov T2CON, #0x34 ; #00110100B
	mov SCON, #0x52  ; Serial port in mode 1, ren, txrdy, rxempty
	ret

putchar:
    JNB TI, putchar
    CLR TI
    MOV SBUF, a
    RET

SendString:
	push dph
	push dpl
SendString1:
    CLR A
    MOVC A, @A+DPTR
    JZ SSDone
    acall putchar
    INC DPTR
    SJMP SendString1
SSDone:
	pop dpl
	pop dph
    ret

DO_SPI_G:
	push acc
    mov R1, #0            ; Received byte stored in R1
    mov R2, #8            ; Loop counter (8-bits)
DO_SPI_G_LOOP:
    mov a, R0             ; Byte to write is in R0
    rlc a                 ; Carry flag has bit to write
    mov R0, a
    mov MY_MOSI, c
    setb MY_SCLK          ; Transmit
    mov c, MY_MISO        ; Read received bit
    mov a, R1             ; Save received bit in R1
    rlc a
    mov R1, a
    clr MY_SCLK
    djnz R2, DO_SPI_G_LOOP
    pop acc
    clr MY_MOSI
    ret
    
; When using a 22.1184MHz crystal in fast mode
; one cycle takes 1.0/22.1184MHz = 45.21123 ns
Wait100mS:
    mov R2, #18
L3: mov R1, #250
L2: mov R0, #166
L1: djnz R0, L1 ; 3 cycles->3*45.21123ns*166=22.51519us
    djnz R1, L2 ; 22.51519us*250=5.629ms
    djnz R2, L3 ; 5.629ms*18=0.1s (approximately)
    ret

HEXdisp: db '0123456789ABCDEF'

SendHex:
	push dph
	push dpl
	push acc
	mov dptr, #HEXdisp
	swap a
	anl a, #0x0f
	movc a, @a+dptr
    acall putchar
	pop acc
	anl a, #0x0f
	movc a, @a+dptr
    acall putchar
    pop dpl
    pop dph
    ret

SendByte mac
	mov R0,%0
	acall DO_SPI_G
endmac

Message1:
    db '\r\nPress the BOOT button to start copying.\r\n', 0
Message2:
    db 'Sending "Program Interface Enable" (PIE) command to target AT89LP52.\r\n', 0
Message3:
    db 'PIE command FAIL. The target AT89LP52 is probably toasted!\r\n', 0
Message4:
    db 'AT89LP52 detected!\r\nErasing target AT89LP52...\r\n', 0
Message5:
    db 'Programming target AT89LP52...\r\n', 0
Message6:
    db 'Verifying target AT89LP52...\r\n', 0
Message7:
    db 'Verify ERROR at location ', 0
Message8:
    db 'Writing fuses...\r\n', 0
Message9:
    db 'DONE! Press the BOOT button again to power off the target AT89LP52.\r\n', 0

Check_Status_Bit:
	SendByte(#0x60)
	SendByte(#0x00)
    SendByte(#0x00)
    SendByte(#0x00)
    mov a, R1
    jnb acc.0, Check_Status_Bit
    ret

WaitButton:
	jb BOOT_BUTTON, $
	acall Wait100mS	; debounce
	jb BOOT_BUTTON, WaitButton
	jnb BOOT_BUTTON, $
	ret

Main_Program:
	mov sp, #07FH
    mov PMOD, #0 ; Configure all ports in bidirectional mode
	acall InitSerialPort

Forever:
	; Set all the pins connected to the target AT89LP52 to zero
	; so no voltage is present when the power is removed.
	clr MY_MISO
	clr MY_MOSI
	clr MY_SCLK
	clr TARGET_RESET
	
	setb POWER ; power off
	clr LED    ; Turn on a green LED to show that is safe to insert a target AT89LP52
	mov dptr, #Message1
	acall SendString

	acall WaitButton  ; Wait until the user presses the boot button to start
	
	clr POWER         ; Writting zero to this pin applies power to the target.  A NPN transistor is needed.
	setb LED          ; Turn off the green LED
	setb MY_MISO      ; Set the MISO pin as input
	acall Wait100mS	  ; Wait for the power to stabilize
	setb TARGET_RESET ; Toggle reset pin
	acall Wait100mS	  ; Wait for the reset pin to stabilize
	clr TARGET_RESET  ; Enter 'In System Programming' (ISP) mode by keeping reset low
	acall Wait100mS	  ; Wait for the reset pin to stabilize

	mov dptr, #Message2
	acall SendString

	;  Program Interface Enable command. MUST be the first command!
	SendByte(#0xac)
	SendByte(#0x53)
    SendByte(#0x00)
    SendByte(#0x00) ; 0x69 should be returned in R1 if ISP is enabled.

    cjne R1, #0x69, ISP_fail
    ljmp ISP_ok

ISP_fail:
	mov dptr, #Message3
	acall SendString
	acall WaitButton	
	ljmp Forever
    
ISP_ok:

	; Erase the flash memory of the target AT89LP52
	mov dptr, #Message4
	acall SendString
	
	; Chip erase command
	SendByte(#0xac)
	SendByte(#0x80)
    SendByte(#0x00)
    SendByte(#0x00)
	acall Check_Status_Bit ; Wait for the erase command to complete

	mov dptr, #Message5
	acall SendString

	; Copy the whole code memory of the source AT89LP52 into the target AT89LP52
	mov dptr, #0x0000 ; The address range is 0x0000 to 0x1fff (8kb)

programming_loop:
    ; Display the page being programmed.  Each page is 64 bytes.
	mov a, DPH
	acall SendHex
	mov a, DPL
	acall SendHex
    mov a, #'\r'
    acall putchar

	SendByte(#0x50)
	SendByte(DPH)
    SendByte(DPL)
	; Send one page (64 bytes) of data
    mov R7, #64
page_loop:
    clr a
    movc a,@a+dptr
    SendByte(acc)
    inc dptr
    djnz R7, page_loop	    
	acall Check_Status_Bit ; Wait for programming to complete
		
	mov a, DPH
	jb acc.5, Programming_done ; When DPTR reaches 0x2000, bit 5 of DPH is 1
	ljmp programming_loop      ; Not done yet, send another 64-byte page

Programming_done:
	
	; Verify
    mov a, #'\r'
    acall putchar
	mov dptr, #Message6
	acall SendString
	
	mov dptr, #0
Verify_loop:
	SendByte(#0x20) ; Read code byte command
	SendByte(DPH)
    SendByte(DPL)
    SendByte(#0x00) ; R1 has the byte from the target at the given address
    
    clr a
    movc a, @a+dptr
    
    ; compare the byte in the target with the byte in the source 
    clr c
    subb a, R1
    jnz Verify_error
    
    inc dptr ; next byte
	mov a, DPH
	jb acc.5, Verify_done
	ljmp Verify_loop
    	
Verify_error:
	mov dptr, #Message7
	acall SendString
	mov a, DPH
	acall SendHex
	mov a, DPL
	acall SendHex
    mov a, #'\r'
    acall putchar
    mov a, #'\n'
    acall putchar
	acall WaitButton
	ljmp Forever

Verify_done:
	
	; Program fuses
	mov dptr, #Message8
	acall SendString

	SendByte(#0x71) ; Write User Fuses with Auto-Erase command.
	SendByte(#0x00)
	SendByte(#0x00)

	;Selects source for the system clock:
	;CS1 CS0 Selected Source
	;FFh FFh High Speed Crystal Oscillator (XTAL)
	;FFh 00h Low Speed Crystal Oscillator (XTAL)
	;00h FFh External Clock on XTAL1 (XCLK)
	;00h 00h Internal Auxiliary Oscillator (IRC)
	SendByte(#0xff)
	SendByte(#0xff)

	;Selects time-out delay for the POR/BOD/PWD wake-up period:
	;SUT1 SUT0 Selected Time-out
	;00h 00h  1 ms (XTAL);  16 us (XCLK/IRC)
	;00h FFh  2 ms (XTAL); 512 us (XCLK/IRC)
	;FFh 00h  4 ms (XTAL);   1 ms (XCLK/IRC)
	;FFh FFh 16 ms (XTAL);   4 ms (XCLK/IRC)
	SendByte(#0xff)
	SendByte(#0xff)

	SendByte(#0x00) ; 0x00: CPU in fast (1 clk per cycle) mode
	SendByte(#0xff) ; 0xff: ISP Enabled
	SendByte(#0xff) ; 0xff: User Signature Programming Disabled
	SendByte(#0xff) ; 0xff: I/O Ports start in tri-state mode after reset
	SendByte(#0x00) ; 0x00: In-Application Programming Enabled
	SendByte(#0xff) ; 0xff: 5M resistor on XTAL1 Disabled
	
	;The remaining 54 bytes are all zero:
	mov R7, #(64-10)
padding_bytes:
	SendByte(#0x00)
	djnz R7, padding_bytes
	acall Check_Status_Bit
	
	mov dptr, #Message9
	acall SendString
	
	; Let the target AT89LP52 run (power is on and reset is disabled) until
	; the boot button is pressed.  Please note, that in order for the target
	; AT89LP52 to run, it needs a crystal between pins 18 and 19. If the target
	; AT89LP52 is loaded properly, an LED in series with a 330 ohm resistor
	; attached between pin 'LED' and VCC will be on.
	setb TARGET_RESET
	acall WaitButton	

	ljmp Forever
end