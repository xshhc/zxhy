section .data
    strHello db "Hello, world", 0xA  ; 添加换行符
    strHello_len equ $ - strHello     ; 正确计算长度

section .text
extern my_printf ;
global _start  

_start:
    ; 调用 printf(strHello)
    push strHello_len
    push strHello
    call my_printf


    ; 退出程序（系统调用）
    mov eax, 1      ; sys_exit
    mov ebx, 0      ; 返回码 0
    int 0x80