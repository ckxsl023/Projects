PUBLIC RENDER 
; Accepts a rectangular image and render it on the screen 
			ASSUME CS:CODE
X 			EQU				[BP+14]
Y 			EQU				[BP+12]
W 			EQU				[BP+10]
H 			EQU				[BP+8]
BUF 		EQU				[BP+6]
CODE  		SEGMENT		
RENDER		PROC	FAR
			PUSH BP
			MOV BP,SP
			PUSH DS
			PUSH ES
			PUSH SI
			PUSH DI
			
			MOV AX,Y          ; SAME AS MOV AX,SS:[BP+14]			
			MOV BX,160
			MUL BX	
			MOV BX,X
			SHL BX,1			
			ADD AX,BX		; AX --> UPPER LEFT CORNER IMAGE ON VIDEO
			
			MOV DI,AX
			MOV AX,0B800H
			MOV ES,AX
			
			MOV SI,BUF
			
			MOV CX,H
L1:			PUSH DI
			PUSH CX
			
			MOV CX,W
			MOV AH,01110000B
L2:			LODSB
			STOSW
			LOOP L2
			POP CX
			POP DI
			ADD DI,160
			LOOP L1							
			
			POP DI
			POP SI
			POP ES
			POP DS
			POP BP
			RETF
RENDER		ENDP
CODE  		ENDS
			END