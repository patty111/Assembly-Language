INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

    NUM1 DWORD 2 DUP (?)
    NUM2 DWORD 2 DUP (?)
    NUM3 DWORD 3 DUP (?)
    var2 WORD 9,10,11,12
.code

main PROC
    movzx EAX, var2+1
    call WRITEDEC
    



    exit
main ENDP
END main