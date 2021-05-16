vlib work
vlog data_memory.v data_memory_tb.v
vsim data_memory_tb -do wave.do -do "run 200 ns"
