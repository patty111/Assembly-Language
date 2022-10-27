INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    str1 BYTE "abn10928234cc23QQ4APLGH", 0

.code
main PROC
    mov ESI, OFFSET str1
    mov AL, 0;upper 7
    mov AH, 0;lower 5
    mov BL, 0;num 11

    L1:
        mov BH, [ESI]
        cmp BH, 0
        jz quit
        
        cmp BH, '0'
        jb next
        cmp BH, 'A'
        jb num
        cmp BH, 'a'
        jb upper
        cmp BH, 'z'
        ja next

        inc AH
        jmp next

    num:
        inc BL
        jmp next

    upper:
        inc AL
        jmp next

    next:
        inc ESI
        jmp L1


    quit:
        movzx EAX, AL
        call WRITEDEC
        call crlf
        movzx EAX, AH
        call WRITEDEC
        call crlf
        movzx EAX, BL
        call WRITEDEC
        call crlf

    exit
main ENDP
END main