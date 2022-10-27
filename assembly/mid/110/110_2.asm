INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    TEXT1 BYTE "mississippi", 0
    CH1 BYTE 's'

.code

main PROC
    mov ESI, OFFSET TEXT1
    mov AH, CH1
    mov AL, 0;counter

    L1:
        cmp BYTE ptr [ESI], 0
        je quit
        cmp BYTE ptr [ESI], AH
        jne next
        inc AL

    next:
        inc ESI
        jmp L1

    quit:
        call DUMPREGS

    exit
main ENDP
END main