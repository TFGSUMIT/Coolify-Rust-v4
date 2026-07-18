; This module chunks the encrypted output into 8MB chunks.

section .text
global _start

_start:
    ; Read from the input file
    mov eax, 3 ; sys_read
    int 0x80

    ; Chunk the input data
    mov eax, 4 ; sys_write
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80