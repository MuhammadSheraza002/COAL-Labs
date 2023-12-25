.model small 
.stack 100h
.code
main proc 

mov ax,@data
mov ds,ax
mov ah,4ch
int 21h


main endp

.data
message1 db "Enter No: $"
message2 db "Binary of No is: $"
message3 db "No of 1s are:  $"
end main