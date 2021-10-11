.section .text
.globl _start
_start:

addi x1, x0, 0xCA
addi x2, x0, 0xFE
jal x10, _FUNC
jal x15, _END

addi x5, x0, 10 

_FUNC:
xor x3, x0, x1
slli x3, x3, 0x08
xor x3, x3, x2
jalr x11, x10, 0x01

_END:
sw x3, 4(x0)
