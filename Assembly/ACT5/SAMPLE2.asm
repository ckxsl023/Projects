.model small
.stack
.data
prompt 	db "Enter a Character: $"
.code

main	proc
		mov ax,@data
		mov ds,ax
		
		mov ah,9
		mov dx, offset prompt
		int 21h
		
ulit:	mov ah,8
		int 21h		;al = key pressed
		
		cmp al, 'a'
		jae x
		jmp notLet
x:		cmp al, 'z'
		jbe y
notLet:	cmp al,'1'
		je exit
		
		jmp ulit		

y:		mov ah,2
		mov dl,'*'
		int 21h
		jmp ulit	

exit: 	mov ah,4ch
		int 21h
main	endp
end		main
