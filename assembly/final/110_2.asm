INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data 
    TEXT1 BYTE 1000 DUP (?) 
    STR1 BYTE 100 DUP (?) 
    LEN1 WORD ? 
    LEN2 BYTE ? 

.code

main PROC
    mov ESI, OFFSET TEXT1

L1:
    push ESI
    mov EDI, OFFSET STR1
    MOVZX ECX, LEN2
    REPE CMPSB  ;比較字串
    je L2 ; 找到了 

    pop ESI ;找不到
    inc ESI ;指到下一個字
    
    ;check if its the last word
    mov EAX, ESI
    SUB EAX, OFFSET TEXT1
    movzx EBX, LEN1
    sub EBX, EAX
    cmp  BL, LEN2
    JAE L1
    stc 
    jmp L3

    L2:
        pop ESI
        clc ;清除進位旗標

    L3:
        ;

    exit
main ENDP
END main