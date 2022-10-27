INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
.code

main PROC
    mov AL, 'k'

    cmp AL, '0'
    jb other
    cmp AL, '9'
    ja ten
    sub AL, '0'
    jmp quit

    ten:
        cmp AL, 'A'
        jb other
        cmp AL, 'F'
        ja lower
        sub AL, 'A'-10
        jmp quit
    
    lower:
        cmp AL, 'a'
        jb other
        cmp AL, 'f'
        ja other
        sub AL, 'a'-10
        jmp quit

    other:
        mov AL, 0FFH

    quit:
        call DUMPREGS

    exit
main ENDP
END main