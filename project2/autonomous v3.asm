;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Apr 03 00:07:48 2016
;--------------------------------------------------------
$name autonomous_v3
$optc51 --model-small
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
	public _Timer2_ISR
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _InitADC
	public _waitms
	public _Timer3us
	public _PORT_Init
	public __c51_external_startup
	public _PWM_4
	public _PWM_3
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
_PWM_3:
	ds 2
_PWM_4:
	ds 2
_main_V_1_64:
	ds 16
_main_R_1_64:
	ds 4
_main_L_1_64:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
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
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:13: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:15: volatile unsigned int PWM_1=0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:16: volatile unsigned int PWM_2=0;
	clr	a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:17: volatile unsigned int PWM_3=0;
	clr	a
	mov	_PWM_3,a
	mov	(_PWM_3 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:18: volatile unsigned int PWM_4=0;
	clr	a
	mov	_PWM_4,a
	mov	(_PWM_4 + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:21: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:23: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:24: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:25: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:33: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:37: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:40: SCON0 = 0x10; 
	mov	_SCON0,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:42: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:43: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:44: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:57: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:58: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:59: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:60: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:61: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:64: P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs
	orl	_P0MDOUT,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:65: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:66: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:69: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:70: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:71: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:72: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:73: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:74: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:76: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:78: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:81: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:83: P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:84: XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:85: XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	mov	_XBR1,#0x50
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:86: XBR2=0b_0000_0000;
	mov	_XBR2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:90: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:95: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:97: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:98: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:100: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:101: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:103: while (!(TMR3CN & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN
	jnb	acc.7,L004001?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:104: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:101: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:106: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:109: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:112: for(j=ms; j!=0; j--)
L005001?:
	cjne	r2,#0x00,L005010?
	cjne	r3,#0x00,L005010?
	ret
L005010?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:114: Timer3us(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:115: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:116: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:117: Timer3us(250);
	mov	dpl,#0xFA
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:112: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L005011?
	dec	r3
L005011?:
	sjmp	L005001?
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:121: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:124: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:125: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:126: REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:129: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:133: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L007012?
L007010?:
	add	a,acc
L007012?:
	djnz	b,L007010?
	mov	r3,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:135: switch (portno)
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L007007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L007014?
	jmp	@a+dptr
L007014?:
	ljmp	L007001?
	ljmp	L007002?
	ljmp	L007003?
	ljmp	L007004?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:137: case 0:
L007001?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:138: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:139: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:140: break;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:141: case 1:
	ret
L007002?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:142: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:143: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:144: break;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:145: case 2:
	ret
L007003?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:146: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:147: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:148: break;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:149: case 3:
	ret
L007004?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:150: P3MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:151: P3SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P3SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:155: }
L007007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:158: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_AMX0P,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:161: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:163: AD0BUSY=1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:164: while (AD0BUSY); // Wait for dummy conversion to finish
L008001?:
	jb	_AD0BUSY,L008001?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:166: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:167: while (AD0BUSY); // Wait for conversion to complete
L008004?:
	jb	_AD0BUSY,L008004?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:168: return (ADC0L+(ADC0H*0x100));
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
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:171: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:173: return ((ADC_at_Pin(pin)*3.30)/1024.0);
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
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:176: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	ar2
	push	ar3
	push	psw
	mov	psw,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:178: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:180: pwm_count++;
	inc	_pwm_count
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:181: if(pwm_count>100) pwm_count=0;
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L010002?
	mov	_pwm_count,#0x00
L010002?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:183: OUT0=pwm_count>PWM_1?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_1
	subb	a,r2
	mov	a,(_PWM_1 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_6,c
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:184: OUT1=pwm_count>PWM_2?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_2
	subb	a,r2
	mov	a,(_PWM_2 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_7,c
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:185: OUT2=pwm_count>PWM_3?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_3
	subb	a,r2
	mov	a,(_PWM_3 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_4,c
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:186: OUT3=pwm_count>PWM_4?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_4
	subb	a,r2
	mov	a,(_PWM_4 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_5,c
	pop	psw
	pop	ar3
	pop	ar2
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;V                         Allocated with name '_main_V_1_64'
;R                         Allocated with name '_main_R_1_64'
;L                         Allocated with name '_main_L_1_64'
;thresholdL                Allocated to registers 
;thresholdR                Allocated to registers 
;z                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:189: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:191: volatile float V[4], R=0, L=0;
	mov	_main_R_1_64,#0x00
	mov	(_main_R_1_64 + 1),#0x00
	mov	(_main_R_1_64 + 2),#0x00
	mov	(_main_R_1_64 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:197: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	clr	a
	mov	_main_L_1_64,a
	mov	(_main_L_1_64 + 1),a
	mov	(_main_L_1_64 + 2),a
	mov	(_main_L_1_64 + 3),a
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
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:198: printf("\r\nUsing ADC with arbitrary pins.\r\n");
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:202: InitPinADC(2, 1); // Configure P2.1 as analog input
	mov	_InitPinADC_PARM_2,#0x01
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:203: InitPinADC(2, 2); // Configure P2.2 as analog input
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:206: InitADC();
	lcall	_InitADC
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:208: while(1)
L011027?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:210: PWM_1 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:211: PWM_2 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:212: PWM_3 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:213: PWM_4 = 0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
	mov	_PWM_3,a
	mov	(_PWM_3 + 1),a
	mov	_PWM_4,a
	mov	(_PWM_4 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:214: L=0;
	mov	_main_L_1_64,#0x00
	mov	(_main_L_1_64 + 1),#0x00
	mov	(_main_L_1_64 + 2),#0x00
	mov	(_main_L_1_64 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:215: R=0;
	mov	_main_R_1_64,#0x00
	mov	(_main_R_1_64 + 1),#0x00
	mov	(_main_R_1_64 + 2),#0x00
	mov	(_main_R_1_64 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:217: for(z=0; z<50; z++)
	mov	r2,#0x00
	mov	r3,#0x00
L011029?:
	clr	c
	mov	a,r2
	subb	a,#0x32
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L011032?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:219: V[0]=Volts_at_Pin(LQFP32_MUX_P2_1);
	mov	dpl,#0x09
	push	ar2
	push	ar3
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	_main_V_1_64,r4
	mov	(_main_V_1_64 + 1),r5
	mov	(_main_V_1_64 + 2),r6
	mov	(_main_V_1_64 + 3),r7
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:220: if(V[0]>L)
	push	_main_L_1_64
	push	(_main_L_1_64 + 1)
	push	(_main_L_1_64 + 2)
	push	(_main_L_1_64 + 3)
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L011002?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:221: L=V[0];
	mov	_main_L_1_64,_main_V_1_64
	mov	(_main_L_1_64 + 1),(_main_V_1_64 + 1)
	mov	(_main_L_1_64 + 2),(_main_V_1_64 + 2)
	mov	(_main_L_1_64 + 3),(_main_V_1_64 + 3)
L011002?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:222: V[0]=L;
	mov	_main_V_1_64,_main_L_1_64
	mov	(_main_V_1_64 + 1),(_main_L_1_64 + 1)
	mov	(_main_V_1_64 + 2),(_main_L_1_64 + 2)
	mov	(_main_V_1_64 + 3),(_main_L_1_64 + 3)
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:217: for(z=0; z<50; z++)
	inc	r2
	cjne	r2,#0x00,L011029?
	inc	r3
	sjmp	L011029?
L011032?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:224: for(z=0; z<50; z++)
	mov	r2,#0x00
	mov	r3,#0x00
L011033?:
	clr	c
	mov	a,r2
	subb	a,#0x32
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L011036?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:226: V[1]=Volts_at_Pin(LQFP32_MUX_P2_2);
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	(_main_V_1_64 + 0x0004),r4
	mov	((_main_V_1_64 + 0x0004) + 1),r5
	mov	((_main_V_1_64 + 0x0004) + 2),r6
	mov	((_main_V_1_64 + 0x0004) + 3),r7
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:227: if(V[1]>R)
	push	_main_R_1_64
	push	(_main_R_1_64 + 1)
	push	(_main_R_1_64 + 2)
	push	(_main_R_1_64 + 3)
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L011004?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:228: R=V[1];
	mov	_main_R_1_64,(_main_V_1_64 + 0x0004)
	mov	(_main_R_1_64 + 1),((_main_V_1_64 + 0x0004) + 1)
	mov	(_main_R_1_64 + 2),((_main_V_1_64 + 0x0004) + 2)
	mov	(_main_R_1_64 + 3),((_main_V_1_64 + 0x0004) + 3)
L011004?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:229: V[1]=R;
	mov	(_main_V_1_64 + 0x0004),_main_R_1_64
	mov	((_main_V_1_64 + 0x0004) + 1),(_main_R_1_64 + 1)
	mov	((_main_V_1_64 + 0x0004) + 2),(_main_R_1_64 + 2)
	mov	((_main_V_1_64 + 0x0004) + 3),(_main_R_1_64 + 3)
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:224: for(z=0; z<50; z++)
	inc	r2
	cjne	r2,#0x00,L011033?
	inc	r3
	sjmp	L011033?
L011036?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:233: if (V[0] < thresholdL-0.1 && V[1] < thresholdR-0.1 )
	mov	a,#0xA4
	push	acc
	mov	a,#0x70
	push	acc
	mov	a,#0x7D
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L011023?
	mov	a,#0xEC
	push	acc
	mov	a,#0x51
	push	acc
	mov	a,#0x78
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L011023?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:235: PWM_1 = 0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:236: PWM_2 = 100;
	mov	_PWM_2,#0x64
	clr	a
	mov	(_PWM_2 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:237: PWM_3 = 0;
	clr	a
	mov	_PWM_3,a
	mov	(_PWM_3 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:238: PWM_4 = 100;
	mov	_PWM_4,#0x64
	clr	a
	mov	(_PWM_4 + 1),a
	ljmp	L011024?
L011023?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:241: else if (V[0] > thresholdL+0.1 && V[1] > thresholdR+0.1)
	mov	a,#0xEC
	push	acc
	mov	a,#0x51
	push	acc
	mov	a,#0x98
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L011019?
	mov	a,#0x8F
	push	acc
	mov	a,#0xC2
	push	acc
	mov	a,#0x95
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L011019?
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:243: PWM_1 = 100;
	mov	_PWM_1,#0x64
	clr	a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:244: PWM_2 = 0;
	clr	a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:245: PWM_3 = 100;
	mov	_PWM_3,#0x64
	clr	a
	mov	(_PWM_3 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:246: PWM_4 = 0;
	clr	a
	mov	_PWM_4,a
	mov	(_PWM_4 + 1),a
	ljmp	L011024?
L011019?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:249: else if ((V[0] <= thresholdL+0.1 && V[0] >= thresholdL-0.1) && (V[1] <= thresholdR+0.1 && V[1] >= thresholdR-0.1))
	mov	a,#0xEC
	push	acc
	mov	a,#0x51
	push	acc
	mov	a,#0x98
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L011068?
	ljmp	L011013?
L011068?:
	mov	a,#0xA4
	push	acc
	mov	a,#0x70
	push	acc
	mov	a,#0x7D
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L011013?
	mov	a,#0x8F
	push	acc
	mov	a,#0xC2
	push	acc
	mov	a,#0x95
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L011013?
	mov	a,#0xEC
	push	acc
	mov	a,#0x51
	push	acc
	mov	a,#0x78
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:251: PWM_1 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:252: PWM_2 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:253: PWM_3 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:254: PWM_4 = 0;
	jnz	L011013?
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
	mov	_PWM_3,a
	mov	(_PWM_3 + 1),a
	mov	_PWM_4,a
	mov	(_PWM_4 + 1),a
	ljmp	L011024?
L011013?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:257: else if (V[0] > thresholdL+0.1 || V[1] < thresholdR+0.1)
	mov	a,#0xEC
	push	acc
	mov	a,#0x51
	push	acc
	mov	a,#0x98
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L011008?
	mov	a,#0x8F
	push	acc
	mov	a,#0xC2
	push	acc
	mov	a,#0x95
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L011009?
L011008?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:259: PWM_1 = 100;
	mov	_PWM_1,#0x64
	clr	a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:260: PWM_2 = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:261: PWM_3 = 0;
	clr	a
	mov	_PWM_2,a
	mov	(_PWM_2 + 1),a
	mov	_PWM_3,a
	mov	(_PWM_3 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:262: PWM_4 = 100;
	mov	_PWM_4,#0x64
	clr	a
	mov	(_PWM_4 + 1),a
	sjmp	L011024?
L011009?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:264: else if (V[0] < thresholdL-0.1 || V[1] >= thresholdR-0.1)
	mov	a,#0xA4
	push	acc
	mov	a,#0x70
	push	acc
	mov	a,#0x7D
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_V_1_64
	mov	dph,(_main_V_1_64 + 1)
	mov	b,(_main_V_1_64 + 2)
	mov	a,(_main_V_1_64 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L011005?
	mov	a,#0xEC
	push	acc
	mov	a,#0x51
	push	acc
	mov	a,#0x78
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_V_1_64 + 0x0004)
	mov	dph,((_main_V_1_64 + 0x0004) + 1)
	mov	b,((_main_V_1_64 + 0x0004) + 2)
	mov	a,((_main_V_1_64 + 0x0004) + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L011024?
L011005?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:266: PWM_1 = 0;
	clr	a
	mov	_PWM_1,a
	mov	(_PWM_1 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:267: PWM_2 = 100;
	mov	_PWM_2,#0x64
	clr	a
	mov	(_PWM_2 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:268: PWM_3 = 100;
	mov	_PWM_3,#0x64
	clr	a
	mov	(_PWM_3 + 1),a
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:269: PWM_4 = 0;
	clr	a
	mov	_PWM_4,a
	mov	(_PWM_4 + 1),a
L011024?:
;	C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v3.c:287: waitms(6);
	mov	dptr,#0x0006
	lcall	_waitms
	ljmp	L011027?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 0x0D
	db 0x0A
	db 'Using ADC with arbitrary pins.'
	db 0x0D
	db 0x0A
	db 0x00

	CSEG

end
