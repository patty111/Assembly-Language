include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
text DWORD 10 DUP ("aws")

.code
main PROC
    mov EDX, text
    call WRITESTRING

    call READSTRING
    call crlf
    mov EDX, EAX
    call WRITESTRING



    exit
main ENDP
END main