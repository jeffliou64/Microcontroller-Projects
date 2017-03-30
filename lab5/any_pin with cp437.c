//  C8051F381_ADC_any_pins.c: Shows how to use ADC with arbitrary pins.
//  Not as efficient as 'C851F381_ADC_multiple_inputs.c', but easier to
//  use and modify.  If you are testing this program using a potentiometer
//  to achieve a variable voltage, remember to use one with low resistance,
//  otherwise the track & hold will charge to an incorrect voltage.  A 1k
//  potentiometer seems to work fine, while a 10k potentiometer doesn't
//  work as well. 
//
//  2010-2016 Jesus Calvino-Fraga
//  ~C51~

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

// ANSI colors
#define	COLOR_BLACK		0
#define	COLOR_RED		1
#define	COLOR_GREEN		2
#define	COLOR_YELLOW		3
#define	COLOR_BLUE		4
#define	COLOR_MAGENTA		5
#define	COLOR_CYAN		6
#define	COLOR_WHITE		7

// Some ANSI escape sequences
#define CURSOR_ON "\x1b[?25h"
#define CURSOR_OFF "\x1b[?25l"
#define CLEAR_SCREEN "\x1b[2J"
#define GOTO_YX "\x1B[%d;%dH"
#define CLR_TO_END_LINE "\x1B[K"

/* Black foreground, white background */
#define BKF_WTB "\x1B[0;30;47m"
#define FORE_BACK "\x1B[0;3%d;4%dm"
#define FONT_SELECT "\x1B[%dm"


unsigned char overflow_count;

void PORT_Init (void)
{
	P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	XBR2=0b_0000_0000;
}

void SYSCLK_Init (void)
{
	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
#if (SYSCLK == 12000000L)
	CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
#elif (SYSCLK == 24000000L)
	CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
#elif (SYSCLK == 48000000L)
	CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
#else
	#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
#endif
	OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	RSTSRC  = 0x04;   // Enable missing clock detector
}
 
void UART0_Init (void)
{
	SCON0 = 0x10;
   
#if (SYSCLK/BAUDRATE/2L/256L < 1)
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
#elif (SYSCLK/BAUDRATE/2L/256L < 4)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01                  
	CKCON |=  0x01;
#elif (SYSCLK/BAUDRATE/2L/256L < 12)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
#else
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
	CKCON |=  0x02;
#endif
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
}

void TIMER0_Init(void)
{
	TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	TR0=0; // Stop Timer/Counter 0
}



char _c51_external_startup (void)
{
	PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80; // enable VDD monitor
	RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD

	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
	#if (SYSCLK == 12000000L)
		CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
	#elif (SYSCLK == 24000000L)
		CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	#elif (SYSCLK == 48000000L)
		CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	#else
		#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
	#endif
	OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency

	// Configure UART0
	SCON0 = 0x10; 
#if (SYSCLK/BAUDRATE/2L/256L < 1)
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
#elif (SYSCLK/BAUDRATE/2L/256L < 4)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01                  
	CKCON |=  0x01;
#elif (SYSCLK/BAUDRATE/2L/256L < 12)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
#else
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
	CKCON |=  0x02;
#endif
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
	// Configure the pins used for motor control and communication
	P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs
	XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	XBR1 = 0x40;      // enable crossbar

	return 0;
}

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON:
	CKCON|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN & 0x80));  // Wait for overflow
		TMR3CN &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	for(j=ms; j!=0; j--)
	{
		Timer3us(249);
		Timer3us(249);
		Timer3us(249);
		Timer3us(250);
	}
}

void InitADC (void)
{
	// Init ADC
	ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
  	REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
}

void InitPinADC (unsigned char portno, unsigned char pinno)
{
	unsigned char mask;
	
	mask=1<<pinno;
	
	switch (portno)
	{
		case 0:
			P0MDIN &= (~mask); // Set pin as analog input
			P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 1:
			P1MDIN &= (~mask); // Set pin as analog input
			P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 2:
			P2MDIN &= (~mask); // Set pin as analog input
			P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 3:
			P3MDIN &= (~mask); // Set pin as analog input
			P3SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		default:
		break;
	}
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	AMX0P = pin;             // Select positive input from pin
	AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	// Dummy conversion first to select new pin
	AD0BUSY=1;
	while (AD0BUSY); // Wait for dummy conversion to finish
	// Convert voltage at the pin
	AD0BUSY = 1;
	while (AD0BUSY); // Wait for conversion to complete
	return (ADC0L+(ADC0H*0x100));
}

float Volts_at_Pin(unsigned char pin)
{
	 return ((ADC_at_Pin(pin)*3.30)/1024.0);
}
	
