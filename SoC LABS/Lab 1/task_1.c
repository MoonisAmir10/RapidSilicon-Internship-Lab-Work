#include "GPIO_SW_LEDs.h"

#define DELAY_FAST 0x500000
#define DELAY_SLOW 0x200000

int main()
{
    int En_Value=0xFFFF, i, cnt, delay_speed = DELAY_SLOW, start_val = 0xF000;

    WRITE_GPIO(GPIO_INOUT, En_Value);

    while (1)
    {
        int scroll_cnt = 12, switches_value = 0;
        unsigned int led_val = start_val;

        switches_value = READ_GPIO(GPIO_SWs);
        switches_value = switches_value >> 16;

        WRITE_GPIO(GPIO_LEDs, led_val);


        //SW[0] is high
        if ((switches_value & 0x0001) == 0x0001)
        {
            delay_speed = DELAY_SLOW;
        }

        else
        {
            delay_speed = DELAY_FAST;
        }

        // delay
	    cnt = delay_speed;
	    i = 0;
	    while (i < cnt)
          i++;
        
        
        for (int j = 0; j < scroll_cnt; j++)
        {
            if ((switches_value & 0x0002) == 0x0002)
            {
                start_val = 0x000F;

                led_val = led_val << 1;

            }

            else
            {
                start_val = 0xF000;

                led_val = led_val >> 1;
            }

            WRITE_GPIO(GPIO_LEDs, led_val);

            // delay
	        cnt = delay_speed;
	        i = 0;
	        while (i < cnt)
              i++;
            

            switches_value = READ_GPIO(GPIO_SWs);
            switches_value = switches_value >> 16;

            //SW[0] is high
           if ((switches_value & 0x0001) == 0x0001)
           {
              delay_speed = DELAY_SLOW;
           }
           
           else
           {
              delay_speed = DELAY_FAST;
           }
        }

        /* for (int j = 0; j < scroll_cnt; j++)
         {
            led_val = led_val << 1;

            WRITE_GPIO(GPIO_LEDs, led_val);

            // delay
	        cnt = DELAY_FAST;
	        i = 0;
	        while (i < cnt)
              i++;
         } */

        
        //WRITE_GPIO(GPIO_LEDs, led_val);

        // delay
	   /*  cnt = DELAY_FAST;
	    i = 0;
	    while (i < cnt)
          i++; */

    }

    return 0;
}