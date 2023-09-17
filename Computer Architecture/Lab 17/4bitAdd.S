// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

# .equ GPIO_SWs = 0x80001400

.globl main
main:
  li t0, 0x80001400   # base address of GPIO memory-mapped registers
  li t1, 0xFFFF       # set direction of GPIOs
                      # upper half = switches (inputs)  (=0)
                      # lower half = outputs (LEDs)     (=1)

  li x12, 0xF000 # mask_MSB
  li x13, 0x000F # mask_LSB


  sw t1, 8(t0)        # GPIO_INOUT = 0xFFFF

repeat:
  lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
  srli t1, t1, 16     # shift val to the right by 16 bits

  and x14, t1, x12
  srli x14, x14, 12

  and x15, t1, x13

  add x16, x14, x15

  sw  x16, 4(t0)      # write value to LEDs: GPIO_LEDs = x16

  j    repeat         # repeat loop