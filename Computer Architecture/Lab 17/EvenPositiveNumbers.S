.data  
    arr_A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12   # Initialize the array with some values
    arr_size_A: .word 12              # Store the size of the array
    
    arr_B: .word 0, 0, 0, 0, 0, 0
    arr_size_B: .word 6

.text
.globl main
main:
    # Load the array address into a register
    la a0, arr_A

    # Load the array size into a register
    lw a1, arr_size_A

    la a2, arr_B

    lw a3, arr_size_B

    # Initialize a counter i
    li t0, 0  
    li t1, 12
    li t4, 2

    for_loop:
      lw t2, 0(a0)
      rem t3, t2, t4
      bne t3, zero, cont_loop
      sw t2, 0(a2)
      addi a2, a2, 4
     cont_loop:
       addi t0, t0, 1
       addi a0, a0, 4
       bltu t0, t1, for_loop
    
repeat:
 j repeat

.end



      