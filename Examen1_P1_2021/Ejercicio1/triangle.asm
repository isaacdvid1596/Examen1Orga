;h->$a0

.global draw_triangle

draw_triangle:

;total floors = user input
move $t0,$a0

;max number of spaces per floor (outside)
move $t1,$a0
addi $t1,$t1,-1

;max number of asterisk per floor
li $t2,1

;max number of spaces per floor (inside)
li $t3,0

;si estamos en el primero piso , NO IMPRIMIR SPACE inside

;curr floor
li $t7,0


start:

    ;curr number of spaces(outside)
    li $t4,0

    ;curr number of spaces(inside)
    li $t5,0

    ;curr number of asterisk
    li $t6,0


    print_outside_space:


    beq $t4,$t1,print_asterisk

    ;print space

    li $a0,32
    li $v0,11
    syscall

    ;counter++
    addi $t4,$t4,1

    j print_outside_space


    print_asterisk:

    move $t9,$t0
    addi $t9,$t9,-1


    bne $t7,$t9,ignore_condition

    li $t2,10



    ignore_condition:

    beq $t6,$t2,end

    ;print asterisk

    li $a0,42
    li $v0,11
    syscall

    ;counter++

    addi $t6,$t6,1


    print_inside_space:

    move $t9,$t0
    addi $t9,$t9,-1


    bne $t7,$t9,ignore_condition2

    li $t3,0



    ignore_condition2:

    li $t9,0

    ;si curr floor es 0 entonces irse al end
    beq $t7,$t9,end

    ;si curr inside es igual a max inside 
    beq $t5,$t3,print_inside_space_end


    ;otherwise

    li $a0,32
    li $v0,11
    syscall

    ;counter++
    addi $t5,$t5,1
    


    j print_inside_space

    print_inside_space_end:


    j print_asterisk

    

end:

;const 1
li $t9,1



;print new floor

li $a0,10
li $v0,11
syscall

;counter++

addi $t7,$t7,1

;decrease outside spaces -1

addi $t1,$t1,-1

;si curr floor es mayor a 1 sumar de 2
;si piso menor a 2 sumar 1

beq $t7,$t9,increaseby1

;increase inside spaces +2
addi $t3,$t3,2

bne $t7,$t9,ignore



;si curr floor es mayor de 1 


increaseby1:
;increase inside space +1
addi $t3,$t3,1


;ignore increaseby1

ignore:

;currfloor > 1
; 1 < currfloor

slt $t8,$t9,$t7
;1 no hacemos el incremento
;0 hacemos el incremento

bne $t8,$zero,if_end

;increase asterisk max +1

addi $t2,$t2,1

if_end:


bne $t0,$t7,start



draw_triangle_end:
jr $ra
