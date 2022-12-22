INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    sgndec SDWORD ?
    DECOUT BYTE 20 DUP (?)

.code

main PROC
    call READINT
    mov sgndec, EAX
    mov ESI, OFFSET DECOUT


    mov EAX, SGNDEC
    test EAX, 2147483648
    jz L1
    mov BYTE ptr [ESI], '-'
    inc ESI
    neg EAX

L1:
    mov ECX, 0
L2:
    mov EBX, 10
    mov EDX,  0
    DIV EBX
    PUSH EDX
    inc ECX
    cmp EAX, 0
    jnz L2
L3:
    pop EAX 
    Add AL, 30H
    mov [ESI], AL
    inc ESI
    loop L3
    mov BYTE ptr [ESI], 0
    mov EDX, OFFSET DECOUT
    exit
main ENDP
END main