void main (void)
{
	int i = 0;
	int j = 0;
	int k = 0;
	//int l = 0;
	volatile float V[2];
	float period1 = 0;
	float period2 = 0;
	float frequency = 0;
	volatile float vrmax = 0;
	volatile float vtmax = 0;
	float vrrms = 0;
	float vtrms = 0;
	float omega = 0;
	float timediff = 0;
	float phase = 0;
	float phases[5];
	//int cr = 0;
	//int ct = 0;
	PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
	PORT_Init();     // Initialize Port I/O
	SYSCLK_Init ();  // Initialize Oscillator
	UART0_Init();    // Initialize UART0
	TIMER0_Init();

	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	//printf("\r\nUsing ADC with arbitrary pins.\r\n");
	   
	printf( CLEAR_SCREEN );
    printf( FORE_BACK , COLOR_BLACK, COLOR_WHITE );
    printf( GOTO_YX , 1, 1);

	// Configure the pins we want to use as analog inputs
//	InitPinADC(2, 0); // Configure P2.0 as analog input
	InitPinADC(2, 1); // Configure P2.1 as analog input
	InitPinADC(2, 2); // Configure P2.2 as analog input
//	InitPinADC(2, 3); // Configure P2.3 as analog input
	// Initialize the ADC
	InitADC();
	
	printf( "ษออออออออออออหออออออออออออป\n" );
    printf( "บ Vrms Ref   บ            บ\n" );
    printf( "ฬออออออออออออฮออออออออออออน\n" );
    printf( "บ Vrms Test  บ            บ\n" );
    printf( "ฬออออออออออออฮออออออออออออน\n" );
    printf( "บ Phase      บ            บ\n" );
    printf( "ฬออออออออออออฮออออออออออออน\n" );
    printf( "บ Frequency  บ            บ\n" );
    printf( "ศออออออออออออสออออออออออออผ\n" );

	while(1)
	{
//		V[0]=Volts_at_Pin(LQFP32_MUX_P2_0);
		V[0]=Volts_at_Pin(LQFP32_MUX_P2_1);
		V[1]=Volts_at_Pin(LQFP32_MUX_P2_2);
//		V[3]=Volts_at_Pin(LQFP32_MUX_P2_3);
		
		if(vrmax < V[1]) //reference Vpeak
		{
			vrmax=V[1];
			if (vrmax == V[1])
			{
				//cr=1;
				vrrms=(vrmax*1.075)/1.41421;
				//1.41421
			}
		}
		
		if(vtmax<V[0]) //test Vpeak
		{
			vtmax=V[0];
			if (vtmax ==V[0])
			{
				//ct=1;
				vtrms=(vtmax*1.133)/1.41421;
			}
		}

		while(i<10)
		{
			TL0=0; 
			TH0=0;
			TF0=0;
			overflow_count=0;
		
			while(P2_3!=0); // Wait for the signal to be zero
			while(P2_3!=1); // Wait for the signal to be one
			TR0=1; // Start the timer
			while(P2_3!=0) // Wait for the signal to be zero
			{
				if(TF0==1) // Did the 16-bit timer overflow?
				{
					TF0=0;
					overflow_count++;
				}
			}
			while(P2_3!=1) // Wait for the signal to be one
			{
				if(TF0==1) // Did the 16-bit timer overflow?
				{
					TF0=0;
					overflow_count++;
				}
			}
			TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
			period1=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
			if(period1>period2)
			{
				period2 = period1;
			}
			i++;
		}
		omega=360/period2;
		
		if (j < 5)
		{
			TH0=0;
			TF0=0;
			overflow_count=0;
			while(Volts_at_Pin(LQFP32_MUX_P2_2)!=vrmax); // Wait for the signal to be one
			TR0=1; // Start the timer
			while(Volts_at_Pin(LQFP32_MUX_P2_1)!=vtmax) // Wait for the signal to be zero
			{
				if(TF0==1) // Did the 16-bit timer overflow?
				{
					TF0=0;
					overflow_count++;
				}
			}
			TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
			timediff=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
			if(((omega*timediff)<100 && (omega*timediff)>30))
			{
				if (timediff>(period2/2))
				{
					phases[j]=(omega*timediff);
				}
				else
				{
					phases[j]=(-1)*(omega*timediff);
				}
				j++;
			}
		}
		if (j>=5)
		{
			phase=0;
			for(k=0; k<5; k++)
			{
				phase+=phases[k];
			}
			phase = phase/5;
			j=0;
		}
		
		frequency = 1/period2;

	printf( GOTO_YX , 2, 18);
    printf( FORE_BACK , COLOR_RED, COLOR_WHITE );
    printf("%5.3f", vrrms);
    printf( GOTO_YX , 4, 18);
    printf( FORE_BACK , COLOR_GREEN, COLOR_WHITE );
    printf("%5.3f", vtrms);
    printf( GOTO_YX , 6, 18);
    printf( FORE_BACK , COLOR_BLUE, COLOR_WHITE );
    printf("%5.3f", phase);
    printf( GOTO_YX , 8, 18);
    printf( FORE_BACK , COLOR_MAGENTA, COLOR_WHITE );
    printf("%5.3f", frequency);	

		//l++;
		// Send the period to the serial port
		//printf("\rT1=%5.3fms, v1rms:%5.3f V, v2rms:%5.3f V, phase=%5.3f, freq:%5.3fHz", 1000*period2, vrrms, vtrms, phase, frequency);
		waitms(10);
	}

}