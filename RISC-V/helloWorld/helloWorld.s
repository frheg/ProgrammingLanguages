
    .section .rodata
msg:
    .ascii "Hello world!\n"
len = . - msg

    .section .text
    .global _start
_start:
    # write(fd=1, buf=msg, count=len)
    li  a0, 1          # stdout
    la  a1, msg        # buffer
    li  a2, len        # length
    li  a7, 64         # __NR_write on RISC-V Linux
    ecall

    # exit(status=0)
    li  a0, 0
    li  a7, 93         # __NR_exit on RISC-V Linux
    ecall

