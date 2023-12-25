.model small
.stack 100h
.386
.code
main proc
mov ax,@data
mov ds,ax
mov bx,124Ah
mov cx, 16

again1:
rol bx, 1
mov dl, bl
and dl, 01

add dl, 30h

mov ah, 02
int 21h
dec cx
jnz again1



mov ah,4ch
int 21h

main endp

end main