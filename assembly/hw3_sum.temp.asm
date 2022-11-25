INCLUDE c:\Users\Patrick\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    num1 BYTE 8 DUP(?)
    num2 BYTE 8 DUP(?)
    sum DWORD ?

.code
;(EDI EBX)
; use ESI
convert2int PROC
    mov ECX, EAX    ;ECX is num len
    mov ESI, 0  ;convert initialize to 0
    L1:
        mov EBX, 1    ;EBX is 10^n

            ; call DUMPREGS
        mov EDI, EAX
        sub EDI, 1
        sub EDI, ECX
        push ECX
        mov ECX, EDI
        push EAX
        L2:
            mov EAX, 10
            imul EBX
        loop L2
        
        pop ECX
        mov EAX, EBX
        mov EBX, [EDX+ECX]
        sub EBX, '0'
        imul EBX
        add ESI, EBX


        mov EAX, ESI
        call DUMPREGS

        pop EAX
    loop L1
convert2int ENDP

main PROC
    mov ECX, 8
    mov EDX, OFFSET num1
    call READSTRING
    call crlf
    call convert2int
    mov EAX, ESI

    


    exit
main ENDP
END main