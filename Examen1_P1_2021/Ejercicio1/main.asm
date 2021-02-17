.global main

.data

.text
main:
    addiu $sp, $sp, -24
    sw $s0, 16($sp)
    sw $ra, 20($sp)
    li $s0, 2
$L2:
    move $a0, $s0
    jal draw_triangle
    li $a0, 10
    jal print_char
    addiu $s0, $s0, 1
    li $v0, 10
    bne $s0, $v0, $L2
    lw $ra, 20($sp)
    lw $s0, 16($sp)
    move $v0, $zero
    addiu $sp, $sp, 24
    jr $ra
