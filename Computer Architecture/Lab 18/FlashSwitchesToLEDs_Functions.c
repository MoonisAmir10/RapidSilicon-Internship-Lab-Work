#include <stdlib.h>

// memory-mapped I/O addresses
#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408

#define DELAY 0x3B9            /* Define the DELAY - empirical number approximately equal to 1 ms */

#define READ_GPIO(dir) (*(volatile unsigned *)dir)
#define WRITE_GPIO(dir, value) { (*(volatile unsigned *)dir) = (value); }

void IOsetup();
unsigned int getSwitchesInput();
void writeValtoLEDs(unsigned int val);

void delay(int num);

int main()
{
    unsigned int switches_value = 0;

    IOsetup();

    while(1)
    {
       switches_value = getSwitchesInput();
       writeValtoLEDs(switches_value);
       delay(1000);  // 1000 ms = 1 sec
       writeValtoLEDs(0);
       delay(1000);
    }

    return 0;
}

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
