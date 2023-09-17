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
    unsigned int rand_num = 0, led_val = 1, iteration = 1;

    unsigned int rand_arr[2] = {0, 2};

    unsigned int pattern[9] = {0};

    IOsetup();

    InitGame();

    while(1)
    {
      //switches_value = getSwitchesInput();

        led_val = 1;

        if (getSwitchesInput() == 0x8000)
        {
            rand_num = rand() % 3;

            for (int i = 0; i < rand_num; i++)
            {
                led_val = led_val * 2;
            }

            writeValtoLEDs(led_val);

            delay(500);

            if (iteration == 1)
            {
               pattern[0] = led_val;
               pattern[1] = 0;

               writeValtoLEDs(0);
            }
            
            else if (iteration == 2)
            {
                if (rand_num == 2)
                {
                  rand_num = rand() % 2;

                  if (rand_num == 0)
                  {
                    led_val += 1;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                  
                  else 
                  {
                    led_val += 2;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                }

                else if (rand_num == 0)
                {
                  rand_num = (rand() % 2) + 1;

                  if (rand_num == 1)
                  {
                    led_val += 2;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                  
                  else
                  {
                    led_val += 4;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                }

                else
                {
                  rand_num = rand_arr[rand() % 2];
                  
                  if (rand_num == 0)
                  {
                    led_val += 1;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }

                  else
                  {
                    led_val += 4;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                }
            }

            else if (iteration == 3)
            {
              if (rand_num == 2)
                {
                  rand_num = rand() % 2;

                  if (rand_num == 0)
                  {
                    led_val += 1;

                    writeValtoLEDs(led_val);

                    delay(500);

                    led_val += 2;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);

                  }
                  
                  else
                  {
                    led_val += 2;

                    writeValtoLEDs(led_val);

                    delay(500);

                    led_val += 1;

                    writeValtoLEDs(led_val);
                    
                    delay(500);

                    writeValtoLEDs(0);
                  }
                }

                else if (rand_num == 0)
                {
                  rand_num = (rand() % 2) + 1;

                  if (rand_num == 1)
                  {
                    led_val += 2;

                    writeValtoLEDs(led_val);

                    delay(500);

                    led_val += 4;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                  
                  else
                  {
                    led_val += 4;

                    writeValtoLEDs(led_val);

                    delay(500);

                    led_val += 2;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                }

                else
                {
                  rand_num = rand_arr[rand() % 2];
                  
                  if (rand_num == 0)
                  {
                    led_val += 1;

                    writeValtoLEDs(led_val);

                    delay(500);

                    led_val += 4;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }

                  else
                  {
                    led_val += 4;

                    writeValtoLEDs(led_val);

                    delay(500);

                    led_val += 1;

                    writeValtoLEDs(led_val);

                    delay(500);

                    writeValtoLEDs(0);
                  }
                }
            }

            delay(500);

            iteration++;

            if (iteration == 4)
            {
              iteration = 1;
              led_val = 1;
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
  while ( !(getSwitchesInput() & 0x8000) ) 
    numTicks++;    

  while (  (getSwitchesInput() & 0x8000) )    // wait for user to toggle switch off
    numTicks++;

  srand(numTicks);
}


