INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    MATX SDWORD 1, 2, 3, 4, 5, 6, 7, 8 ,9 ,-10, 11, 12, 13, 14, 15, 16, 17, 18
    NOROW BYTE 6
    NOCOL BYTE 3
    ROWNO BYTE ?
    COLNO BYTE ?

.code

main PROC
    movzx ECX, NOROW
    mov ESI, OFFSET MATX
    mov ROWNO, 0
    mov COLNO, 0
    L1:
        push ECX
        movzx ECX, NOCOL
        L2:
            cmp [ESI], 0
            jl quit
            add ESI, 4
            inc COLNO
        loop L2

        pop ECX
        mov COLNO, 0
        inc ROWNO
    loop L1
    
    mov COLNO, 0FFH
    mov ROWNO, 0FFH

    quit:
        movzx EAX, ROWNO
        call WRITEINT
        call crlf
        movzx EAX, COLNO
        call WRITEINT

    exit
main ENDP
END main