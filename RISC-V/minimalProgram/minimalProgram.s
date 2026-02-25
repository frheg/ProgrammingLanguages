
.global _start
_start:
    li a0, 42
    li a7, 93      # exit syscall
    ecall

