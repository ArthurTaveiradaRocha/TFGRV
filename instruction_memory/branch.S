addi x10, x0 , 0
li x1, 10
_LOOP1:
addi x10, x10, 1
beq x10, x1, _END
beq x0, x0, _LOOP1
_END:
add x0, x0, x0
