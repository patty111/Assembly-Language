INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

    TEXT1 BYTE 'Assembly Language Programming', 0
    VAR1 DWORD 010203H, 040506H, 070809H
.code

main PROC
    mov ESI, 0FFFFFFFFH
    mov EBX, 0FFFFFFFFH
    mov ECX, 0FFFFFFFFH
    mov EAX, 0FFFFFFFFH
    
    XOR ESI, ESI
    mov AL, TEXT1 + 10[ESI]
    movzx ECX, BYTE PTR VAR1
    movzx EBX, WORD PTR VAR1+4

    mov EDI, OFFSET VAR1

    OR BYTE PTR [EDI+8], 30H
    inc TEXT1[ESI]
    inc ESI
    mov EAX, [EDI]
    call WRITEHEX
    call crlf
    add EDI, 1
    mov EAX, [EDI]
    call WRITEHEX



    call DUMPREGS


    exit
main ENDP
END main