//start - push button
module top_layer(start, dram_in, iram_in, data_out, addr_out, mem_write);


input start;
input [15:0] dram_in;
input [15:0] iram_in;
output[15:0] data_out;
output wire[15:0] addr_out;
output wire[1:0] mem_write;
wire[5:0] state;
wire[15:0] ir_out;
wire clk;

clock clock(clk);  //clock module

state_machine state_machine(clk, start, ir_out, state);

Processor Processor(clk, dram_in, iram_in, state,ir_out, data_out, addr_out,mem_write);

endmodule 