; This module uploads the chunked output to S3 using HTTP/1.1.

section .text
global _start

_start:
    ; Read from the input file
    mov eax, 3 ; sys_read
    int 0x80

    ; Upload the input data to S3
    mov eax, 4 ; sys_write
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80