## Generated SDC file "multicore_processor_n.out.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Mon Jul 12 16:48:19 2021"

##
## DEVICE  "EP4CE6F17C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clock}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[4]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[5]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[5]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[6]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[6]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[7]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[7]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[8]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[8]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[9]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[9]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[10]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[10]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[11]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[11]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[12]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[12]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[13]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[13]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[14]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[14]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_dram[15]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_dram[15]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[4]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[5]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[5]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[6]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[6]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[7]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[7]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[8]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[8]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[9]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[9]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[10]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[10]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[11]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[11]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[12]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[12]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[13]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[13]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[14]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[14]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {Data_in_ins[15]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {Data_in_ins[15]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[4]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[5]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[5]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[6]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[6]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[7]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[7]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {addr_ext[8]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {addr_ext[8]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {dram_write_ext}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {dram_write_ext}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {iram_write_ext}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {iram_write_ext}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {read_en_ext}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {read_en_ext}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {start}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {start}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {start_2}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {start_2}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {start_3}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {start_3}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {start_4}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {start_4}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[7]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[7]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[8]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[8]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[9]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[9]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[10]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[10]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[11]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[11]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[12]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[12]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[13]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[13]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[14]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[14]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {dram_in[15]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {dram_in[15]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

