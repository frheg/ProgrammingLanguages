
# HELP.md — RISC-V Quick Reference

This file is a minimal, practical lookup for getting unstuck when working with RISC-V.
Focus: how programs are built and run, what each tool does, and how to read/write basic assembly.

---

## 1. What RISC-V Is

RISC-V is a Reduced Instruction Set Computer (RISC) architecture.

Key properties:
- Load/store architecture
- Fixed-width instructions (mostly 32-bit)
- Simple, orthogonal instruction set
- Open specification

---

## 2. Required Tools (Ubuntu x86)

Install once:

sudo apt install gcc-riscv64-linux-gnu qemu-user gdb-multiarch

Tools:
- riscv64-linux-gnu-as: assembler
- riscv64-linux-gnu-gcc: compiler + linker
- riscv64-linux-gnu-ld: linker
- qemu-riscv64: emulator
- gdb-multiarch: debugger

---

## 3. Program Lifecycle

Source code → compilation/assembly → object files → linking → executable → execution (real or emulated CPU)

---

## 4. Minimal Assembly Program

.global _start
_start:
    li a0, 42
    li a7, 93
    ecall

---

## 5. Build and Run (Assembly)

riscv64-linux-gnu-as hello.s -o hello.o
riscv64-linux-gnu-ld hello.o -o hello
qemu-riscv64 ./hello

---

## 6. Build and Run (C)

int main() {
    return 42;
}

riscv64-linux-gnu-gcc test.c -o test
qemu-riscv64 ./test

---

## 7. Registers (RV64)

zero: constant 0
ra: return address
sp: stack pointer
a0–a7: arguments / return values
t0–t6: temporaries
s0–s11: saved registers

---

## 8. Common Instructions

li, mv, lw, sw
add, sub, addi
beq, bne, j, jal, jalr
ecall

---

## 9. ABI Rules

Arguments in a-registers
Return value in a0
Stack grows downward
16-byte stack alignment
Callee must preserve s-registers

---

## 10. Inspecting Compiler Output

riscv64-linux-gnu-gcc -O0 -S test.c

---

## 11. Debugging

qemu-riscv64 -g 1234 ./program
gdb-multiarch ./program
target remote :1234

---

## 12. Mental Model

Assembly is explicit control and data movement.
Compiler automates structure.
Linker resolves symbols.
Emulator enforces ISA rules.

