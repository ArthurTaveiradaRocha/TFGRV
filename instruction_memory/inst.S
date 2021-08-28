addi x1, x0, 1
addi x2, x0, 2
addi x3, x0, 3
addi x4, x0, 4
addi x5, x0, 5
addi x6, x0, 6
addi x7, x0, 7
add x8, x2, x1
sub x9, x7, x3
sub x10, x4, x7
addi x11, x0, -11
sll x12, x4, x1
slli x13, x4, 2
srl x14, x4, x1
srli x15, x4, 1
sra x16, x4, x1
sra x17, x11, x1
srai x18, x4, 1
sra x19, x11, 1
or x20, x4, x1
ori x21, x4, 1
and x22, x4, x1
and x23, x4, x4
andi x24, x4, 1
andi x25, x4, 4
xor x26, x5, x1
xor x27, x5, x5
xori x28, x5, 1
xori x29, x5, 5
sw x5, 4(x0)
lw x30, 4(x0)
slt x3, x2, x1
slt x5, x2, x4
li x1, -1
slt x6, x2, x1
sltu x7, x2, x1
slti x8, x2, -1
sltiu x9, x2, -1
lui x31, 1
