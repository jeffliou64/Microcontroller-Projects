#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>


#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

volatile float period;
volatile float phase;
volatile float amplitude1;
volatile float amplitude2;
float leash;
//volatile float frequency;

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



void phase_finder(unsigned char pin1, unsigned char pin2)
{
	//time from pin1 reaches max voltage to time pin2 reaches max voltage
	
	//change pins if needed
	while(pin1!=0);
	waitms(1);
	while(pin1!=1);
	waitms(1);
	TL0=0; 
	TH0=0;	
	TF0=0;
	TR0=1;
	while(pin2!=1);
	waitms(1);	
	TR0=0;
	phase=((TH0*0x100+TL0)*(12.0/SYSCLK))*freq*360;
}

float amplitude_finder(unsigned char pin)
{

	while(pin!=0);
	waitms(1);
	while(pin!=1);
	waitms(1);
	TL0=0; 
	TH0=0;	
	TF0=0; 
	TR0=1;
	waitms(1000*(period/4));
	TR0=0;
	//change pin if needed
	amplitude = Volts_at_Pin(LQFP32_MUX_P2_3);
	return amplitude;
}

float frequency_finder(unsigned char pin)
{
	//change pins if needed
	while(pin!=0); // Wait for the signal to be zero
	waitms(1);
	while(pin!=1); // Wait for the signal to be one
	waitms(1);
	TR0=1; // Start the timer
	while(pin!=0); // Wait for the signal to be zero
	waitms(1);
	TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	period=(TH0*0x100+TL0)*2*(12.0/SYSCLK)*(-1);
	
	frequency=(1.0/period);
	return frequency;
}

void main(void)
{
	//2 modes: autonomous & controller
	//AUTNOMOUS:
	//read voltage (amplitude), frequency, phase
	//determine phase range, then determine voltage difference (amplitude)
	//85<phase<95: check amplitude , otherwise rotate
	//rotate: phase<90=turn right, phase>90=turn left
	//check amplitudes for flag value: too small=forward, too large=backward
	//
	//
	//CONTROLLER:
	//read frequency from transmitter
	//move accordingly
	//

	float flag1;
	float flag2;
	//modechanger: 0 for autnomous, 1 for controller
	int modechanger=0; 
	
	//intializations
	PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
	PORT_Init();     // Initialize Port I/O
	SYSCLK_Init ();  // Initialize Oscillator
	UART0_Init();    // Initialize UART0
	TIMER0_Init();
	
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	
	//NEED TO CHANGE PIN NUMBERS
	InitPinADC(2, 0); // Configure P2.0 as analog input
	InitPinADC(2, 0); // Configure P2.0 as analog input
	InitADC();
	
	while(1)
	{
		//AUTNOMOUS:
		//frequency&period 1st, voltage 2nd, phase 3rd
		//use phase_finder to determine current phase
		//rotate if phase not within range
		//use amplitude_finder to determine amplitude1 and amplitude2
		//move forward/backward if amplitudes are not within flag range
		
		//CONTROLLER:
		//use frequency_finder to determine current frequency
		//if <> ; move forward
		//if <> ; move backward
		//if <> ; turn left
		//if <> ; turn right
		
		PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
    	// Reset the counter
		TL0=0; 
		TH0=0;
		TF0=0;
		overflow_count=0;
		
		frequency=frequency_finder(/*pin1*/);
		amplitude1=amplitude_finder(/*pin1*/);
		phase=phase_finder(/*pin1, pin2*/);
		
		if (modechanger==0)
		{
			//amplitude1=amplitude_finder(/*pin1*/);
			//phase=phase_finder(/*pin1, pin2*/);
			if(phase<=95&&phase>=85)
			{
				if(amplitude<leash-5.0)
				{
					while(amplitude<leash-5.0)
					{
						PWM_1 = 0;
						PWM_2 = 100;
						PWM_3 = 0;
						PWM_4 = 100;//go forward
						waitms(1)
						PWM_2 = 0;
						PWM_4 = 0;
						amplitude1=amplitudefinder(/*pin1*/)
					}
				}
				else if(amplitude>leash+5.0)
				{
					while(amplitude>leash+5.0)
					{
						PWM_1 = 100;
						PWM_2 = 0;
						PWM_3 = 100;
						PWM_4 = 0;
						waitms(1)
						PWM_1 = 0;
						PWM_3 = 0;
						//go backward
						//for 1 ms
						//check amplitude
						amplitude1=amplitudefinder(/*pin1*/)
					}
				}
				if(amplitude<=leash+5.0 && amplitude>=leash-5.0)
				{
				
					//don't move
					PWM_1 = 0;
					PWM_2 = 0;
		 			PWM_3 = 0;
		 			PWM_4 = 0;
					//for 1ms
					waitms(1);
					//check amplitude
					amplitude1=amplitudefinder(/*pin1*/)
				}
			}
			else if(phase<85)
			{
				while(phase<85)
				{
					//turn right
					PWM_1 = 0;
					PWM_2 = 100;
		 			PWM_3 = 100;
		 			PWM_4 = 0;
					//for 1ms
					waitms(1);
					PWM_2 = 0;
					PWM_3 = 0;
					phase=phase_finder(/*pin1, pin2*/);
				}
			}
			else if(phase>95)
				while(phase>)
				{
					//turn left
					PWM_1 = 100;
					PWM_2 = 0;
			 		PWM_3 = 0;
			 		PWM_4 = 100;
					//for 1ms
					waitms(1);
					PWM_1 = 0;
					PWM_4 = 0;
					phase=phase_finder(/*pin1, pin2*/);
				}
			}
		}//end autonomous
		
		else if (modechanger==1)
		{
			//frequency=frequency_finder(/*pin1*/);
			if (frequency>/*value1*/ && frequency</*value2*/)
			{
				//move forward
			}
			else if (frequency>/*value3*/ && frequency</*value4*/)
			{
				//move backward
			}
			else if (frequency>/*value5*/ && frequency</*value6*/)
			{
				//turn left
			}
			else if (frequency>/*value7*/ && frequency</*value8*/)
			{
				// turn right
			}
			
		}//end controller
	}//end while
}//end main

