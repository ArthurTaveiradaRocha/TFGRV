vlib work
vlog alu.v alu_tb.v
vsim alu_tb -do wave.do -do "run 500 ns"
