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
cmp al, 39H
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


mov ah, 02
mov dl, 10
int 21h
mov dl, 13
int 21h
mov cx, 4
again1:
rol bx, 4
mov dl, bl
and dl, 0fh
cmp dl, 9h
jbe alpha
add dl, 37h
mov ah, 02
int 21h
jmp e

alpha:
add dl, 30h
mov ah, 02
int 21h
e:dec cx
jnz again1

mov ah,4ch
int 21h

main endp
.data
end main
.data