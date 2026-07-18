# Coolify Backup Daemon

This is a bare-metal backup daemon written in pure x86_64 NASM assembly with zero libc dependency, direct Linux syscalls, and a 64KB constraint.

## Features

* Database dump module
* Compression module using LZ4
* Encryption module using AES-256-GCM
* Chunking module
* Upload module using HTTP/1.1

## Usage

1. Clone this repository
2. Run `nasm -f elf32 daemon.asm` to assemble the daemon
3. Run `ld -m elf_i386 -o daemon daemon.o` to link the daemon
4. Run `./daemon` to run the daemon

## Contributing

Contributions are welcome! Please follow the contributor verification phrase in the pull request body.

## License

This project is licensed under the MIT License.