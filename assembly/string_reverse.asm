;Program to reverse a string

include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
somewords BYTE "YOUR hao Homie oh~", 0
textlen DWORD $ - somewords - 1
space DWORD " "

.code
main PROC
    mov EDX, OFFSET somewords
    call WRITESTRING
    call crlf
    mov ECX, textlen

    L1:
        mov ESI, textlen
        sub ESI, ECX

        movzx EAX, somewords[ESI] ;stack could only store 16 byte or 32 byte
        push EAX
    loop L1

    mov ECX, textlen
    mov ESI, 0
    L2:
        pop EAX
        mov somewords[ESI], AL ; why can do this?
        inc ESI
    loop L2

    mov EDX, OFFSET somewords
    call WRITESTRING
    call crlf

    exit
main ENDP
END main