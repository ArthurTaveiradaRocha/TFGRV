# TFGRV - A RISC-V Implementation

My goal with this project is to learn more about microcontroller architecture as well as to study how to implement the Risc-V architecture. So this project is used for the practice of RTL design as well as functional verification.

## Installation

- First we need to install the GNU Embeddded Toolchain for your OS. In my case is UBUNTU. Now we can write our instructions in assembly instead of write in binary;
- I'm using the ModelSim from Intel to test my RISC-V. 

## How to test each block
Inside the folder of each block, we can find a simple test bench, which will help us see how the block is working and give us the signals so we can plot them with the help of ModelSim. 
We can see these test benches in the form of "name_block"_tb.v.
To plot the block's signals with the help of modelsim we have a .sh script that helps us plot the signals for a better visualization of each block.

For exemple, to plot the store signals, we need to be in the store folder and run this command:

```bash
./simul.sh
```

## How to test the Core
Equally we have a script inside each block to test them, we also have one inside the core folder, which is the block where we do the integration of all the other blocks. And we can use the same command to run this script:

```bash
./simul.sh
```
In this project we have some assembly code inside the instruction_memory folder, this code was made to test how well the implemented instructions work. To use these codes just send the command for the script that you want to use to test the integration. For example, in the folder there is a script called branch.S, to use the commands from this file in instruction_memory just run the following command:

```bash
./branch.sh
```

## Implemented Instructions
In this project we have implemented 35 instructions, they are: 
- ADD - addition instruction between two registers;
- ADDI - adds a immediate value with a value from a register;
- SUB - subtraction between two registers;
- SLL - shift left logical using two registers;
- SLLI - shift left logical using a immediate value; 
- SLT - set less than, writing 1 to rd if rs1 < rs2, 0 otherwise;
- SLTI - set less than, using a immediate value in rs2;
- SLTU - the same of SLT, but with unsigned values;
- SLTIU - the same of SLTI, but with unsigned values;
- XOR - logical operation XOR between to registers;
- XORI - logical operation XOR between a register and a immediate value;  
- SRL - shift right logical using two registers;
- SRLI - shift right logical using a immediate value; 
- SRA - shift right arithmetic using two registers;
- SRAI - shift right arithmetic using a immediate value; 
- OR - logical operation OR between to registers;
- ORI - logical operation OR between a register and a immediate value;  
- AND - logical operation AND between to registers;
- ANDI - logical operation AND between a register and a immediate value; 
- LW - load word;
- BEQ - take the branch if the registers are equal; 
- SW - store word;
- BNE - take the branch if the registers are unequal;
- BGE - take the branch if rs1 is greater
than or equal to rs2;
- BLT - take the branch if rs1 is less than rs2;
- BLTU - the same of BLT, but with unsigned registers;
- BGEU - the same of BGE, but with unsigned registers;
- SB - store 8 bits values from the low bits to memory;
- SH - store 16 bits values from the low bits to memory;
- LB - loads 8 bits from memory then sign-extends to 32-bits;
- LH - loads 16 bits from memory then sign-extends to 32-bits;
- LUI - places de immediate value in the top 20 bits and fill the lowest 12 bits with zeros;
- AUIPC - do the same thing of LUI, but adding the pc value;
- JAL - instruction an instruction that branches to an address and simultaneously saves the address of the following instruction in a register; 
- JALR - the same of JAL, but using a register instead of a immediate value.
