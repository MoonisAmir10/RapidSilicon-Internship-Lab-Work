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
    int A[12] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    int B[12] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    int C[12] = {0};
    int k = 0, l = 0;

    for (int i = 0; i < 12; i++)
    {
        C[i] = A[i] + B[12 - i - 1];
    }    

    uartInit();

    while(1)
    {
         if(k == 12)
        {
            k = 0;
        }

        printfNexys("Element in resulant vector: %d\n", C[k]);

        for(int i=0; i < 10000000; i++)  // delay between printf's
        {
            l++;
        }

        k++;
    }
}