#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

#define OUT0 P1_6 //
#define OUT1 P1_7 //
#define OUT2 P2_4 //
#define OUT3 P2_5 //

volatile unsigned char pwm_count=0;
volatile unsigned char proceed;
volatile unsigned int PWM_1=0;
volatile unsigned int PWM_2=0;
volatile unsigned int PWM_3=0;
volatile unsigned int PWM_4=0;
volatile unsigned int interrupt_switch=0;
volatile unsigned int switchs=0;
//volatile int DRV = 0;

void UART1_Init (unsigned long baudrate)
{
	SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	SCON1 = 0x10;
	if (((SYSCLK/baudrate)/2L)/0xFFFFL < 1)
	{
		SBRL1 = 0x10000L-((SYSCLK/baudrate)/2L);
		SBCON1 |= 0x03; // set prescaler to 1
	}
	else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 4)
	{
		SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/4L);
		SBCON1 &= ~0x03;
		SBCON1 |= 0x01; // set prescaler to 4
	}
	else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 12)
	{
		SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/12L);
		SBCON1 &= ~0x03; // set prescaler to 12
	}
	else{
		SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/48L);
		SBCON1 &= ~0x03;
		SBCON1 |= 0x02; // set prescaler to ?
	}
	SCON1 |= 0x02; // indicate ready for TX
	SBCON1 |= 0x40; // enable baud rate generator
}


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
	SCON0 = 0x52; 
	UART1_Init(100);
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
	P2MDOUT |= 0b0000_0110;   // Make the LED (P2.2) a push-pull output.  P2.1 used for debuging.
	XBR0 = 0b0000_0101;       // Enable SMBus pins and UART pins P0.4(TX) and P0.5(RX)
	XBR1 = 0x40;              // Enable crossbar and weak pull-ups
	XBR2 = 0x01;
		// Initialize timer 2 for periodic interrupts
	TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	CKCON|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2

	EA=1; // Enable interrupts

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

void Timer2_ISR (void) interrupt 5
{
	TF2H = 0; // Clear Timer2 interrupt flag
	
	pwm_count++;
	if(pwm_count>100) pwm_count=0;
	
	if (interrupt_switch==0)
	{
		switch(switchs)
		{
			case 0:
				PWM_1 = 0;
				PWM_2 = 0;
				PWM_3 = 0;
				PWM_4 = 0;
			break;
			case 1:
				PWM_1 = 0;
				PWM_2 = 100;
				PWM_3 = 0;
				PWM_4 = 100;
			break;
			case 2:
				PWM_1 = 100;
				PWM_2 = 0;
				PWM_3 = 100;
				PWM_4 = 0;
			break;
			case 3:
				PWM_1 = 100;
				PWM_2 = 0;
				PWM_3 = 0;
				PWM_4 = 50;
			break;
			case 4:
				PWM_1 = 0;
				PWM_2 = 50;
				PWM_3 = 100;
				PWM_4 = 0;
			break;
			case 5:
				PWM_1 = 0;
				PWM_2 = 100;
				PWM_3 = 50;
				PWM_4 = 0;
			break;
			case 6:
				PWM_1 = 50;
				PWM_2 = 0;
				PWM_3 = 0;
				PWM_4 = 100;
			break;
		}
	}
	OUT0=pwm_count>PWM_1?0:1;
	OUT1=pwm_count>PWM_2?0:1;
	OUT2=pwm_count>PWM_3?0:1;
	OUT3=pwm_count>PWM_4?0:1;
}

char getchar1 (void)
{
	char c;
	while (!(SCON1 & 0x01));
	SCON1 &= ~0x01;
	c = SBUF1;
	return (c);
}

void main (void)
{

	volatile float V[3], R=0, L=0;
	char C;
	float thresholdL=0.800/*****/;
	float thresholdR=0.800/*****/;
	int z;

	InitPinADC(2, 1); // Configure P2.1 as analog input
	InitPinADC(2, 2); // Configure P2.2 as analog input
	InitPinADC(2, 7);
	InitADC();
	if(Volts_at_Pin(LQFP32_MUX_P2_7)>2.5)
	{
		interrupt_switch=0;
		while(1)
		{
			PWM_1 = 0;
			PWM_2 = 0;
			PWM_3 = 0;
			PWM_4 = 0;
			L=0;
			R=0;
			for(z=0; z<30; z++)
			{
				V[0]=Volts_at_Pin(LQFP32_MUX_P2_3);
				if(V[0]>L)
					L=V[0];
				V[0]=L;
			}
			for(z=0; z<30; z++)
			{
				V[1]=Volts_at_Pin(LQFP32_MUX_P2_0);
				if(V[1]>R)
					R=V[1];
				V[1]=R;
			}
		
			if (V[0] > thresholdL+0.1 && V[1] > thresholdR+0.1 )
			{
				switchs=2;
			}
			else if (V[0] < thresholdL-0.2 && V[1] < thresholdR-0.2 && V[0] > 0.1 && V[1] > 0.1)
			{
				switchs=1;
			}
			else if (V[1]<=0.1 && V[0]<=0.1)
			{
				switchs=0;
			}
			else if (V[0] < thresholdL-0.2)
			{
				switchs=3;
			}
			else if (V[1] < thresholdR-0.2)
			{
				switchs=4;
			}
			else if (V[0] > thresholdL+0.2)
			{
				switchs=5;
			}
			else if (V[1] > thresholdR+0.2)
			{
				switchs=6;
			}
			waitms(4);
		}
	}
	else
	{
		interrupt_switch=1;
		while(1)
		{
			PWM_1 = 0;
			PWM_2 = 0;
			PWM_3 = 0;
			PWM_4 = 0;
		 	SCON1 |= 0x01;
			C = getchar1();
			printf("char: %c\r", C);
			//C -= 20;
			if (C == 'F')//input the voltage value for forward )
			{
				PWM_1 = 0;
				PWM_2 = 100;
				PWM_3 = 0;
				PWM_4 = 100;
			}
			else if (C == 'B')// for backward
			{
				PWM_1 = 100;
				PWM_2 = 0;
				PWM_3 = 100;
				PWM_4 = 0;
			}
			else if (C == 'R')//turn right
			{  
				PWM_1 = 0;
				PWM_2 = 100;
				PWM_3 = 50;
				PWM_4 = 0;
		 	}

		 	else if (C == 'L')//turn left
			{
				PWM_1 = 50;
				PWM_2 = 0;
				PWM_3 = 0;
				PWM_4 = 100;
		 	}
		 	
		 	else  // if there is no signal, the robot doesn't move.
		 	{	
		 		PWM_1 = 0;
				PWM_2 = 0;
				PWM_3 = 0;
				PWM_4 = 0;
		 	}
		 	waitms(5);
		 }
	}

}
