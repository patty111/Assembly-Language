INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    TEXT1 BYTE 23 DUP (?)
    SIZE1 BYTE 20
    POS1 BYTE 4

.code

main PROC
    mov EDX, OFFSET TEXT1
    mov ECX, 25
    call READSTRING

    mov ESI, OFFSET TEXT1
    mov AH, 0;counter
    L1:
        cmp [ESI], 0
        je quit
        cmp AH, POS1
        jae shift
        jmp next

    shift:
        mov AL, [ESI+1]
        mov [ESI], AL
    
    next:
        inc ESI
        inc AH
        jmp L1

    quit:
        dec SIZE1
        mov EDX, OFFSET TEXT1
        call WRITESTRING
        call crlf
        mov AL, SIZE1
        call DUMPREGS

    exit
main ENDP
END main