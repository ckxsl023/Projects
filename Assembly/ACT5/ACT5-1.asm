.model small ;Add clear screen
.stack
.data
row	db	12
col	db	40
.code

main	proc
		mov ax,@data
		mov ds,ax
		
		
ulit:	call clear
		mov ah,2
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		mov ah,2
		mov dl,219
		int 21h	

		mov ah,0
		int 16h		; al=char input
		
		cmp ah,4Dh;48h	;right arrow key
		je right
		cmp ah,4Bh	;left arrow key
		je left
		cmp ah,48h	;up arrow key
		je up
		cmp ah,50h	;down arrow key
		je down
		cmp al,'w'	;top-right arrow key. W-Key
		je tright
		cmp al,'a'	;lower-left arrow key. A-Key
		je lleft
		cmp al,'q'	;top-left arrow key. Q-Key
		je tleft
		cmp al,'s'	;lower-right arrow key. S-Key
		je lright
		cmp al,1 	;esc scan code
		je exit
		jmp ulit

tright:	inc col
		dec row
		jmp ulit
		
tleft:	dec row
		dec col
		jmp ulit
lright:	inc col
		inc row
		jmp ulit
lleft:	inc row
		dec col
		jmp ulit

right:	inc col
		jmp ulit
		
left:	dec col
		jmp ulit
up:		dec row
		jmp ulit
down:	inc row
		jmp ulit

exit: 	mov ah,4ch
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
