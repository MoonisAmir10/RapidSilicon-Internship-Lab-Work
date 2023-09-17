.data  
    array: .word 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   # Initialize the array with some values
    array_size: .word 12              # Store the size of the array

.text
.globl main
main:
    # Load the array address into a register
    la a0, array

    # Load the array size into a register
    lw a1, array_size

    # Initialize a counter j
    li t0, 0  
    li t4, 10

    for_loop:
      lw t1, 0(a0)    # t1 = array[j]
      lw t2, 4(a0)    # t2 = array[j + 1]
      add t3, t1, t2  # t3 = array[j] + array[j + 1]
      sw t3, 8(a0)    # array[j + 2] = t3

      addi t0, t0, 1  # j++
      addi a0, a0, 4  # move to next element

      bltu t0, t4, for_loop 
    
 repeat:
   j repeat

.end 
  
  