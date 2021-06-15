//start - push button
module top_layer(clk,
 				 start,
				 dram_in, 
				 iram_in_ext,
				 data_out, 
				 addr_ext, 
				 mem_write_data_ext, 
				 mem_write_ins,
				 read_en_ext, 
				 data_in_ext,
				 iram_in);


input start, mem_write_ins, clk;			// start the process
input [1:0] read_en_ext;
input [15:0] iram_in_ext,addr_ext;
input [15:0] data_in_ext;
input mem_write_data_ext;
wire [15:0]bus_out;
output reg [15:0] data_out; // data memory write output (data_bus <= input :: memory <= output)

reg [15:0] addr_out;
output wire [15:0] iram_in;
output wire [15:0] dram_in; // data memory read output (data_bus <= output :: memory <= input)

wire[5:0] state;
wire[15:0] data_out_proc, ir_out, control_out;
reg [1:0] read_en;
reg mem_write_data_proc;
reg mem_write_data;
reg read_en_data, read_en_ir;
// clock clock(clk);  //clock module

Processor Processor(clk, dram_in, data_out_proc, iram_in, state,ir_out, bus_out, addr_out_proc,control_out);




state_machine state_machine(clk, start, ir_out, state);


always @(posedge clk) begin
	read_en <= control_out[13:12];
	mem_write_data_proc <= control_out[14];

	if (mem_write_data_proc == 1 && mem_write_data_ext == 0)
		begin
			mem_write_data = 1;
			data_out <= data_out_proc;
			addr_out <= addr_out_proc;
		end
	if (mem_write_data_proc == 0 && mem_write_data_ext == 1)
		begin
			mem_write_data = 1;
			data_out <= data_in_ext;
			addr_out <= addr_ext;
		end
		
	if (read_en_ext[0] == 0 && read_en[0] == 1) // instruction memory
		begin
			read_en_ir <= 1;
			addr_out <= addr_out_proc;
		end
	if (read_en_ext[0] == 1 && read_en[0] == 0) // instruction memory
		begin
			read_en_ir <= 1;
			addr_out <= addr_ext;
		end
	if (read_en_ext[1] == 1 && read_en[1] == 0) // data memory
		begin
			read_en_data <= 1;
			addr_out <= addr_ext;
		end
	if (read_en_ext[1] == 0 && read_en[1] == 1) // data memory
		begin
			read_en_data <= 1;
			addr_out <= addr_out_proc;
		end
end

//
//always @(posedge clk) begin
//		
//end



memory_ip  memory_ip_data (         // instantiate data memory

	.address(addr_out[8:0]) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(data_out) ,	// input [15:0] data_sig
	.rden(read_en_data) ,	// input  rden_sig
	.wren(mem_write_data) ,	// input  wren_sig
	.q(dram_in) 	// output [15:0] q_sig

);

memory_ip  memory_ip_inst(          // instantiate instruction memory
	
    .address(ir_out[8:0]) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(iram_in_ext) ,	// input [15:0] data_sig
	.rden(read_en_ir) ,	// input  rden_sig
	.wren(mem_write_ins) ,	// input  wren_sig
	.q(iram_in) 	// output [15:0] q_sig   
);


endmodule 