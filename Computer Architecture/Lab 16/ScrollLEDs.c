#include "GPIO_SW_LEDs.h"

#define DELAY 0x500000 

int main()
{
    int En_Value=0xFFFF, i, cnt;

    WRITE_GPIO(GPIO_INOUT, En_Value);

    while (1)
    {
        int scroll_cnt = 15;
        unsigned int led_val = 0x8000;
        unsigned int val_add = 0x8000;

        WRITE_GPIO(GPIO_LEDs, led_val);

        // delay
	    cnt = DELAY;
	    i = 0;
	    while (i < cnt)
          i++;
        
        while (scroll_cnt != 0)
        {
        for (int j = 0; j < scroll_cnt; j++)
        {
            led_val = led_val >> 1;

            WRITE_GPIO(GPIO_LEDs, led_val);

            // delay
	        cnt = DELAY;
	        i = 0;
	        while (i < cnt)
              i++;
        }

        for (int j = 0; j < scroll_cnt; j++)
         {
            led_val = led_val << 1;

            WRITE_GPIO(GPIO_LEDs, led_val);

            // delay
	        cnt = DELAY;
	        i = 0;
	        while (i < cnt)
              i++;
         }

        led_val = led_val + (val_add / 2);
        val_add = val_add / 2;
        scroll_cnt = scroll_cnt - 1;
        
        WRITE_GPIO(GPIO_LEDs, led_val);

        // delay
	    cnt = DELAY;
	    i = 0;
	    while (i < cnt)
          i++;

        }

    }

    return 0;
}