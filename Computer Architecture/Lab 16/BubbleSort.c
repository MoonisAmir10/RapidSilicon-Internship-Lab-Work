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
    int V[12] = {0, 1, 5, 2, 3, 4, 9, 6, 11, 10, 7, 8}, temp = 0, flag = 0, k = 0, l = 0;

    while (!flag)
    {
      flag = 1;

      for (int i = 0; i < 11; i++)
      {
        if (V[i + 1] < V[i])
        {
            temp = V[i];
            V[i] = V[i + 1];
            V[i + 1] = temp;
            
            flag = 0;
        }
        
      }
    }

    uartInit();

    while(1)
    {
         if(k == 12)
        {
            k = 0;
        }

        printfNexys("Element in resulant vector: %d\n", V[k]);

        for(int i=0; i < 10000000; i++)  // delay between printf's
        {
            l++;
        }

        k++;
        l = 0;
    }

    return 0;
}