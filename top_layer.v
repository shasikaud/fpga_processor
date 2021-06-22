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
				 iram_in,
				 addr_ins,
				 addr_out,
				 state,
				 control_out,
				 ir_out,
				 read_en,
				 data_out_proc,
				 pc_addr,
				 addr_out_proc,
				 bus_out);



input start, mem_write_ins, clk;			// start the process
input [1:0] read_en_ext;
input [15:0] iram_in_ext,addr_ext;
input [15:0] data_in_ext;
input mem_write_data_ext;
output wire [15:0]bus_out;
output reg [8:0] addr_ins;

output reg [15:0] data_out; // data memory write output (data_bus <= input :: memory <= output)

output reg [15:0] addr_out;
output wire [15:0] iram_in;
output wire [15:0] dram_in; // data memory read output (data_bus <= output :: memory <= input)

output wire[5:0] state;
output wire [15:0] ir_out;
output wire[15:0] data_out_proc, pc_addr;
output wire[22:0]control_out;
output reg [1:0] read_en;
reg mem_write_data_proc;
reg mem_write_data;
reg read_en_data, read_en_ir;
output wire	 [15:0] addr_out_proc;
// clock clock(clk);  //clock module

Processor Processor(clk, 
					dram_in, 
					data_out_proc, 
					iram_in, 
					state,
					ir_out, 
					bus_out, 
					addr_out_proc,
					control_out,
					pc_addr);




state_machine state_machine(clk, start, ir_out, state);


always @(posedge clk) begin
	read_en <= control_out[11:10];
	mem_write_data_proc <= control_out[12];

	//data memmory
	if (mem_write_data_proc == 1 && mem_write_data_ext == 0)
		begin
			mem_write_data = 1;
			data_out <= bus_out;
			addr_out <= addr_out_proc;
		end
	if (mem_write_data_proc == 0 && mem_write_data_ext == 1)
		begin
			mem_write_data = 1;
			data_out <= data_in_ext;
			addr_out <= addr_ext;
		end
	
	if (mem_write_ins == 1)
		begin
			addr_ins = addr_ext;
		end

	// !instruction memory
	if (read_en_ext[0] == 0 && read_en[0] == 1)
		begin
			read_en_ir = 1;
			addr_ins = addr_out_proc;
		end
	if (read_en_ext[0] == 1 && read_en[0] == 0)
		begin
			read_en_ir = 1;
			addr_ins = addr_ext;
		end

	// !data memory
	if (read_en_ext[1] == 1 && read_en[1] == 0) 
		begin
			read_en_data <= 1;
			addr_out <= addr_ext;
		end
	if (read_en_ext[1] == 0 && read_en[1] == 1) 
		begin
			read_en_data <= 1;
			addr_out <= addr_out_proc;
		end

end




memory_ip  memory_ip_data (         // instantiate data memory

	.address(addr_out) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(data_out) ,	// input [15:0] data_sig
	.rden(read_en_data) ,	// input  rden_sig
	.wren(mem_write_data) ,	// input  wren_sig
	.q(dram_in) 	// output [15:0] q_sig

);

memory_ip  memory_ip_inst(          // instantiate instruction memory
	
    .address(addr_ins) ,	// input [8:0] address_sig
	.clock(clk) ,	// input  clock_sig
	.data(iram_in_ext) ,	// input [15:0] data_sig
	.rden(read_en_ir) ,	// input  rden_sig
	.wren(mem_write_ins) ,	// input  wren_sig
	.q(iram_in) 	// output [15:0] q_sig   
);


endmodule 