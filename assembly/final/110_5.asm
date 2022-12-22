INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
ARY1 SDWORD 1, -2, 3, 4, -5, 6, 7, 8, -9, 10 
NUM DWORD 5 
SUM SDWORD ?
.code

main PROC
    PUSH OFFSET ARY1 ;ebp+16
    PUSH OFFSET NUM     ;ebp+12
    PUSH OFFSET SUM ;ebp +8
    CALL ARYSUM 
    exit
main ENDP

ARYSUM PROC
    push EBP
    mov EBP, ESP
    mov ESI, [EBP+16]
    mov EBX, [EBP+12]
    mov ECX, [EBX]
    mov EDI, [EXP+8]
    mov EAX, 0
    A1:
        add EAX, [ESI]
        add ESI, 4
        loop A1
        mov [EDI], EAX
        pop EBX
        ret 12
ARYSUM ENDP

END main