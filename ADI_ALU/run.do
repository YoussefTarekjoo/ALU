vlib work
vlog ALU.sv Interface.sv Driver.sv Transaction_Object.sv Monitor.sv Scoreboard.sv sequencer.sv Environment.sv Testbench_Top.sv 
vsim -voptargs=+acc work.tb  
add wave *
run -all