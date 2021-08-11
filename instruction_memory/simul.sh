vlib work
vlog instruction_memory.v instruction_memory_tb.v
vsim instruction_memory_tb -do wave.do -do "run 500 ns"
