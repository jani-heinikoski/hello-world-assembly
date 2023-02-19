# Hello World
This code repository contains a hello world program written in assembly language. The program is designed to run on Linux systems. It uses system calls instead of the C standard library (hence compiler flag -nostdlib). Tested on host machine with 64-bit Linux Ubuntu 22.04.2 LTS as the operating system.

Compilation using bash and gcc
```bash
gcc -nostdlib hello_world.s -o hello_world
```

Program execution using bash
```bash
./hello_world
```
## Assembly language specifications

**Instruction set architecture (ISA):** x86-64

**Kernel:** Linux

**Assembler:** GNU Assembler (GAS)

**Assembly language syntax:** AT&T
