.data  
    arr_A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12   # Initialize the array with some values
    arr_size_A: .word 12              # Store the size of the array
    
    arr_B: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    arr_size_B: .word 12

    arr_C: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    arr_size_C: .word 12

.text
.globl main
main:
    # Load the array address into a register
    la a0, arr_A

    la a1, arr_B

    lw a2, arr_C

    # Initialize a counter i
    li t0, 0  
    li t1, 12

    addi a1, a1, 44

    for_loop:
      lw t2, 0(a0)
      lw t3, 0(a1)
      add t4, t2, t3
      sw t4, 0(a2)

      addi t0, t0, 1
      addi a0, a0, 4
      addi a1, a1, -4
      addi a2, a2, 4

      bltu t0, t1, for_loop

repeat:
  j repeat

.end

      