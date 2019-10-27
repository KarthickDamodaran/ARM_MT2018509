     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY
;Program operates on 8 bit numbers. Same can be extended to 32 bits	 
__main  FUNCTION	
		MOV R0, #0x20000000 ;Pointer to the memory location containing inputs
        LDRB R1,[R0,#0x00000000];Load 1st number into R1
        LDRB R2,[R0,#0x00000001];Load 2nd number into R2
repeat  CMP R1,R2;Compare R1 and R2
        BEQ commit;If R1=R2, branch to commit
        BGT check1;Else If R1>R2, branch to check1
        RSB R2,R1,R2;Else, R2=R2-R1
        B repeat;Repeat until R1=R2
commit  STR R1,[R0,#0x00000000];Loading final result back into memory
        STR R2,[R0,#0x00000001];Loading final result back into memory
stop	B stop
check1  RSB R1,R2,R1;R1=R1-R2
        B repeat
     ENDFUNC
     END 
