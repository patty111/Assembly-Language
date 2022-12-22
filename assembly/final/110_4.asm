INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
MIDTERM BYTE ? 
FINAL BYTE ? 
HW1 BYTE ? 
HW2 BYTE ? 
HW3 BYTE ? 
HW4 BYTE ? 
GRADE BYTE ? 

.code
main PROC
    mov AL, MIDTERM
    add AL, FINAL
    mov BL, 40

    mul BL
    mov BH, AL
    
    mov AL, 0
    add AL, HW1
    add AL, HW2
    add AL, HW3
    add AL, HW4
    mov BL, 5
    mul BL
    add BH, AL

    movzx AX, BH
    div 100

    cmp AH, 50
    jbe no
    inc AX

no:
    call WRITEDEC




    exit
main ENDP
END main