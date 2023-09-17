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
  sw t1, 8(t0)        # GPIO_INOUT = 0xFFFF

repeat:
  lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
  srli t1, t1, 16     # shift val to the right by 16 bits
  sw   t1, 4(t0)      # write value to LEDs: GPIO_LEDs = t1 

  # delay
  li t3, 0x500000
  li t4, 0
loop_start_1:
  bge t4, t3, cont_1
  addi t4, t4, 1
  j loop_start_1 
cont_1:
  
  li t5, 0
  sw t5, 4(t0) # turn off leds

  li t3, 0x500000
  li t4, 0
loop_start_2:
  bge t4, t3, cont_2
  addi t4, t4, 1
  j loop_start_2 
cont_2:
  j    repeat         # repeat loop