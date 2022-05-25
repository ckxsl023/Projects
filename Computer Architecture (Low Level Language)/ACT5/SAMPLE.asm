.model small
.stack
.data
prompt 	db "Enter a Character: $"
newline db 0ah,0dh,'&'
.code

main	proc
		mov ax,@data
		mov ds,ax
		
		mov ah,9
		mov dx, offset prompt
		int 21h
		
		mov ah,1
		int 21h		;al = key pressed
		
		push dx
		mov ah,9
		mov dx, offset newline
		int 21h
		pop dx
		
		cmp al, 'G'
		je process
		cmp al, 'g'
		je process
		jmp exit
		
process: mov cx,5
		mov ah,2
		mov dl,al
		
again:	int 21h
		loop again
		
exit: 	mov ah, 4ch
		int 21h
		
main	endp
end		main
