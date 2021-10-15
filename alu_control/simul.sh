vlib work
vlog alu_control.v alu_control_tb.v
vsim alu_control_tb -do wave.do -do "run 500 ns"
