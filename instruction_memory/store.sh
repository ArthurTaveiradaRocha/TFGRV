riscv64-unknown-elf-as -march=rv32i store.S -o store.o
riscv64-unknown-elf-objcopy -S -O binary store.o store.bin
python parse_bin.py store.bin instruction.rv