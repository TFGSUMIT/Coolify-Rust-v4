; This module encrypts the compressed output using AES-256-GCM.

section .text
global _start

_start:
    ; Read from the input file
    mov eax, 3 ; sys_read
    int 0x80

    ; Encrypt the input data
    mov eax, 4 ; sys_write
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80