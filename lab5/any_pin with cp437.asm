;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Mar 15 12:23:25 2016
;--------------------------------------------------------
$name any_pin_with_cp437
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
	public _waitms
	public _Timer3us
	public __c51_external_startup
	public _TIMER0_Init
	public _UART0_Init
	public _SYSCLK_Init
	public _PORT_Init
	public _overflow_count
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
_overflow_count:
	ds 1
_main_i_1_68:
	ds 2
_main_j_1_68:
	ds 2
_main_V_1_68:
	ds 8
_main_period1_1_68:
	ds 4
_main_period2_1_68:
	ds 4
_main_vrmax_1_68:
	ds 4
_main_vtmax_1_68:
	ds 4
_main_omega_1_68:
	ds 4
_main_timediff_1_68:
	ds 4
_main_phase_1_68:
	ds 4
_main_phases_1_68:
	ds 20
_main_sloc0_1_0:
	ds 4
_main_sloc1_1_0:
	ds 4
_main_sloc2_1_0:
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:44: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
	using	0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:46: P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:47: XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:48: XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	mov	_XBR1,#0x50
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:49: XBR2=0b_0000_0000;
	mov	_XBR2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SYSCLK_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:52: void SYSCLK_Init (void)
;	-----------------------------------------
;	 function SYSCLK_Init
;	-----------------------------------------
_SYSCLK_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:60: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:64: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:65: RSTSRC  = 0x04;   // Enable missing clock detector
	mov	_RSTSRC,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:68: void UART0_Init (void)
;	-----------------------------------------
;	 function UART0_Init
;	-----------------------------------------
_UART0_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:70: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:73: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:74: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:75: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:88: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:89: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:90: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:91: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:92: TI = 1;  // Indicate TX0 ready
	setb	_TI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:95: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:97: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:98: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:99: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:104: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:106: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:107: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:108: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:116: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:120: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:123: SCON0 = 0x10; 
	mov	_SCON0,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:125: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:126: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:127: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:140: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:141: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:142: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:143: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:144: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:147: P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs
	orl	_P0MDOUT,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:148: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:149: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:151: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:155: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:160: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:162: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:163: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:165: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:166: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L007004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L007007?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:168: while (!(TMR3CN & 0x80));  // Wait for overflow
L007001?:
	mov	a,_TMR3CN
	jnb	acc.7,L007001?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:169: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:166: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L007004?
L007007?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:171: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:174: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:177: for(j=ms; j!=0; j--)
L008001?:
	cjne	r2,#0x00,L008010?
	cjne	r3,#0x00,L008010?
	ret
L008010?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:179: Timer3us(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:180: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:181: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:182: Timer3us(250);
	mov	dpl,#0xFA
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:177: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L008011?
	dec	r3
L008011?:
	sjmp	L008001?
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:186: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:189: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:190: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:191: REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:194: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:198: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L010012?
L010010?:
	add	a,acc
L010012?:
	djnz	b,L010010?
	mov	r3,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:200: switch (portno)
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L010007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L010014?
	jmp	@a+dptr
L010014?:
	ljmp	L010001?
	ljmp	L010002?
	ljmp	L010003?
	ljmp	L010004?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:202: case 0:
L010001?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:203: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:204: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:205: break;
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:206: case 1:
	ret
L010002?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:207: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:208: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:209: break;
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:210: case 2:
	ret
L010003?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:211: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:212: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:213: break;
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:214: case 3:
	ret
L010004?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:215: P3MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:216: P3SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P3SKIP,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:220: }
L010007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:223: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_AMX0P,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:226: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:228: AD0BUSY=1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:229: while (AD0BUSY); // Wait for dummy conversion to finish
L011001?:
	jb	_AD0BUSY,L011001?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:231: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:232: while (AD0BUSY); // Wait for conversion to complete
