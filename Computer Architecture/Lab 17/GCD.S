// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

# .equ GPIO_SWs = 0x80001400

.globl main
main:
  li x1, 270    # A
  li x2, 192    # B
  li x7, 1      # flag
  li x10, 1
  li x11, 0

while_1:
  bne x7, x10, end_loop_1
  
  bne x1, x11, cont_if_1
  addi x8, x2, 0 # GCD = B
  li x7, 0 # flag = 0
  j while_1

  cont_if_1:

  bne x2, x11, cont_if_2
  addi x8, x1, 0 # GCD = A
  li x7, 0 
  j while_1

  cont_if_2:

  div x3, x1, x2   # Q = A / B
  rem x4, x1, x2   # R = A % B

  addi x1, x2, 0   # A = B
  addi x2, x4, 0   # B = R

  j while_1

end_loop_1:

repeat:
  j repeat
  
  

