INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    MATX1 SDWORD 1,2,3,4,5,6,7,8,9,10,11,12
    MATX2 SDWORD 1,0,1,0,1,0,1,0,1,0,1,0 
    MATX3 SDWORD 100 dup (?)
    ROW BYTE 3
    COL BYTE 4

.code

main PROC
 mov ESI, 0  ;index
    movzx ECX, ROW

    L1:
        push ECX
        movzx ECX, COL
        L2:
            mov MATX3[ESI], 0
            mov EBX, MATX1[ESI]
            sub EBX, MATX2[ESI]
            add MATX3[ESI], EBX
            add ESI, 4

        loop L2
        pop ECX
    loop L1

    mov ECX, 12
    mov ESI, 0
    L3:
        mov EAX, MATX3[ESI]
        add ESI, 4
        call WRITEINT
        call crlf
    loop L3

    exit
main ENDP
END main