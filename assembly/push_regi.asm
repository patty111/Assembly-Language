include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data


.code
main PROC
    call DUMPREGS
    mov EAX, 1
    mov EBX, 2
    mov ECX, 3
    mov EDX, 4
    mov ESI, 5
    mov EDI, 6

    call DUMPREGS
    PUSHAD
    PUSHAD
    PUSHAD
    PUSHAD
    PUSHAD
    PUSHAD

    mov ECX, 6
    L1:
        POPAD
        dec ECX

    loop L1
    call DUMPREGS

    exit
main ENDP
END main