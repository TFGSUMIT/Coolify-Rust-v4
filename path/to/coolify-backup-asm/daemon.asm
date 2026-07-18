; This is the main pipeline of assembly modules for the backup daemon.
; It forks and executes the database dump module, then compresses the output,
; encrypts it, chunks it, and uploads it to S3.

section .text
global _start

_start:
    ; Fork and execute the database dump module
    mov eax, 2 ; sys_fork
    int 0x80
    mov ebx, db_dump ; database dump module
    mov ecx, 0 ; no arguments
    mov edx, 0 ; no environment
    int 0x80

    ; Wait for the child process to finish
    mov eax, 4 ; sys_waitpid
    int 0x80

    ; Compress the output of the database dump module
    mov eax, 4 ; sys_read
    int 0x80
    mov ebx, compress ; compression module
    mov ecx, 0 ; no arguments
    mov edx, 0 ; no environment
    int 0x80

    ; Encrypt the compressed output
    mov eax, 4 ; sys_read
    int 0x80
    mov ebx, encrypt ; encryption module
    mov ecx, 0 ; no arguments
    mov edx, 0 ; no environment
    int 0x80

    ; Chunk the encrypted output
    mov eax, 4 ; sys_read
    int 0x80
    mov ebx, chunk ; chunking module
    mov ecx, 0 ; no arguments
    mov edx, 0 ; no environment
    int 0x80

    ; Upload the chunked output to S3
    mov eax, 4 ; sys_read
    int 0x80
    mov ebx, upload ; upload module
    mov ecx, 0 ; no arguments
    mov edx, 0 ; no environment
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80