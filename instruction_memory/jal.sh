riscv64-unknown-elf-as -march=rv32i jal.S -o jal.o
riscv64-unknown-elf-objcopy -S -O binary jal.o jal.bin
python parse_bin.py jal.bin instruction.rv