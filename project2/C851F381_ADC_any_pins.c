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
#include <math.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps
#define R		  100000
#define C		  0.000047

volatile float period_avg=0;
volatile float period=0;
volatile float period_sum=0;
volatile float period_count = 0;
volatile float freq = 0;
volatile float rms_voltage_ref = 0;
volatile float rms_voltage_test = 0;
volatile float phase = 0;


unsigned char overflow_count;

char _c51_external_startup (void)
{
	PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80; // enable VDD monitor
	RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD

	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
	#if (SYSCLK == 12000000L)
		//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
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
	//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
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
	volatile float V[4];
	PORT_Init();     // Initialize Port I/O
	SYSCLK_Init ();  // Initialize Oscillator
	UART0_Init();    // Initialize UART0
	TIMER0_Init();
	
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	printf("\r\nUsing ADC with arbitrary pins.\r\n");

	// Configure the pins we want to use as analog inputs
	//InitPinADC(2, 0); // Configure P2.0 as analog input
	InitPinADC(2, 1); // Configure P2.1 as analog input
	InitPinADC(2, 2); // Configure P2.2 as analog input
	//InitPinADC(2, 3); // Configure P2.3 as analog input
	// Initialize the ADC
	InitADC();
	
	while(1)
	{
		//printf("test\r");
		//Find_Period();
		//printf("test\r");
		//V[0]= Volts_at_Pin(LQFP32_MUX_P2_0);
		//V[2]= Volts_at_Pin(LQFP32_MUX_P2_1);
		//V[3]= Volts_at_Pin(LQFP32_MUX_P2_2);
		//V[1]= Volts_at_Pin(LQFP32_MUX_P2_3);
		
		PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)

    	// Reset the counter
		/*TL0=0; 
		TH0=0;
		TF0=0;
		overflow_count=0;
		
		while(P2_2!=0); // Wait for the signal to be zero
		waitms(1);
		while(P2_2!=1); // Wait for the signal to be one
		waitms(1);
		TR0=1; // Start the timer
		while(P2_2!=0); // Wait for the signal to be zero
		waitms(1);
		TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
		period=(TH0*0x100+TL0)*2*(12.0/SYSCLK)*(-1);*/
		
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
		period=(overflow_count*65536.0+TH0*256.0+TL0)*(12000.0/SYSCLK);
		
		//printf("%.6f\r",period);
		
		//printf("test\r");
		while(P2_3!=0);
		//waitms(1);
		while(P2_3!=1);
		//waitms(1);
		TL0=0; 
		TH0=0;
		TF0=0; 
		TR0=1;
		waitms(1000*(period/4));
		TR0=0;
		V[0] = Volts_at_Pin(LQFP32_MUX_P2_2);
		rms_voltage_ref = (V[0]/1.4142)*1000;
		//printf("test\r");
		while(P2_0!=0);
		//waitms(1);
		while(P2_0!=1);
		//waitms(1);
		TL0=0; 
		TH0=0;
		TF0=0; 
		TR0=1;
		//overflow_count=0;
		waitms(1000*(period/4));
		TR0=0;
		V[1] = Volts_at_Pin(LQFP32_MUX_P2_1);
		rms_voltage_test = (V[1]/1.4142)*1000;	
		
		
		while(P2_3!=0);
		//waitms(1);
		while(P2_3!=1);
		//waitms(1);
		TL0=0; 
		TH0=0;
		TF0=0;
		TR0=1;
		while(P2_0!=1);
		//waitms(1);
		TR0=0;
		freq = 1/period;
		phase=((TH0*0x100+TL0)*(12.0/SYSCLK))*freq*360;
		
		printf("R RMS V=%3.3f mV, T RMS V=%3.3f mV, P=%3.3f degrees, F=%3.3f kHz     \r",rms_voltage_ref, rms_voltage_test, phase, freq);
		waitms(100);
	}
}





