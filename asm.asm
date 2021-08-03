section	.data
    msg db 'You are name: ' ;a message
    len equ $ - msg  ;length of message

section .bss
        name db ''
        
section .text
    global _start 

_start:
    mov ecx, msg
    mov edx, len
    mov ebx, 1        
    mov eax, 4
    int 0x80

    mov ecx, name
    mov ebx, 0
    mov edx, 10
    mov eax, 3
    int 0x80

    mov ecx, name
    mov edx, 9
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80