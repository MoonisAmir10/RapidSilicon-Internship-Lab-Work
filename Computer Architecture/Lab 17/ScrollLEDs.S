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
 # lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
 # srli t1, t1, 16     # shift val to the right by 16 bits
 # sw   t1, 4(t0)      # write value to LEDs: GPIO_LEDs = t1

   li t3, 15 # scroll count
   li t4, 0x8000 # led_val
   li t5, 0x8000 # val_add

   sw t4, 4(t0) 

   # delay
   li x12, 0x500000
   li x13, 0
loop_start_1:
   bge x13, x12, cont_1
   addi x13, x13, 1
   j loop_start_1 
cont_1:

while_scroll_cnt_not_0:
   li x17, 0
   beq t3, x17, end_while_loop
   
   
   li x14, 0 # j
   for_loop_1:
     srli t4, t4, 1
     sw t4, 4(t0)
      # delay
      li x12, 0x500000
      li x13, 0
     loop_start_2:
      bge x13, x12, cont_2
      addi x13, x13, 1
      j loop_start_2 
      cont_2:
      addi x14, x14, 1
      bltu  x14, t3, for_loop_1 

   li x14, 0 # j
   for_loop_2:
     slli t4, t4, 1
     sw t4, 4(t0)
      # delay
      li x12, 0x500000
      li x13, 0
     loop_start_3:
      bge x13, x12, cont_3
      addi x13, x13, 1
      j loop_start_3 
      cont_3:
      addi x14, x14, 1
      bltu  x14, t3, for_loop_2 

   li x15, 2
   div t5, t5, x15
   add t4, t4, t5 
   addi t3, t3, -1

   sw t4, 4(t0) 

    # delay
      li x12, 0x500000
      li x13, 0
     loop_start_4:
      bge x13, x12, cont_4
      addi x13, x13, 1
      j loop_start_4 
      cont_4:

   j while_scroll_cnt_not_0     

end_while_loop:

  j    repeat         # repeat loop