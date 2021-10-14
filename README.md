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