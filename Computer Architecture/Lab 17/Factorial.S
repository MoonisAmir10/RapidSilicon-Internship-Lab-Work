.globl main
main:
    li t0, 7
    addi t1, t0, 0  // t1 = fact
    addi t2, t0, -1   # n - 1

    li a0, 0

    for:
        addi t4, a0, 1
        sub t5, t0, t4
        mul t1, t1, t5
        addi a0, a0, 1
        bltu a0, t2, for
    end_loop:

repeat:
  j repeat



       