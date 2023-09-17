.data  
    arr_A: .word 0, 1, 5, 2, 3, 4, 9, 6, 11, 10, 7, 8   # Initialize the array with some values
    arr_size_A: .word 12              # Store the size of the array

.text
.globl main
main:
    # Load the array address into a register
    la a0, arr_A

    li t0, 0    # flag = 0
    li t1, 0    # i
    li t5, 11

    while:
        bne t0, zero, end_while_loop
        li t0, 1
        li t1, 0
        for:
            lw t2, 0(a0)  # V[i]
            lw t3, 4(a0)  # V[i + 1]
            bge t3, t2, cont_for_loop
            addi t4, t2, 0
            addi t2, t3, 0
            addi t3, t4, 0
            li t0, 0 
        cont_for_loop:
            addi t1, t1, 1
            addi a0, a0, 4
            blt t1, t5, for
        end_for_loop:
        j while
    end_while_loop:

repeat:
    j repeat

.end