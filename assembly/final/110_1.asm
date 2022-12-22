INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data


.code

main PROC
    mov EDX, 5
    mov EAX, 0
    TEST EDX, 2147483648 ; test whether negative
    jz L1: ; 是0就不用處理
    OR EAX, 2147483648

    NEG EDX

L1: 
    mov ECX ,32
L3:
    DEC ECX
    SHL EDX, 1
    JNC, L3
    ADD ECX, 127
    SHL ECX, 23
    OR EAX, ECX
    SHR EDX, 9
    OR EAX, EDX
    call WRITEHEX
    exit
main ENDP
END main