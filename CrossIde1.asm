;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Mar 15 12:25:21 2016
;--------------------------------------------------------
$name CrossIde1
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _InitADC
	public _Timer2_ISR
	public _PORT_Init
	public __c51_external_startup
	public _DRV
	public _PWM_2
	public _PWM_1
	public _proceed
	public _pwm_count
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_proceed:
	ds 1
_PWM_1:
	ds 2
_PWM_2:
	ds 2
_DRV:
	ds 2
_main_selection_1_58:
	ds 2
_main_voltage_1_58:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_Timer2_ISR_sloc0_1_0:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:23: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:25: volatile unsigned int PWM_1=0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:26: volatile unsigned int PWM_2=0;
	clr	a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:27: volatile int DRV = 0;
	clr	a
	mov	_DRV,a
	mov	(_DRV + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:30: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:32: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:33: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:34: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:42: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:46: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:49: SCON0 = 0x10; 
	mov	_SCON0,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:51: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:52: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:53: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:66: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:67: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:68: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:69: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:70: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:73: P2MDOUT|=0b_0000_0011;
	orl	_P2MDOUT,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:74: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:75: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:76: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:79: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:80: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:81: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:82: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:83: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:84: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:86: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:88: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:91: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:93: P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:94: XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:95: XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	mov	_XBR1,#0x50
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:96: XBR2=0b_0000_0000;
	mov	_XBR2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:99: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	ar2
	push	ar3
	push	psw
	mov	psw,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:101: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:103: pwm_count++;
	inc	_pwm_count
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:104: if(pwm_count>100) pwm_count=0;
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L004002?
	mov	_pwm_count,#0x00
L004002?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:106: OUT0=pwm_count>PWM_1?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_1
	subb	a,r2
	mov	a,(_PWM_1 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:107: OUT1=pwm_count>PWM_2?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_2
	subb	a,r2
	mov	a,(_PWM_2 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_1,c
	pop	psw
	pop	ar3
	pop	ar2
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:111: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:114: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:115: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:116: REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:119: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:123: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L006012?
L006010?:
	add	a,acc
L006012?:
	djnz	b,L006010?
	mov	r3,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:125: switch (portno)
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L006007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L006014?
	jmp	@a+dptr
L006014?:
	ljmp	L006001?
	ljmp	L006002?
	ljmp	L006003?
	ljmp	L006004?
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:127: case 0:
L006001?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:128: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:129: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:130: break;
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:131: case 1:
	ret
L006002?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:132: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:133: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:134: break;
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:135: case 2:
	ret
L006003?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:136: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:137: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:138: break;
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:139: case 3:
	ret
L006004?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:140: P3MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:141: P3SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P3SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:145: }
L006007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:148: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_AMX0P,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:151: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:153: AD0BUSY=1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:154: while (AD0BUSY); // Wait for dummy conversion to finish
L007001?:
	jb	_AD0BUSY,L007001?
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:156: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:157: while (AD0BUSY); // Wait for conversion to complete
L007004?:
	jb	_AD0BUSY,L007004?
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:158: return (ADC0L+(ADC0H*0x100));
	mov	r2,_ADC0L
	mov	r3,#0x00
	mov	r5,_ADC0H
	mov	r4,#0x00
	mov	a,r4
	add	a,r2
	mov	dpl,a
	mov	a,r5
	addc	a,r3
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:161: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:163: return ((ADC_at_Pin(pin)*3.30)/1024.0);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;selection                 Allocated with name '_main_selection_1_58'
;voltage                   Allocated with name '_main_voltage_1_58'
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:166: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:169: volatile float voltage = 0;
	mov	_main_voltage_1_58,#0x00
	mov	(_main_voltage_1_58 + 1),#0x00
	mov	(_main_voltage_1_58 + 2),#0x00
	mov	(_main_voltage_1_58 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:172: PORT_Init();     // Initialize Port I/O
	lcall	_PORT_Init
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:175: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:176: InitPinADC(1, 7);
	mov	_InitPinADC_PARM_2,#0x07
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:177: InitADC();
	lcall	_InitADC
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:179: while(1)
L009015?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:181: voltage = Volts_at_Pin(LQFP32_MUX_P1_7);
	mov	dpl,#0x07
	lcall	_Volts_at_Pin
	mov	_main_voltage_1_58,dpl
	mov	(_main_voltage_1_58 + 1),dph
	mov	(_main_voltage_1_58 + 2),b
	mov	(_main_voltage_1_58 + 3),a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:182: PWM_1 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:183: PWM_2 = 0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:184: printf(GOTO_YX, 1,1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:185: printf("\rChoose between two options: temperature controlled motor (1), or user-controlled motor (other): ");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:186: scanf("%d", selection);
	push	_main_selection_1_58
	push	(_main_selection_1_58 + 1)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:188: if(selection==1)
	mov	a,#0x01
	cjne	a,_main_selection_1_58,L009024?
	clr	a
	cjne	a,(_main_selection_1_58 + 1),L009024?
	sjmp	L009025?
L009024?:
	sjmp	L009012?
L009025?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:190: printf("\rvoltage: %.3f", voltage);
	push	_main_voltage_1_58
	push	(_main_voltage_1_58 + 1)
	push	(_main_voltage_1_58 + 2)
	push	(_main_voltage_1_58 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:191: printf("\nType 'o' and press enter to end PWM: ");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:192: scanf("%s", &proceed);
	mov	a,#_proceed
	push	acc
	mov	a,#(_proceed >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ljmp	L009013?
L009012?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:195: printf("\rPlease Input PWM Range 100 to -100: ");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:196: scanf("%d", &DRV);
	mov	a,#_DRV
	push	acc
	mov	a,#(_DRV >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:197: if(DRV < -100 || DRV > 100)
	clr	c
	mov	a,_DRV
	subb	a,#0x9C
	mov	a,(_DRV + 1)
	xrl	a,#0x80
	subb	a,#0x7f
	jc	L009007?
	mov	a,#0x64
	subb	a,_DRV
	clr	a
	xrl	a,#0x80
	mov	b,(_DRV + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L009008?
L009007?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:198: printf("Value Not Within Range");
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	sjmp	L009009?
L009008?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:199: else if(DRV > 0)
	clr	c
	clr	a
	subb	a,_DRV
	clr	a
	xrl	a,#0x80
	mov	b,(_DRV + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L009005?
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:201: PWM_1 = DRV;
	mov	_PWM_1,_DRV
	mov	(_PWM_1 + 1),(_DRV + 1)
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:202: PWM_2 = 0;
	clr	a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
	sjmp	L009009?
L009005?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:204: else if(DRV < 0)
	mov	a,(_DRV + 1)
	jnb	acc.7,L009002?
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:206: PWM_1 = 0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:207: PWM_2 = -DRV;
	clr	c
	clr	a
	subb	a,_DRV
	mov	_PWM_2,a
	clr	a
	subb	a,(_DRV + 1)
	mov	(_PWM_2 + 1),a
	sjmp	L009009?
L009002?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:211: PWM_1 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:212: PWM_2 = 0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
L009009?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:214: printf("\nType 'o' and press enter to end PWM: ");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:215: scanf("%s", &proceed);
	mov	a,#_proceed
	push	acc
	mov	a,#(_proceed >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
L009013?:
;	C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c:217: printf("\x1b[2J");
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L009015?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 0x1B
	db '[%d;%dH'
	db 0x00
__str_2:
	db 0x0D
	db 'Choose between two options: temperature controlled motor (1'
	db '), or user-controlled motor (other): '
	db 0x00
__str_3:
	db '%d'
	db 0x00
__str_4:
	db 0x0D
	db 'voltage: %.3f'
	db 0x00
__str_5:
	db 0x0A
	db 'Type '
	db 0x27
	db 'o'
	db 0x27
	db ' and press enter to end PWM: '
	db 0x00
__str_6:
	db '%s'
	db 0x00
__str_7:
	db 0x0D
	db 'Please Input PWM Range 100 to -100: '
	db 0x00
__str_8:
	db 'Value Not Within Range'
	db 0x00

	CSEG

end
