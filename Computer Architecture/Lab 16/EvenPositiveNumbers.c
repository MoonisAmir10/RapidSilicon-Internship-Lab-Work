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
    int j = 0, B[20] = {0}, k = 0;

    for (int i = 0; i < 12; i++)
    {
        if ((A[i] % 2) == 0)
        {
            B[j] = A[i];

            j++;
        }
    }

    /* Initialize Uart */
   uartInit();

    while (1)
    {
         if(k == j)
        {
            k = 0;
        }

        printfNexys("Element in array: %d\n", B[k]);

        for(int i=0; i < 10000000; i++);  // delay between printf's
        
        printfNexys("Num of elements in B: %d\n", j);

        for(int i=0; i < 10000000; i++);  // delay between printf's

        k++;
    }

    return 0;
}