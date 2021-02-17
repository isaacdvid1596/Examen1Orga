;PARAMS
;n1->$a0
;n2->$a1

;numbers->$a0
;size->$a1

;VARIABLES LOCALES
;temp->$t0
;i->$t1
;j->$t2


.global insertionSort



swap:

;pasar direccion en memoria n1 a temp

;int temp=*n1
sw $a0,0($t0)

;*n1 = *n2
sw $a1,0($a0)

;*n2 = temp
sw $t0,0($a1)

swap_end:

jr $ra


insertionSort:

    addi $sp,$sp,-4
    sw $ra,0($sp)
    ;guardar $a0 en $sp 4
    ;guardar $a1 en $sp 8

    ;i=1
    li $t1,1


    for:

    ;i<size

    slt $t3,$t1,$a1

    ;if 1 continue for
    ;if 0 skip to insertionSort_end

    beq $t3,$zero,insertionSort_end

    ;j=i
    move $t2,$t1

        while:

        ;0<j
        ;numbers[j]<numbers[j-1]

        slt $t3,$zero,$t2
        ;if 1 sigue codigo
        ;if 0 se va al for_end

        beq $t3,$zero,for_end

        ;conseguir valor de numbers[j]
        sll $t4,$t2,2
        ;direccion de numbers[j]
        add $t4,$a0,$t4
        ;valor de numbers[j] cargarlo en $t5
        lw $t5,0($t4)

        ;conseguir valor de numbers[j-1]
        addi $t2,$t2,-1

        sll $t6,$t2,2
         ;direccion arr[j-1]
        add $t6,$a0,$t6
        ;valor de arr[j-1] cargarlo en $t7
        lw $t7,0($t6)

        ;validar si $t5 < $t7

        slt $t8,$t5,$t7

        ;if 1 continuar while
        ;if 0 for_end

        beq $t8,$zero,for_end

        ;body while

        move $a0,$t6
        move $a1,$t4

        ;pasar como referencia en stack pointer
        addi $a0,$sp,4
        addi $a1,$sp,8

        jal swap


        ;j--

        addi $t2,$t2,-1



    for_end:

    ;i++

    addi $t1,$t1,1

    j for


insertionSort_end:
    jr $ra
