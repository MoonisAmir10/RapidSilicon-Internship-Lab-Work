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
    unsigned int n = 7, fact = 0, l = 0;

    fact = n;

    for (int i = 0; i < (n - 1); i++)
    {
        fact = fact * (n - (i + 1));
    }

    uartInit();

    while(1)
    {
        printfNexys("Factorial of 7 is: %d\n", fact);

        for(int i=0; i < 10000000; i++)  // delay between printf's
        {
            l++;
        }
    }

    return 0;
}