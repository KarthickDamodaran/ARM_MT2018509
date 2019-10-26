     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R0,#0x20000000          ;pointer to the memory location containing input numbers
		LDRB R1,[R0,#0x00000000]    ;1st number
		LDRB R2,[R0,#0x00000001]    ;2nd number
		LDRB R3,[R0,#0x00000002]    ;3rd number
		CMP R1,R2                   ;Checking if R1>R2 or R1<R2 
		BGT check1                  ;if R1>R2,jump to check1 to compare R1 and R3
		CMP R2,R3                   ;else compare R2 and R3
		BGT check2                  ;if R2>R3,jump to check2 to store R2 in output location  
		STR R3,[R0,#0x00000003]     ;else store R3 in output location
stop	B stop
check2  STR R2,[R0,#0x00000003]
        B stop
check1  CMP R1,R3                   ;if R1>R2, it jumps here to check if R1>R3
        BGT check4                  ;if R1>R3,jump to check4
		STR R3,[R0,#0x00000003]     ;else store R3 in output location
		B stop
check4  STR R1,[R0,#0x00000003]     ;if R1>R3, control jumps here to store R1 in output location
        B stop
		
 
 
  
     ENDFUNC
     END 
	 ;This program operates on inputs of 8 bits each. The same can be extended to operate on 32 bit numbers also
