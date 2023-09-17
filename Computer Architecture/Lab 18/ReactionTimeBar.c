#if defined(D_NEXYS_A7)
   #include <bsp_printf.h>
   #include <bsp_mem_map.h>
   #include <bsp_version.h>
#else
   PRE_COMPILED_MSG("no platform was defined")
#endif
#include <psp_api.h>

#include <stdlib.h>
#include <time.h>
#include <math.h>

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
void InitGame();

//Main Function
int main()
{
    unsigned int rand_delay = 0, reaction_time = 0, j = 0;

    IOsetup();

    uartInit();

    writeValtoLEDs(0); //turn off all leds

    InitGame();

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
          //writeValtoLEDs(reaction_time);
          if (reaction_time <= 180)
          {
            writeValtoLEDs(0x0001);
          }

          else if (reaction_time > 180)
          {
            double val = 0;
            
            val = ((double) (reaction_time - 180)) / ((double) 50);

            if (((double) val) > 0 && val <= 1)
            {
                writeValtoLEDs(0x0003);
            }

            else if (((double) val) > 1.00000f)
            {
                unsigned int val_int = val;

                unsigned int power = val_int + 2;

                unsigned int var = 1;

                for (int l = 0; l < power; l++)
                {
                    var = var * 2;
                }

                writeValtoLEDs(var - 1);
            }
          }

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

// Waits for user to toggle right-most switch (SW[0]) on and then off to initiate game
void InitGame() {
  unsigned int numTicks = 0;

  // if not already on, wait for user to toggle switch on first
  while ( !(getSwitchesInput() & 0x0001) ) 
    numTicks++;    

  while (  (getSwitchesInput() & 0x0001) )    // wait for user to toggle switch off
    numTicks++;

  srand(numTicks);
}

