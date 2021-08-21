riscv64-unknown-elf-as -march=rv32i inst.S -o inst.o
riscv64-unknown-elf-objcopy -S -O binary inst.o inst.bin
python parse_bin.py inst.bin instruction.rv