#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408

#define GPIO2_BTNs  0x80001800
#define GPIO2_INOUT 0x80001808

#define GPIO3_BTNs  0x8000101C

#define DELAY_LARGE 0x500000
#define DELAY_SMALL 0x100000

#define READ_GPIO(dir) (*(volatile unsigned *)dir)
#define WRITE_GPIO(dir, value) { (*(volatile unsigned *)dir) = (value); }

int main()
{
    int i = 0, cnt = 0, En_value = 0xFFFF, led_val = 0, delay = DELAY_LARGE;

    WRITE_GPIO(GPIO_INOUT, En_value);
    WRITE_GPIO(GPIO2_INOUT, 0);            //configuring 2nd btn module to be input

    while(1)
    {
        if ((READ_GPIO(GPIO2_BTNs) & 0x1) == 0x1)
        {
            delay = DELAY_SMALL;
        }
        else
        {
            delay = DELAY_LARGE;
        }

        if ((READ_GPIO(GPIO3_BTNs) & 0x2) == 0x2)
        {
            led_val = 0;
        }
        else
        {
            led_val++;
        }

        WRITE_GPIO(GPIO_LEDs, led_val);

        i = 0;
        cnt = delay;
        while (i < cnt)
          i++;
    }


    return 0;
}