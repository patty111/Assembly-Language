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
    mov ECX, EAX    ;ECX is num len
    mov ESI, 0  ;convert initialize to 0
    L1:
        mov EBX, 10    ;EBX is 10^n

            ; call DUMPREGS
        mov EDI, EAX
        sub EDI, 1
        sub EDI, ECX
        push ECX
        mov ECX, EDI
        push EAX
        mov EAX, 1

        pop ECX
        mov EBX, [EDX+ECX-1]

        call DUMPREGS
		sub EBX, '0'
    	movzx EAX, BL
		call WRITEDEC
		
        imul EBX
        add ESI, EAX

        pop EAX
    loop L1
    ret
convert2int ENDP
main PROC
    mov ECX, 8
    mov EDX, OFFSET num1
    call READSTRING
    call convert2int
    mov EAX, ESI

    


    exit
main ENDP
END main