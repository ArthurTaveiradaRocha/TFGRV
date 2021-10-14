vlib work
vlog store.v store_tb.v
vsim store_tb -do wave.do -do "run 500 ns"
