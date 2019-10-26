     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R0, #0x00000000 ;First number
		MOV R1, #0x00000001 ;Second number
		MOV R3, #0x20000000 ;Pointer to the location having the input i.e number of elements of the series to be printed
		LDR R4, [R3,#0x00000000] ;Loading the input count into R4
		MOV R5, #0x00000002;     ;First 2 elements are directly stored with no computation, so R5 initilaised with 2 indicating first 2 elements are done
		STR R0,[R3, #0x00000001] ;Storing the first element of the series to memory
		STR R1,[R3,#0x00000002]  ;Storing the second element of the series to memory 
		MOV R8,#0x00000001       ;R8 initialised with 1 to use the MLA instruction as just an addition instruction later in the program
		MOV R6,R3                ;R3 copied into R6
		ADD R3,R3,#0x00000003    ;R3 pointing to the location to write the third element of the series
		ADD R6,R6,#0x00000001    ;R6 pointing to the first element of the series to fetch it for computing the 3rd element
loop    LDRB R0, [R6, #0x00000000] 
        LDRB R1, [R6, #0x00000001] ; R0 and R1 are loaded with the values to be added to obtain the next series element
		MLA R7,R8,R0,R1            ;Addition performed since R8=1, this instruction does R7 = R0 + R1
		ADD R5,R5,#0x00000001      ;Number of series elements printed incremented
		STR R7, [R3,#0x00000000]   ;Result stored in the intented memory location
		ADD R3,R3,#0x00000001      ;R3 incremented to point to the next write location
		ADD R6,R6,#0x00000001      ;R6 incremented to point to the next fetch location
		CMP R5,R4                  ;Check if all the required elements are printed
		BNE loop
stop    B stop
 
 
 
  
     ENDFUNC
     END 
	 
	 ;This program requires minimum input count to be equal to 3.