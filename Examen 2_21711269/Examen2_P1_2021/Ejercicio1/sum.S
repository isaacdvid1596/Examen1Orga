#set byte [0x10000000] = ["The sum of squares is: ", 0]

call main
; Exit program
mov eax, 10
int 0x80

sum:
push esi
push edi

;arr->esp+12
;size->esp+16


;sum = 0
mov ebx,0

;i=0
mov ecx,0

for:

cmp ecx,dword[esp+16]
jge sumend

;for body

;sum+=arr[i]*arr[i]

;get arr[]
mov esi,dword[esp+12]
;get arr[i]
mov edi,dword[esi+ecx*4]
mov eax,edi
; #show edi
; #show eax
mul edi
; #show eax
add ebx,eax

;i++
inc ecx
jmp for


sumend:
pop esi
pop edi
ret


main:

sub esp, 52

mov dword[esp+0],10
mov dword[esp+4],43
mov dword[esp+8],41
mov dword[esp+12],5
mov dword[esp+16],45
mov dword[esp+20],50
mov dword[esp+24],22
mov dword[esp+28],86
mov dword[esp+32],10
mov dword[esp+36],20
mov dword[esp+40],55
mov dword[esp+44],52
mov dword[esp+48],65

mov ebx,esp

;size = 13

push 13
push ebx
call sum
add esp,8

mov edx,ebx

mov eax,4
mov ebx,0x10000000
int 0x80

mov eax,1
mov ebx,edx
int 0x80

mov eax,11
mov ebx,10
int 0x80

add esp,52

ret
