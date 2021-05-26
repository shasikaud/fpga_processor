//start - push button
module top_layer(start, dram_in, iram_in, data_out, addr_out, mem_write);


input start;
input [15:0] dram_in;  // data memory read output (data_bus <= output :: memory <= input)
input [15:0] iram_in;
output[15:0] data_out; // data memory write output (data_bus <= input :: memory <= output)
output wire[15:0] addr_out;
output wire[1:0] mem_write;
wire[5:0] state;
wire[15:0] ir_out;
wire clk;

clock clock(clk);  //clock module

state_machine state_machine(clk, start, ir_out, state);

memory_ip  memory_ip_data (         // instantiate data memory

	.address(addr_out[8:0]) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(dram_in) ,	// input [15:0] data_sig
	.rden(rden_sig) ,	// input  rden_sig
	.wren(mem_write_data) ,	// input  wren_sig
	.q(data_out) 	// output [15:0] q_sig

);

memory_ip  memory_ip_inst(          // instantiate instruction memory
	
    .address(ir_out[8:0]) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(iram_in) ,	// input [15:0] data_sig
	.rden(rden_sig) ,	// input  rden_sig
	.wren(mem_write_ins) ,	// input  wren_sig
	.q(iram_in) 	// output [15:0] q_sig
    
);

Processor Processor(clk, dram_in, iram_in, state,ir_out, data_out, addr_out,mem_write);

endmodule 