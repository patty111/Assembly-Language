INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

    timestr BYTE 10 DUP (?)
.code

main PROC
    mov DX, 2AE7H
    mov ESI, OFFSET timestr
    push EDX

    ;用二進位看，右移11位元就是小時
    SHR DX, 11
    mov AX, DX
    mov BL, 10
    div BL
    ADD AL, 30H
    mov [ESI], AL
    ADD AH, 30H
    inc ESI

    mov [ESI], AH
    inc ESI
    mov BYTE ptr [ESI], ':'
    pop EAX
    push EAX
    shr AX, 5
    and AX, 3FH ; 保留位元 and 00111111

    mov BL, 10
    div BL
    ADD AL, 30H
    inc ESI
    mov [ESI], AL
    ADD AH, 30H
    inc ESI
    mov [ESI], AH

;lowest digits
    inc ESI
    mov BYTE ptr [ESI], ':'
    pop EAX
    and AX, 1FH ; 
    shl AX, 1;乘以2

    mov BL, 10
    div BL
    ADD AL, 30H
    inc ESI
    mov [ESI], AL
    ADD AH, 30H
    inc ESI
    mov [ESI], AH
    inc ESI
    mov BYTE ptr [ESI], 0




    exit
main ENDP
END main