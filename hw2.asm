section .data ; initialized data:
	; this is version 2!! Use this instead of version 1
	; this is a change
	msg: db "Hello World!",0xA
	msgLen: equ $-msg
section .text ; our logic sauce:
	global _start
	_start:
		mov EAX, 4 ; syscall for sys_write()
		mov EBX, 1 ; /dev/stdout
		mov ECX, msg ; 
		mov EDX, msgLen ; length of message in bytes
	
		int 0x80 ; call kernel

		mov EAX, 1 ; syscall for exit()
		mov EBX, 0 ; return 0
		int 0x80 ; call the kernel and pass execution to her
section .bss ; no uninitialized data in this application yet
