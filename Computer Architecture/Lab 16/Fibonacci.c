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
    int V[12] = {0};
    int i = 0, j = 0, k = 0;

    V[0] = 0;
    V[1] = 1;

    for (int j = 0; j < 10; j++)
    {
        V[j + 2] = V[j + 1] + V[j];
    }

/* Initialize Uart */
   uartInit();

    while (1)
    {
        if (k == 12)
        {
            k = 0;
        }

        /* Print result of GCD */
        printfNexys("Element in sequence: %d\n", V[k]);

        for(i=0; i < 10000000; i++)  // delay between printf's
	    {
             j++;
        }

        k++;
    }

    return 0;
}