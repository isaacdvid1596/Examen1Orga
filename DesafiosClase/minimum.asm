;PARAMS
;array->[esp+4]
;size->[esp+8]
;minPos->[esp+12]
;minVal->[esp+16]


#set byte [0x10000000] = ["Minimum element: ",0]

#set byte [0x10000014] = [" at pos ",0]



call main
mov eax,10
int 0x80



minimum:

;mover array[] address to eax
mov eax, dword[esp+4]

mov eax,dword[eax]

;mover direccion de minVal a ebx
mov ebx, dword[esp+16]

;move arr[0] where minVal is pointing to [ebx] 
mov dword[ebx],eax

;get minPos address
mov eax,dword[esp+12]
;move 0 to where minPos is pointing
mov dword[eax],0


    ;c=1
    mov ecx,1

    for:

    cmp ecx,dword[esp+8]
    jge minimumend

    ;otherwise

    ;get array[]
    mov eax,dword[esp+4]
    ;array[c]
    mov eax,dword[eax+ecx*4]
    
    ;get minVal
    mov ebx,dword[esp+16]

    cmp eax,dword[ebx]

    jge forend

    ;otherwise

    ;*minVal = array[c]
    mov dword[ebx],eax

    ;*minPos = c
    mov eax,dword[esp+12]
    mov dword[eax],ecx

    forend:

    inc ecx
    jmp for

minimumend:
ret


main:

sub esp,48

mov dword [esp+0],91
mov dword [esp+4],96
mov dword [esp+8],48
mov dword [esp+12],1
mov dword [esp+16],8
mov dword [esp+20],52
mov dword [esp+24],9
mov dword [esp+28],24
mov dword [esp+32],45
mov dword [esp+36],9

;guardar en ebx direccion del esp
mov ebx,esp
;calculad direccion y guardarla en eax
;mov eax,dword[ebx+40]
;#show eax hex
;put [ebx+44] into eax, eax will be equal to ff4
lea eax,[ebx+40]
#show eax hex
push eax ; &min
;mov eax,dword[ebx+44]
;#show eax hex
;put [ebx+44] into eax, eax will be equal to ff8
lea eax,[ebx+44]
#show eax hex
push eax ; &pos
push 10 ;size
lea eax,[ebx]
push eax
call minimum
add esp,16


mov eax,4
mov ebx,0x10000000
int 0x80

mov eax,1
mov ebx,dword[esp+40]
int 0x80

mov eax,4
mov ebx,0x10000014
int 0x80

mov eax,1
mov ebx,dword[esp+44]
int 0x80

mov eax,11
mov ebx,10
int 0x80

add esp,48

ret

