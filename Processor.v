module Processor(clock, dram_in, data_out, iram_in, state,ir_out, bus_out, addr_out, mem_write_data,read_en);
input clock;
input [15:0] dram_in;
input [15:0] iram_in;
input[5:0] state;
output[15:0] bus_out;
output wire[15:0] addr_out;
output wire[15:0] ir_out, data_out;
output wire mem_write_data = control_out[14];

wire[15:0] control_out;
output wire[1:0] read_en = control_out[13:12]; // corresponds to 13:data read / 12:instruction read

control_unit control_unit(clock, state, control_out);


datapath datapath(clock, dram_in, iram_in, control_out,ir_out, bus_out, addr_out);


endmodule  

