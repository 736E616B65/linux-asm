section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   mov rcx,10
   mov rax, '1'
	
l1:
   mov [num], rax ;mum = 1;
   mov rax, 4 ;sys_write
   mov rbx, 1 ;len
   PUSH rcx ; loop count backup
	
   mov rcx, num ; sys_write argv
   mov rdx, 1   ;stout
   int 0x80
	
   mov rax, [num] ;rax = num address
   sub rax, '0'
   inc rax 
   add rax, '0'
   POP rcx
   loop l1
	
   mov rax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel
section	.bss
num resb 1