#include "GPIO_SW_LEDs.h"

int main()
{
    int En_Value=0xFFFF, switches_value, result, op1, op2, mask_MSB = 0xF000, mask_LSB = 0x000F;

    WRITE_GPIO(GPIO_INOUT, En_Value);

    while (1)
    {
        switches_value = READ_GPIO(GPIO_SWs);   // read value on switches
        switches_value = switches_value >> 16;  // shift into lower 16 bits

        op1 = switches_value & mask_MSB;
        op1 = op1 >> 12;

        op2 = switches_value & mask_LSB;

        result = op1 + op2;

        WRITE_GPIO(GPIO_LEDs, result);

    }

    return 0;
}