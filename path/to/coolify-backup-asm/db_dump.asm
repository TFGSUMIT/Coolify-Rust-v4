; This module dumps the database to a file.

section .text
global _start

_start:
    ; Open the database file for reading
    mov eax, 5 ; sys_open
    mov ebx, db_dump_file ; database file
    mov ecx, 0 ; flags
    mov edx, 0 ; mode
    int 0x80

    ; Read from the database file
    mov eax, 3 ; sys_read
    int 0x80

    ; Write to the output file
    mov eax, 4 ; sys_write
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80