#include "GPIO_SW_LEDs.h"

#if defined(D_NEXYS_A7)
   #include <bsp_printf.h>
   #include <bsp_mem_map.h>
   #include <bsp_version.h>
#else
   PRE_COMPILED_MSG("no platform was defined")
#endif
#include <psp_api.h>

int main()
{
    int A = 270, B = 192, GCD = 0, j = 0;
    int R = 0, Q = 0, flag = 1;
    double div;

    while (flag)
    {
        if (A == 0)
        {
            GCD = B;
            flag = 0;
        }

        else if (B == 0)
        {
            GCD = A;
            flag = 0;
        }

        else
        {
            div = (float) A / (float) B;

            Q = A / B;

            R = (div - Q) * B;

            A = B;
            B = R;
        }


    }

   /* Initialize Uart */
   uartInit();

    while (1)
    {
        /* Print result of GCD */
        printfNexys("Greatest Common Divisor = %d\n", GCD);

        for(int i=0; i < 10000000; i++)  // delay between printf's
	    {
             j++;
        }
    }
    

    return 0;
}