;movzx, movsx : 小的變數傳到大的裡面（WORD -> EAX）
;xchg 交換
;array + 

include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    arr BYTE 1, 2, 3, 4
.code

; 預設一個位置為8byte
main PROC
    movzx EAX, arr
    call WriteInt
    call crlf
    movzx EAX, arr+4
    call WriteInt
    call crlf
    

    exit
main ENDP
END main