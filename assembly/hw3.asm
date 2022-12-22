INCLUDE D:/irvine/Irvine32.inc
;INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    num1 BYTE 8 DUP(?)
    num2 BYTE 8 DUP(?)
    sum DWORD ?



.code
convert2int PROC
    mov ECX, EAX 
    mov ESI, 0  ;convert initialize to 0
    L1:
    ;    mov EBX, 10    ;EBX is 10^n
	    mov EBX, 0

        mov BL, AL
		sub BL, CL



        push EAX		;EAX store as string len
        push ECX
        movzx ECX, BL
        
        mov EAX, 1		;EAX use to store and calculate 10^n
        cmp ECX, 0
        jbe next
        
        mov EBX, 10
        L2:
       		mul EBX
       	loop L2
       
       ; above is  all ok
        
        next:        
       	
       	
        pop ECX
       	mov BL, [EDX+ECX-1]		;BL stores digit as int
        sub BL, '0'
        call DUMPREGS
        
        push EDX
        mul BX
        
        pop EDX
        call WRITEINT
        call crlf
        call DUMPREGS

        add ESI, EAX
        ;mov EAX, ESI
        
        ;call DUMPREGS
		pop EAX
    loop L1
    
    mov EAX, ESI
    call WRITEDEC
    ret
convert2int ENDP


main PROC
    mov ECX, 8
    mov EDX, OFFSET num1
    call READSTRING
    call convert2int
;	call DUMPREGS
    


    exit
main ENDP
END main