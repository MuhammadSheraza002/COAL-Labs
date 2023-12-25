.model small
.stack 100h
.386
.code
main proc
mov ax,@data
mov ds,ax

mov bx, 0
mov cx, 4

again:
mov ah, 01
int 21h
cmp al, 39h
jbe aa
sub al, 37h
jmp exit
aa:
sub al, 30h
exit:
rol bx, 4
or bl, al
dec cx
jnz again

mov ah, 4ch
int 21h


main endp


end main