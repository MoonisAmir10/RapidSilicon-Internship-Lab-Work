#if defined(D_NEXYS_A7)
   #include <bsp_printf.h>
   #include <bsp_mem_map.h>
   #include <bsp_version.h>
#else
   PRE_COMPILED_MSG("no platform was defined")
#endif
#include <psp_api.h>

#include <stdlib.h>

// memory-mapped I/O addresses
#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408

#define DELAY 0x3B9            /* Define the DELAY - empirical number approximately equal to 1 ms */

#define READ_GPIO(dir) (*(volatile unsigned *)dir)
#define WRITE_GPIO(dir, value) { (*(volatile unsigned *)dir) = (value); }

//Function Prototypes
void IOsetup();
unsigned int getSwitchesInput();
void writeValtoLEDs(unsigned int val);
void delay(int num);

//Main Function
int main()
{
    unsigned int rand_delay = 0, reaction_time = 0, j = 0;

    IOsetup();

    uartInit();

    while(1)
    {
       if (getSwitchesInput() != 0x0001)
       { 
          reaction_time = 0;
          writeValtoLEDs(0); //turn off all leds
          rand_delay = 1000 * (rand() % 4); // num will be between 0 to 3 seconds
          delay(rand_delay);  
          writeValtoLEDs(0xFFFF); //all leds turn on
          
          while (getSwitchesInput() != 0x0001)
          {
            delay(1); //1 ms
            reaction_time += 1;
          }
       }

       if (getSwitchesInput() == 0x0001)
       {
          writeValtoLEDs(reaction_time);

          printfNexys("Reaction Time is = %d\n", reaction_time);

          for(int i=0; i < 10000000; i++)  // delay between printf's
	      {
             j++;
          }
       }
    }

    return 0;
}


//Function Definitions
void IOsetup() {
  int En_Value=0xFFFF;
  WRITE_GPIO(GPIO_INOUT, En_Value);
}

unsigned int getSwitchesInput()
{
  unsigned int val;

  val = READ_GPIO(GPIO_SWs);   // read value on switches        
  val = val >> 16;  // shift into lower 16 bits

  return (val);
}

void writeValtoLEDs(unsigned int val) {
  WRITE_GPIO(GPIO_LEDs, val);  // display val on LEDs
}

void delay(int num)
{
 volatile int i, j, cnt = DELAY;

  for (i = 0; i < num; i++)
    for (j = 0; j < cnt; j++)
      ;
}
