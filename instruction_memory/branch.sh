riscv64-unknown-elf-as -march=rv32i branch.S -o branch.o
riscv64-unknown-elf-objcopy -S -O binary branch.o branch.bin
python parse_bin.py branch.bin instruction.rv