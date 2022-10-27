INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
b BYTE 1, 2, 3, 4, 10, 20, 30, 40, 50, 60, 70, 80
num BYTE 10

.code
main PROC
    movzx ECX, num
    mov ESI, OFFSET b
    L1:
        inc BYTE ptr [ESI]
        inc ESI
    loop L1

    mov EBX, OFFSET b
    movzx ECX, num
    L2:
        movzx EAX, BYTE ptr [EBX]
        inc EBX
        call WRITEDEC
        call crlf 
    loop L2


    exit
main ENDP
END main