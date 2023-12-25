.model small 
.stack 100h
.code
main proc 

mov ax,@data
mov ds,ax

mov dx,offset Enter_Message
mov ah,09
int 21h

mov dx,offset Message
mov ah,09
int 21h

mov si,offset Message
mov ch,8
mov cl,0

again: mov ah,[si]
cmp al,97
jge Capital
inc si
jnz again

Capital:
cmp cl,0
je PrintCapital1
jg PrintCapital2


PrintCapital2:
mov di,si
inc cl
jmp Control_loop

PrintCapital1:
mov dx,offset Capital1
mov ah,09
int 21h
mov dl,[si]
mov ah,02
int 21h
inc cl
jmp Control_loop
Control_loop:
inc si
dec ch
jnz again



mov ah,4ch
int 21h


main endp
.data
Enter_Message db 10,13,"Enter line: $"
Message db 10,13,"MuhaMmaD$"
Capital1 db 10,13,"First Capital: $"
Capital2 db "Second Capital: $"
NoCapital db "No Capital"


end main