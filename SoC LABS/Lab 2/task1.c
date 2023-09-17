#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408

#define GPIO2_BTNs  0x80001800
#define GPIO2_INOUT 0x80001808

#define GPIO3_BTNs  0x8000101C

#define DELAY_LARGE 0x500000
#define DELAY_SMALL 0x100000

#define ENABLES_REG 0x80001038
#define DIGITS_REG  0x8000103C

#define READ_GPIO(dir) (*(volatile unsigned *)dir)
#define WRITE_GPIO(dir, value) { (*(volatile unsigned *)dir) = (value); }

int main()
{
    int i = 0, val = 0, en = 0x01, count = 0, dec_val = 0;
    
    //active low enable
    WRITE_GPIO(ENABLES_REG, (~en));

    WRITE_GPIO(GPIO_INOUT, 0xFFFF);

    while (1) 
    {
        WRITE_GPIO(DIGITS_REG, val);

        val = val << 4;
        en = en << 1;

        for(i=0;i<10000000;i++);

        WRITE_GPIO(ENABLES_REG, ~en);
        //WRITE_GPIO(DIGITS_REG, val);

        //for(i=0;i<100000;i++);

        count++;

        if (count == 8)
        {
            dec_val++;

            if (dec_val == 9)
            {
                dec_val = 0;
            }

            count = 0;
            val = dec_val;
            en = 0x01;
        }
    }

    return 0;
}