L011004?:
	jb	_AD0BUSY,L011004?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:233: return (ADC0L+(ADC0H*0x100));
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:236: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:238: return ((ADC_at_Pin(pin)*3.30)/1024.0);
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
;i                         Allocated with name '_main_i_1_68'
;j                         Allocated with name '_main_j_1_68'
;k                         Allocated to registers r2 r3 
;V                         Allocated with name '_main_V_1_68'
;period1                   Allocated with name '_main_period1_1_68'
;period2                   Allocated with name '_main_period2_1_68'
;frequency                 Allocated to registers r2 r3 r4 r5 
;vrmax                     Allocated with name '_main_vrmax_1_68'
;vtmax                     Allocated with name '_main_vtmax_1_68'
;vrrms                     Allocated with name '_main_sloc1_1_0'
;vtrms                     Allocated with name '_main_sloc0_1_0'
;omega                     Allocated with name '_main_omega_1_68'
;timediff                  Allocated with name '_main_timediff_1_68'
;phase                     Allocated with name '_main_phase_1_68'
;phases                    Allocated with name '_main_phases_1_68'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;sloc2                     Allocated with name '_main_sloc2_1_0'
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:241: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:243: int i = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:244: int j = 0;
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:249: float period2 = 0;
	clr a
	mov _main_i_1_68,a
	mov (_main_i_1_68 + 1),a
	mov _main_j_1_68,a
	mov (_main_j_1_68 + 1),a
	mov _main_period2_1_68,a
	mov (_main_period2_1_68 + 1),a
	mov	(_main_period2_1_68 + 2),#0x00
	mov	(_main_period2_1_68 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:251: volatile float vrmax = 0;
	mov	_main_vrmax_1_68,#0x00
	mov	(_main_vrmax_1_68 + 1),#0x00
	mov	(_main_vrmax_1_68 + 2),#0x00
	mov	(_main_vrmax_1_68 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:252: volatile float vtmax = 0;
	mov	_main_vtmax_1_68,#0x00
	mov	(_main_vtmax_1_68 + 1),#0x00
	mov	(_main_vtmax_1_68 + 2),#0x00
	mov	(_main_vtmax_1_68 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:253: float vrrms = 0;
	mov	_main_sloc1_1_0,#0x00
	mov	(_main_sloc1_1_0 + 1),#0x00
	mov	(_main_sloc1_1_0 + 2),#0x00
	mov	(_main_sloc1_1_0 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:254: float vtrms = 0;
	mov	_main_sloc0_1_0,#0x00
	mov	(_main_sloc0_1_0 + 1),#0x00
	mov	(_main_sloc0_1_0 + 2),#0x00
	mov	(_main_sloc0_1_0 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:257: float phase = 0;
	mov	_main_phase_1_68,#0x00
	mov	(_main_phase_1_68 + 1),#0x00
	mov	(_main_phase_1_68 + 2),#0x00
	mov	(_main_phase_1_68 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:261: PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
	anl	_PCA0MD,#0xBF
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:262: PORT_Init();     // Initialize Port I/O
	lcall	_PORT_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:263: SYSCLK_Init ();  // Initialize Oscillator
	lcall	_SYSCLK_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:264: UART0_Init();    // Initialize UART0
	lcall	_UART0_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:265: TIMER0_Init();
	lcall	_TIMER0_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:267: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:270: printf( CLEAR_SCREEN );
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:271: printf( FORE_BACK , COLOR_BLACK, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	clr	a
	push	acc
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:272: printf( GOTO_YX , 1, 1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:276: InitPinADC(2, 1); // Configure P2.1 as analog input
	mov	_InitPinADC_PARM_2,#0x01
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:277: InitPinADC(2, 2); // Configure P2.2 as analog input
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:280: InitADC();
	lcall	_InitADC
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:282: printf( "ษออออออออออออหออออออออออออป\n" );
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:283: printf( "บ Vrms Ref   บ            บ\n" );
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:284: printf( "ฬออออออออออออฮออออออออออออน\n" );
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:285: printf( "บ Vrms Test  บ            บ\n" );
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:286: printf( "ฬออออออออออออฮออออออออออออน\n" );
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:287: printf( "บ Phase      บ            บ\n" );
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:288: printf( "ฬออออออออออออฮออออออออออออน\n" );
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:289: printf( "บ Frequency  บ            บ\n" );
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:290: printf( "ศออออออออออออสออออออออออออผ\n" );
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:292: while(1)
L013049?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:295: V[0]=Volts_at_Pin(LQFP32_MUX_P2_1);
	mov	dpl,#0x09
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	_main_V_1_68,r4
	mov	(_main_V_1_68 + 1),r5
	mov	(_main_V_1_68 + 2),r2
	mov	(_main_V_1_68 + 3),r3
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:296: V[1]=Volts_at_Pin(LQFP32_MUX_P2_2);
	mov	dpl,#0x0A
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	(_main_V_1_68 + 0x0004),r2
	mov	((_main_V_1_68 + 0x0004) + 1),r3
	mov	((_main_V_1_68 + 0x0004) + 2),r4
	mov	((_main_V_1_68 + 0x0004) + 3),r5
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:299: if(vrmax < V[1]) //reference Vpeak
	push	(_main_V_1_68 + 0x0004)
	push	((_main_V_1_68 + 0x0004) + 1)
	push	((_main_V_1_68 + 0x0004) + 2)
	push	((_main_V_1_68 + 0x0004) + 3)
	mov	dpl,_main_vrmax_1_68
	mov	dph,(_main_vrmax_1_68 + 1)
	mov	b,(_main_vrmax_1_68 + 2)
	mov	a,(_main_vrmax_1_68 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013004?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:301: vrmax=V[1];
	mov	_main_vrmax_1_68,(_main_V_1_68 + 0x0004)
	mov	(_main_vrmax_1_68 + 1),((_main_V_1_68 + 0x0004) + 1)
	mov	(_main_vrmax_1_68 + 2),((_main_V_1_68 + 0x0004) + 2)
	mov	(_main_vrmax_1_68 + 3),((_main_V_1_68 + 0x0004) + 3)
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:302: if (vrmax == V[1])
	push	(_main_V_1_68 + 0x0004)
	push	((_main_V_1_68 + 0x0004) + 1)
	push	((_main_V_1_68 + 0x0004) + 2)
	push	((_main_V_1_68 + 0x0004) + 3)
	mov	dpl,_main_vrmax_1_68
	mov	dph,(_main_vrmax_1_68 + 1)
	mov	b,(_main_vrmax_1_68 + 2)
	mov	a,(_main_vrmax_1_68 + 3)
	lcall	___fseq
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013004?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:305: vrrms=(vrmax*1.075)/1.41421;
	push	_main_vrmax_1_68
	push	(_main_vrmax_1_68 + 1)
	push	(_main_vrmax_1_68 + 2)
	push	(_main_vrmax_1_68 + 3)
	mov	dptr,#0x999A
	mov	b,#0x89
	mov	a,#0x3F
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xD5
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
L013004?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:310: if(vtmax<V[0]) //test Vpeak
	push	_main_V_1_68
	push	(_main_V_1_68 + 1)
	push	(_main_V_1_68 + 2)
	push	(_main_V_1_68 + 3)
	mov	dpl,_main_vtmax_1_68
	mov	dph,(_main_vtmax_1_68 + 1)
	mov	b,(_main_vtmax_1_68 + 2)
	mov	a,(_main_vtmax_1_68 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013072?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:312: vtmax=V[0];
	mov	_main_vtmax_1_68,_main_V_1_68
	mov	(_main_vtmax_1_68 + 1),(_main_V_1_68 + 1)
	mov	(_main_vtmax_1_68 + 2),(_main_V_1_68 + 2)
	mov	(_main_vtmax_1_68 + 3),(_main_V_1_68 + 3)
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:313: if (vtmax ==V[0])
	push	_main_V_1_68
	push	(_main_V_1_68 + 1)
	push	(_main_V_1_68 + 2)
	push	(_main_V_1_68 + 3)
	mov	dpl,_main_vtmax_1_68
	mov	dph,(_main_vtmax_1_68 + 1)
	mov	b,(_main_vtmax_1_68 + 2)
	mov	a,(_main_vtmax_1_68 + 3)
	lcall	___fseq
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013072?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:316: vtrms=(vtmax*1.133)/1.41421;
	push	_main_vtmax_1_68
	push	(_main_vtmax_1_68 + 1)
	push	(_main_vtmax_1_68 + 2)
	push	(_main_vtmax_1_68 + 3)
	mov	dptr,#0x0625
	mov	b,#0x91
	mov	a,#0x3F
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xD5
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:320: while(i<10)
L013072?:
	mov	r2,_main_i_1_68
	mov	r3,(_main_i_1_68 + 1)
L013027?:
	clr	c
	mov	a,r2
	subb	a,#0x0A
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jc	L013092?
	ljmp	L013087?
L013092?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:322: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:323: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:324: TF0=0;
	clr	_TF0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:325: overflow_count=0;
	mov	_overflow_count,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:327: while(P2_3!=0); // Wait for the signal to be zero
L013009?:
	jb	_P2_3,L013009?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:328: while(P2_3!=1); // Wait for the signal to be one
L013012?:
	jnb	_P2_3,L013012?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:329: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:330: while(P2_3!=0) // Wait for the signal to be zero
L013017?:
	jnb	_P2_3,L013022?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:332: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:334: TF0=0;
	jbc	_TF0,L013096?
	sjmp	L013017?
L013096?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:335: overflow_count++;
	inc	_overflow_count
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:338: while(P2_3!=1) // Wait for the signal to be one
	sjmp	L013017?
L013022?:
	jb	_P2_3,L013024?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:340: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:342: TF0=0;
	jbc	_TF0,L013098?
	sjmp	L013022?
L013098?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:343: overflow_count++;
	inc	_overflow_count
	sjmp	L013022?
L013024?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:346: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	push	ar2
	push	ar3
	clr	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:347: period1=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,_overflow_count
	push	ar2
	push	ar3
	lcall	___uchar2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc2_1_0
	mov	dph,(_main_sloc2_1_0 + 1)
	mov	b,(_main_sloc2_1_0 + 2)
	mov	a,(_main_sloc2_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc2_1_0
	mov	dph,(_main_sloc2_1_0 + 1)
	mov	b,(_main_sloc2_1_0 + 2)
	mov	a,(_main_sloc2_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x37BD
	mov	b,#0x86
	mov	a,#0x34
	lcall	___fsmul
	mov	_main_period1_1_68,dpl
	mov	(_main_period1_1_68 + 1),dph
	mov	(_main_period1_1_68 + 2),b
	mov	(_main_period1_1_68 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:348: if(period1>period2)
	push	ar3
	push	_main_period2_1_68
	push	(_main_period2_1_68 + 1)
	push	(_main_period2_1_68 + 2)
	push	(_main_period2_1_68 + 3)
	mov	dpl,_main_period1_1_68
	mov	dph,(_main_period1_1_68 + 1)
	mov	b,(_main_period1_1_68 + 2)
	mov	a,(_main_period1_1_68 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	mov	a,r2
	pop	ar3
	pop	ar2
	jz	L013026?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:350: period2 = period1;
	mov	_main_period2_1_68,_main_period1_1_68
	mov	(_main_period2_1_68 + 1),(_main_period1_1_68 + 1)
	mov	(_main_period2_1_68 + 2),(_main_period1_1_68 + 2)
	mov	(_main_period2_1_68 + 3),(_main_period1_1_68 + 3)
L013026?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:352: i++;
	inc	r2
	cjne	r2,#0x00,L013100?
	inc	r3
L013100?:
	mov	_main_i_1_68,r2
	mov	(_main_i_1_68 + 1),r3
	ljmp	L013027?
L013087?:
	mov	_main_i_1_68,r2
	mov	(_main_i_1_68 + 1),r3
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:354: omega=360/period2;
	push	_main_period2_1_68
	push	(_main_period2_1_68 + 1)
	push	(_main_period2_1_68 + 2)
	push	(_main_period2_1_68 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsdiv
	mov	_main_omega_1_68,dpl
	mov	(_main_omega_1_68 + 1),dph
	mov	(_main_omega_1_68 + 2),b
	mov	(_main_omega_1_68 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:356: if (j < 5)
	clr	c
	mov	a,_main_j_1_68
	subb	a,#0x05
	mov	a,(_main_j_1_68 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	L013101?
	ljmp	L013045?
L013101?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:358: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:359: TF0=0;
	clr	_TF0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:360: overflow_count=0;
	mov	_overflow_count,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:361: while(Volts_at_Pin(LQFP32_MUX_P2_2)!=vrmax); // Wait for the signal to be one
L013030?:
	mov	dpl,#0x0A
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	_main_vrmax_1_68
	push	(_main_vrmax_1_68 + 1)
	push	(_main_vrmax_1_68 + 2)
	push	(_main_vrmax_1_68 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fseq
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013030?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:362: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:363: while(Volts_at_Pin(LQFP32_MUX_P2_1)!=vtmax) // Wait for the signal to be zero
L013035?:
	mov	dpl,#0x09
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	_main_vtmax_1_68
	push	(_main_vtmax_1_68 + 1)
	push	(_main_vtmax_1_68 + 2)
	push	(_main_vtmax_1_68 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fseq
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L013037?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:365: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:367: TF0=0;
	jbc	_TF0,L013104?
	sjmp	L013035?
L013104?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:368: overflow_count++;
	inc	_overflow_count
	sjmp	L013035?
L013037?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:371: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:372: timediff=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,_overflow_count
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc2_1_0
	mov	dph,(_main_sloc2_1_0 + 1)
	mov	b,(_main_sloc2_1_0 + 2)
	mov	a,(_main_sloc2_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc2_1_0
	mov	dph,(_main_sloc2_1_0 + 1)
	mov	b,(_main_sloc2_1_0 + 2)
	mov	a,(_main_sloc2_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x37BD
	mov	b,#0x86
	mov	a,#0x34
	lcall	___fsmul
	mov	_main_timediff_1_68,dpl
	mov	(_main_timediff_1_68 + 1),dph
	mov	(_main_timediff_1_68 + 2),b
	mov	(_main_timediff_1_68 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:373: if(((omega*timediff)<100 && (omega*timediff)>30))
	push	_main_timediff_1_68
	push	(_main_timediff_1_68 + 1)
	push	(_main_timediff_1_68 + 2)
	push	(_main_timediff_1_68 + 3)
	mov	dpl,_main_omega_1_68
	mov	dph,(_main_omega_1_68 + 1)
	mov	b,(_main_omega_1_68 + 2)
	mov	a,(_main_omega_1_68 + 3)
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
	mov	a,r4
	jnz	L013105?
	ljmp	L013045?
L013105?:
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	clr	a
	push	acc
	push	acc
	mov	a,#0xF0
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
	mov	a,r4
	jnz	L013106?
	ljmp	L013045?
L013106?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:375: if (timediff>(period2/2))
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_period2_1_68
	mov	dph,(_main_period2_1_68 + 1)
	mov	b,(_main_period2_1_68 + 2)
	mov	a,(_main_period2_1_68 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	push	ar3
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	dpl,_main_timediff_1_68
	mov	dph,(_main_timediff_1_68 + 1)
	mov	b,(_main_timediff_1_68 + 2)
	mov	a,(_main_timediff_1_68 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar3
	mov	a,r2
	pop	ar3
	pop	ar2
	pop	ar7
	pop	ar6
	jz	L013039?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:377: phases[j]=(omega*timediff);
	mov	r4,_main_j_1_68
	mov	a,(_main_j_1_68 + 1)
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	mov	r5,a
	mov	a,r4
	add	a,#_main_phases_1_68
	mov	r0,a
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	sjmp	L013040?
L013039?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:381: phases[j]=(-1)*(omega*timediff);
	mov	r4,_main_j_1_68
	mov	a,(_main_j_1_68 + 1)
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	mov	r5,a
	mov	a,r4
	add	a,#_main_phases_1_68
	mov	r0,a
	mov	a,r3
	cpl	acc.7
	mov	r3,a
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	dec	r0
	dec	r0
	dec	r0
L013040?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:383: j++;
	inc	_main_j_1_68
	clr	a
	cjne	a,_main_j_1_68,L013108?
	inc	(_main_j_1_68 + 1)
L013108?:
L013045?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:386: if (j>=5)
	clr	c
	mov	a,_main_j_1_68
	subb	a,#0x05
	mov	a,(_main_j_1_68 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L013109?
	ljmp	L013047?
L013109?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:388: phase=0;
	mov	_main_phase_1_68,#0x00
	mov	(_main_phase_1_68 + 1),#0x00
	mov	(_main_phase_1_68 + 2),#0x00
	mov	(_main_phase_1_68 + 3),#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:389: for(k=0; k<5; k++)
	mov	r2,#0x00
	mov	r3,#0x00
L013051?:
	clr	c
	mov	a,r2
	subb	a,#0x05
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L013054?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:391: phase+=phases[k];
	mov	ar4,r2
	mov	a,r3
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	mov	a,r4
	add	a,#_main_phases_1_68
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	dec	r0
	dec	r0
	dec	r0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_main_phase_1_68
	mov	dph,(_main_phase_1_68 + 1)
	mov	b,(_main_phase_1_68 + 2)
	mov	a,(_main_phase_1_68 + 3)
	lcall	___fsadd
	mov	_main_phase_1_68,dpl
	mov	(_main_phase_1_68 + 1),dph
	mov	(_main_phase_1_68 + 2),b
	mov	(_main_phase_1_68 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:389: for(k=0; k<5; k++)
	inc	r2
	cjne	r2,#0x00,L013051?
	inc	r3
	sjmp	L013051?
L013054?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:393: phase = phase/5;
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_phase_1_68
	mov	dph,(_main_phase_1_68 + 1)
	mov	b,(_main_phase_1_68 + 2)
	mov	a,(_main_phase_1_68 + 3)
	lcall	___fsdiv
	mov	_main_phase_1_68,dpl
	mov	(_main_phase_1_68 + 1),dph
	mov	(_main_phase_1_68 + 2),b
	mov	(_main_phase_1_68 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:394: j=0;
	clr	a
	mov	_main_j_1_68,a
	mov	(_main_j_1_68 + 1),a
L013047?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:397: frequency = 1/period2;
	push	_main_period2_1_68
	push	(_main_period2_1_68 + 1)
	push	(_main_period2_1_68 + 2)
	push	(_main_period2_1_68 + 3)
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:399: printf( GOTO_YX , 2, 18);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:400: printf( FORE_BACK , COLOR_RED, COLOR_WHITE );
	mov	a,#0x07
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:401: printf("%5.3f", vrrms);
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:402: printf( GOTO_YX , 4, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:403: printf( FORE_BACK , COLOR_GREEN, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:404: printf("%5.3f", vtrms);
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:405: printf( GOTO_YX , 6, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x06
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:406: printf( FORE_BACK , COLOR_BLUE, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:407: printf("%5.3f", phase);
	push	_main_phase_1_68
	push	(_main_phase_1_68 + 1)
	push	(_main_phase_1_68 + 2)
	push	(_main_phase_1_68 + 3)
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:408: printf( GOTO_YX , 8, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:409: printf( FORE_BACK , COLOR_MAGENTA, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x05
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
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:410: printf("%5.3f", frequency);	
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c:415: waitms(10);
	mov	dptr,#0x000A
	lcall	_waitms
	ljmp	L013049?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 0x1B
	db '[0;3%d;4%dm'
	db 0x00
__str_2:
	db 0x1B
	db '[%d;%dH'
	db 0x00
__str_3:
	db 0xC9
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCB
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xBB
	db 0x0A
	db 0x00
__str_4:
	db 0xBA
	db ' Vrms Ref   '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_5:
	db 0xCC
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCE
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xB9
	db 0x0A
	db 0x00
__str_6:
	db 0xBA
	db ' Vrms Test  '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_7:
	db 0xBA
	db ' Phase      '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_8:
	db 0xBA
	db ' Frequency  '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_9:
	db 0xC8
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCA
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xBC
	db 0x0A
	db 0x00
__str_10:
	db '%5.3f'
	db 0x00

	CSEG

end
