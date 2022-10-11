include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
text DWORD "Enter a number between 20 ~ 30:",0

.code


main PROC
    mov EDX, text
    call WRITESTRING

    call READSTRING
    call rclf
    mov EDX, EAX
    call WRITESTRING



    exit
main ENDP
END main