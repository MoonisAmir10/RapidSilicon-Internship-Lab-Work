// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

.equ DELAY_SMALL, 0x200000
.equ DELAY_LARGE, 0x500000

.globl main

main:
  li t0, 0x80001400   # base address of GPIO memory-mapped registers
  li t1, 0xFFFF       # set direction of GPIOs
                      # upper half = switches (inputs)  (=0)
                      # lower half = outputs (LEDs)     (=1)
  sw t1, 8(t0)        # GPIO_INOUT = 0xFFFF

  li s1, 0xF000       # start_val

  li t5, DELAY_LARGE

repeat:

  li t3, 12 # scroll count
  mv t4, s1 # led_val

  lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
  srli t1, t1, 16     # shift val to the right by 16 bits

  sw t4, 4(t0)        # Write to LEDs

  if_sw0_high:
    and t1, t1, 0x0001
    li t2, 0x0001
    bne t1, t2, if_sw0_not_high

    li t5, DELAY_SMALL
    j if_end_1
  
  if_sw0_not_high:
    li t5, DELAY_LARGE

  if_end_1:
    
    # delay
    mv x12, t5
    li x13, 0
  loop_start_1:
    bge x13, x12, cont_1
    addi x13, x13, 1
    j loop_start_1 
  cont_1:

    li x14, 0  # i
  for_loop:
      lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
      srli t1, t1, 16     # shift val to the right by 16 bits
    if_sw1_high:
      and t1, t1, 0x0004
      li t2, 0x0004
      bne t1, t2, if_sw1_not_high

      li s1, 0x000F
      slli t4, t4, 1
      j if_end_2
  
    if_sw1_not_high:
      li s1, 0xF000
      srli t4, t4, 1

    if_end_2:

      sw t4, 4(t0)

      # delay
      mv x12, t5
      li x13, 0
    loop_start_2:
      bge x13, x12, cont_2
      addi x13, x13, 1
      j loop_start_2 
    cont_2:

      lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
      srli t1, t1, 16     # shift val to the right by 16 bits

    if_sw0_high_2:
      and t1, t1, 0x0001
      li t2, 0x0001
      bne t1, t2, if_sw0_not_high_2

      li t5, DELAY_SMALL
      j if_end_3
  
    if_sw0_not_high_2:
      li t5, DELAY_LARGE

    if_end_3: 

      addi x14, x14, 1
      bltu x14, t3, for_loop

  j repeat