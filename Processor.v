module Processor(clock, dram_in, data_out, iram_in, state,ir_out, bus_out, addr_out,control_out, pc_addr);
input clock;
input [15:0] dram_in;
input [15:0] iram_in;
input[5:0] state;
output[15:0] bus_out;
output wire[15:0] addr_out;
output wire[15:0] ir_out, data_out, pc_addr;
output wire[15:0] control_out;
//output reg[1:0] read_en;
// corresponds to 13:data read / 12:instruction read
//output reg mem_write_data;
Control_Unit control_unit(clock, state, control_out);


datapath datapath(clock, dram_in, iram_in, control_out,ir_out, bus_out, addr_out, pc_addr);
//read_en = control_out[13:12]; 
//mem_write_data = control_out[14];
endmodule 