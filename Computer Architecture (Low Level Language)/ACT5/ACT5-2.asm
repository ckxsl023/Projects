.model small
.stack
.data
prompt db "Enter a number: $"
prompt2 db "Enter a character: $"
prompt3 db "Try Again(y/n)? $"
linebreak db 0ah, 0dh, '$'
.code

main 	proc

		mov ax,@data
		mov ds,ax
		
Again:  call clear
		push dx
		mov ah,9
		mov dx,offset linebreak
		int 21h
		pop dx
		
		push dx
		mov ah,9
		mov dx,offset prompt
		int 21h
		
		mov ah,1
		int 21h	
		mov ah,00
		sub bx,30h
		
		cmp al,'1'
		jge greateq
		
		jmp Again
		
greateq:cmp al,'9'
		jle lowereq
		
		push dx
		mov ah,9
		mov dx,offset linebreak
		int 21h
		pop dx
		
		jmp Again
		
lowereq:push ax
		pop dx
		push dx	
		mov ah,9
		mov dx,offset linebreak
		int 21h
		pop dx
		
		push dx
		mov ah,9
		mov dx,offset prompt2
		int 21h
		push ax
		mov ah,1
		int 21h
		mov ah,00
		pop dx
		
		push dx
		mov ah,9
		mov dx,offset linebreak
		int 21h
		pop dx
		
		mov ah,2
		mov dl,al
		pop cx
		sub cx,30h		
loop1:  int 21h
		loop loop1
		
		push dx
		mov ah,9
		mov dx,offset linebreak
		int 21h
		pop dx
		
tryagain: push dx
		mov ah,9
		mov dx,offset prompt3
		int 21h
		
		mov ah,1
		int 21h
		pop dx
		
		cmp al,'y'
		je Again
		cmp al,'Y'
		je Again
		cmp al,'n'
		je exit
		cmp al,'N'
		je exit
		jmp tryagain
		
exit:   mov ah, 4ch
		int 21h
main	endp
clear	proc
		push ax
		push bx
		push cx
		push dx
		mov ah,6
		mov al,0
		mov bh,7
		mov ch,0
		mov cl,0
		mov dh,24
		mov dl,79
		int 10h
		pop dx
		pop cx
		pop bx
		pop ax
		ret
clear	endp
end		main