# Created by: Jani Heinikoski on 19.02.2023

# Make the known entrypoint label _start visible for the GNU's linker
.global _start

# Data section for primarily defining labels begins here.
# Labels are practically named memory addresses which can be used as instruction operands.
.data
message:
    # Beginning of the string literal "Hello world\n\0" is at the memory location of message
    .ascii "Hello world\n\0"
syscall_write_number:
    # 32-bit representation of the integer 1 is at the memory location of syscall_write_number
    .long 1
syscall_exit_number:
    # 32-bit representation of the integer 60 is at the memory location of syscall_exit_number
    .long 60

# Text section where primarily the unaltered instructions are.
.text
_start:
    # Move value at location syscall_write_number into reg. eax (note: uses rip-relative addressing for PIE support)
    movl    syscall_write_number(%rip), %eax
    # Move immediate value 1 into reg. edi
    movl    $1, %edi
    # Loads the effective address of message label into register rsi (note: uses rip-relative addressing for PIE support)
    leaq    message(%rip), %rsi
    # Move immediate value 13 into reg. edx
    movl    $13, %edx
    # Make the system call
    syscall

    # Move value at location syscall_exit_number into reg. eax (note: uses rip-relative addressing for PIE support)
    movl    syscall_exit_number(%rip), %eax
    # Move immediate value 0 into reg. edi
    movl    $0, %edi
    # Make the system call
    syscall
