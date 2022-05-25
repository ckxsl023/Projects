.model small
.stack
.code

main	proc 
		mov ax,0B800h	;Memory location 
		mov es,ax		;You have to use ax to assign memory location to es

		mov ah,00111010b
		mov di,160*10+76
		
		mov al,201d			;Top Left
		stosw
		
		mov cx,17			;Top Line
		mov al,205d
loop1:	stosw
		loop loop1
		
		mov al,187d			;Top Right
		stosw
		
		mov ah,00111010b
		mov di,160*14+76
		mov al,200d			;Lower Left
		stosw
		
		mov cx,17			;Lower Line
		mov al,205d
loop2:	stosw
		loop loop2
		
		mov al,188d			;Lower Right
		stosw
		
		mov ah,00111010b
		mov di,160*11+76
		mov al,186d			
		stosw
		mov ah,00111010b
		mov di,160*12+76
		mov al,186d				
		stosw
		mov ah,00111010b
		mov di,160*13+76
		mov al,186d			
		stosw
		
		
		mov ah,00111010b
		mov di,160*11+112
		mov al,186d			
		stosw
		mov ah,00111010b
		mov di,160*12+112
		mov al,186d				
		stosw
		mov ah,00111010b
		mov di,160*13+112
		mov al,186d				
		stosw
		
		mov di,160*12+80		;Point di to a specific location, determine the number of bytes.
		mov ah,10111111b		;Background and foreground of the charcter, each character takes 2 bytes, 1 byte for the color another for the character it self 0 - 011 - 1 - 010 - Blinking - (BG color) - Intensity - (FG color)
		mov al,'C'				;Character
		stosw
		mov al,'R'				;Character
		stosw
		mov al,'I'				;Character
		stosw
		mov al,'S'				;Character
		stosw
		mov al,'T'				;Character
		stosw
		mov al,'A'				;Character
		stosw
		mov al,'N'				;Character
		stosw
		mov al,' '				;Character
		stosw
		mov al,'L'				;Character
		stosw
		mov al,'A'				;Character
		stosw
		mov al,'N'				;Character
		stosw
		mov al,'S'				;Character
		stosw
		mov al,'A'				;Character
		stosw
		mov al,'N'				;Character
		stosw
		mov al,'G'				;Character
		stosw
		
		mov ah,4ch
		int 21h
		
main	endp
end main
