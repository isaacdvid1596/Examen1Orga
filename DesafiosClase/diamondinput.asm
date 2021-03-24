;INIT

;get user input
;eax(max floors)
mov eax,5
int 0x80

;almacenar valor de eax en memoria
mov dword [0x10000100],eax


;curr floor(0)
mov ebx,0

;almacenar valor de ebx en memoria
mov dword [0x10000001],ebx

;max number of spaces per floor is -1 of user input floors
;move contents of eax to ecx
mov ecx,eax
;ecx(number of spaces per floor)
sub ecx,1

;max asterisk per floor (1)
mov edx,1


outerloop:

    ;validar si ebx es igual a eax

    ;cargar [0x10000100] a eax y [0x10000001] a ebx

    mov eax, dword [0x10000100]
 
    mov ebx, dword [0x10000001]


    cmp eax,ebx

 

    je exit
    
    ;curr asterisk counter
    mov esi,0

    ;curr space per floor counter
    mov edi,0

    innerloop:

    ;validar si edi es igual a ecx

    cmp edi,ecx

    je innerloopend

    ;print space per floor

    mov eax,11
    mov ebx,32
    int 0x80

    ;increase curr space counter by 1
    
    inc edi

    jmp innerloop


    innerloopend:

    ;validar si esi es igual a edx

    cmp esi,edx

    je  outerloopend

    ;print asterisk

    mov eax,11
    mov ebx,42
    int 0x80

    ;increase curr asterisk counter by 1
    inc esi

    jmp innerloopend



outerloopend:

;print floor

mov eax,11
mov ebx,10
int 0x80


;load [0x10000001] into ebx
mov ebx, dword [0x10000001]

;increase curr floor by 1
inc ebx

;save ebx to [0x10000001]
mov dword [0x10000001], ebx

;increase asterisk max by 2
add edx,2

;decrease space max by 1 
dec ecx

jmp outerloop



exit:



;SECOND HALF

;same eax limit from above

;reset ebx(currfloor) to 0
mov ebx,1

;cargar ebx a dword [0x10000001]

mov dword [0x10000001],ebx

;ecx(space max per floor) in -1 reset to 1

mov ecx,1

;edx -4 so it inits on 9

sub edx,4




outerloop2:

    ;validar si ebx es igual a eax

    ;cargar [0x10000100] a eax y [0x10000001] a ebx
    
    mov eax, dword [0x10000100]
 
    mov ebx, dword [0x10000001]


    cmp eax,ebx

   
    je exit2
    
    ;curr asterisk counter
    mov esi,0

    ;curr space per floor counter
    mov edi,0

    innerloop2:

    ;validar si edi es igual a ecx

    cmp edi,ecx

    je innerloopend2

    ;print space per floor

    mov eax,11
    mov ebx,32
    int 0x80

    ;increase curr space counter by 1
    
    inc edi

    jmp innerloop2


    innerloopend2:

    ;validar si esi es igual a edx

    cmp esi,edx

    je  outerloopend2

    ;print asterisk

    mov eax,11
    mov ebx,42
    int 0x80

    ;increase curr asterisk counter by 1
    inc esi

    jmp innerloopend2



outerloopend2:

;print floor

mov eax,11
mov ebx,10
int 0x80


;load [0x10000001] into ebx
mov ebx, dword [0x10000001]

;increase curr floor by 1
inc ebx

;save ebx to [0x10000001]
mov dword [0x10000001], ebx

;increase asterisk max by 2
sub edx,2

;increase space max by 1 
inc ecx

jmp outerloop2

exit2: