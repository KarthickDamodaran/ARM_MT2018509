     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R3, #0x20000000  ; R3 is a pointer to the input number
		MOV R2, #0x00000000  ; R2 is stored with all 0s for comparison with the input number having all bits except LSB masked
		MOV R6, #0xAAAAAAAA  ; Location 0x20000004 finally has R6 content if number is odd
		MOV R5, #0xFFFFFFFF  ; Location 0x20000004 finally has R5 content if number is even
		LDR R0, [R3,#0x0]    ; R0 is loaded with the input number from memory
		AND R4, R0, #0x00000001 ; R0 has all its bits masked except for LSB and is stored in R4
                CMP R2, R4              ; Checking if R4's LSB is a 0(even) or a 1(odd)
		BEQ even                ; Branch taken if number is even
        STR R6, [R3,#0x00000004] ;If branch not taken(number odd) store R6 content in 0x20000004		
stop    B stop ; stop program    ;Halt 
even    STR R5, [R3,#0X00000004]  ; Branch taken if number is even and R5 content stored in 0x20000004
        B stop                    ;Halt     
     ENDFUNC
     END 
