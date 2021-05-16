vlib work
vlog immediate_generator.v immediate_generator_tb.v
vsim immediate_generator_tb -do wave.do -do "run 200 ns" 
