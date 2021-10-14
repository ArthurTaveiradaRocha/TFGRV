riscv64-unknown-elf-as -march=rv32i load.S -o load.o
riscv64-unknown-elf-objcopy -S -O binary load.o load.bin
python parse_bin.py load.bin instruction.rv