.model small
.stack
.data
strg	db 'Mapua$'
row		db 12
col		db 25
.code
m		proc
		mov ax,@data
		mov ds,ax

		mov cx,5
		call clear	;Clear Screen
ulit:	call cursorpos
		call disp
		dec row
		call delay
		loop ulit	
		call a

		mov ah,4ch
		int 21h
m		endp

a		proc
		mov ax,@data
		mov ds,ax

		mov cx,3
again:	call cursorpos
		call disp
		inc row
		inc col
		inc col
		call delay
		loop again
		call p

		mov ah,4ch
		int 21h
a		endp

p		proc
		mov ax,@data
		mov ds,ax

		mov cx,3
try:	call cursorpos
		call disp
		dec row
		inc col
		inc col
		call delay
		loop try
		call u

		mov ah,4ch
		int 21h
p		endp

u		proc
		mov ax,@data
		mov ds,ax

		mov cx,6
tryagain:	call cursorpos
		call disp
		inc row
		call delay
		loop tryagain	
		call skip
		dec row
		call a2

		mov ah,4ch
		int 21h
u		endp

a2		proc
		mov ax,@data
		mov ds,ax

		mov cx,6
ulit1:	call cursorpos
		call disp
		dec row
		call delay
		loop ulit1
		inc row		
		call u2

		mov ah,4ch
		int 21h
a2		endp

u2		proc
		mov ax,@data
		mov ds,ax

		mov cx,3
		call skip
		dec col
		inc row
		call disp
ulit4:	call cursorpos
		call disp
		call delay
		inc row
		inc row
		loop ulit4
		

		mov ah,4ch
		int 21h
u2		endp

lineup proc

		mov cx,5
ulit3:	call cursorpos
		call disp
		dec row
		call delay
		loop ulit3
		
lineup endp

skip	proc
		inc col
		inc col
		inc col
		inc col
		inc col
		inc col
skip	endp

delay	proc
		push cx
		mov cx,1	; control the speed here, use 10 for best speed
y:		push cx
;-----------------------
		mov cx,0ffffh
x:		loop x
;----------------------
		pop cx
		loop y
		pop cx
		ret
delay	endp

disp	proc
		push ax
		push dx
		mov ah,9
		mov bh,01110110b
		mov dx,offset strg
		int 21h
		pop dx
		pop ax
		ret
disp	endp

cursorpos  proc
		push ax
		push bx
		push dx
		mov ah,2
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		pop dx
		pop bx
		pop ax
		ret
cursorpos  endp	

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
end	m