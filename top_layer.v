//start - push button
module top_layer(clk, start, dram_in, iram_in_ext,
				 data_out, addr_out, mem_write_data_ext, mem_write_ins,
				 read_en,mem_write_data,data_out,data_in_ext,iram_in);


input start, mem_write_ins;			// start the process
input [15:0] iram_in_ext;
input [15:0] data_in_ext;
input mem_write_data_ext;

output wire [15:0] data_out; // data memory write output (data_bus <= input :: memory <= output)

output wire[15:0] addr_out;
output wire [15:0] iram_in;
output wire [15:0] dram_in; // data memory read output (data_bus <= output :: memory <= input)

wire[5:0] state;
wire[15:0] data_out_proc, ir_out;
wire [1:0] read_en;
wire mem_write_data_proc, mem_write_data;

// clock clock(clk);  //clock module

Processor Processor(clk, dram_in, data_out_proc, iram_in, state,ir_out, bus_out, addr_out, mem_write_data,read_en);

state_machine state_machine(clk, start, ir_out, state);


mem_write_data = mem_write_data_proc || mem_write_data_ext;


if (mem_write_data_proc == 1 && mem_write_data_ext == 0)
	begin
		data_out <= data_out_proc;
	end
if (mem_write_data_proc == 0 && mem_write_data_ext == 1)
	begin
		data_out <= data_in_ext;
	end


memory_ip  memory_ip_data (         // instantiate data memory

	.address(addr_out[8:0]) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(data_out) ,	// input [15:0] data_sig
	.rden(read_en[1]) ,	// input  rden_sig
	.wren(mem_write_data) ,	// input  wren_sig
	.q(dram_in) 	// output [15:0] q_sig

);

memory_ip  memory_ip_inst(          // instantiate instruction memory
	
    .address(ir_out[8:0]) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(iram_in_ext) ,	// input [15:0] data_sig
	.rden(read_en[0]) ,	// input  rden_sig
	.wren(mem_write_ins) ,	// input  wren_sig
	.q(iram_in) 	// output [15:0] q_sig
    
);


endmodule 