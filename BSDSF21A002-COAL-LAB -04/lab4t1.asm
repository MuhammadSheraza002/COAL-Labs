.model small 
.stack 100h
.code
main proc 

mov ax,@data
mov ds,ax

mov dx,offset message1
mov ah,09h
int 21h

mov ah,01
int 21h
mov bl,al


mov cl,0
mov ch,08
mov dx,offset message2
mov ah,09h
int 21h
again:shl bl,01
jc one_
mov dl,30h
mov ah,02h
int 21h
dec ch
jnz again


one_:
mov dl,31h
mov ah,02h
int 21h
inc cl
dec ch
jnz again




mov dx,offset message3
mov ah,09h
int 21h
mov dl,cl
add dl,30h
mov ah,02
int 21h


mov ah,4ch
int 21h


main endp

.data
message1 db 13, 10,"Enter No: $"
message2 db 10, 13, "Binary of No is: $"
message3 db 10, 13, "No of 1s are:  $"
end main