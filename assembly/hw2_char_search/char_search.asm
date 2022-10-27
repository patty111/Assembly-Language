INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    inputprompt BYTE "Enter a string longer than 15 chars: ", 0
    findprompt BYTE "Enter the character to find: ", 0
    wawa BYTE "Character not in str1...", 0
    str1 BYTE 100 DUP (?)

.code
main PROC
    ;Input string
    mov EDX, OFFSET inputprompt
    call WRITESTRING
    mov ECX, 100
    mov EDX, OFFSET str1
    call READSTRING
    push EDX
    ;Input find char
    mov EDX, OFFSET findprompt
    call WRITESTRING
    mov EBX, EAX    ;str1 length
    call READCHAR
    call WRITECHAR
    call crlf
    mov BL, AL


    mov AH, -1; flag
    mov ESI, 0  ;count
    mov ECX, 0
    pop EDX ;EDX = str1

    L1:
        cmp ESI, EBX
        je quit

        cmp [EDX], BL
        jne next
        
        mov EAX, ESI
        call WRITEDEC
        mov EAX, ' '
        call WRITECHAR
        mov AX, 1

    next:
        inc EDX
        inc ESI
        jmp L1

    quit:
        cmp AH, -1
        jne nothing
        mov EDX, OFFSET wawa
        call WRITESTRING

    nothing:
        
    exit
main ENDP
END main