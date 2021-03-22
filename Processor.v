module Processor(clock, dram_in, iram_in, state,ir_out, bus_out, addr_out, mem_write);
input clock;
input [15:0] dram_in;
input [15:0] iram_in;
input[5:0] state;
output[15:0] bus_out;
output wire[15:0] addr_out;
output wire[15:0] ir_out;
output wire[1:0] mem_write;

wire[15:0] control_out;


control_unit control_unit(clock, state, control_out, mem_write);


datapath datapath(clock, dram_in, iram_in, control_out,ir_out, bus_out, addr_out);


endmodule  

