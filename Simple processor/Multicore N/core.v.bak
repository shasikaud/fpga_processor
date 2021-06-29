module core(clock,start, dram_in, iram_in,dram_out, pc_out,ar_out, read_en, write_en,control_out,state, data_in_pc,alu_in_1,alu_in_2, alu_out);

input clock, start;
input[15:0] dram_in, iram_in;

output[15:0] dram_out, pc_out,ar_out;
output wire[1:0] read_en;
output wire write_en;

output wire[19:0] control_out;
output wire[5:0] state;

output wire[15:0] data_in_pc,alu_in_1,alu_in_2, alu_out; // output for test


wire[15:0] ir_out;







state_machine state_machine(clock, start, ir_out, state);

control_unit control_Unit(clock, state, control_out);

processor processor(clock,control_out[14:0], dram_in,iram_in,dram_out, ir_out,ar_out, pc_out, data_in_pc,alu_in_1,alu_in_2, alu_out);



assign read_en[0] = control_out[15]; //data memory read_en
assign read_en[1] = control_out[17]; //instruction memory read_en
assign write_en = control_out[16]; //data memeory write_en

//memory_ip data_memory(
//	ar_out[8:0],
//	clock,
//	data,
//	rden,
//	wren,
//	q);
//
//memory_ip instruction_memory(
//	pc_out,
//	clock,
//	data,
//	rden,
//	wren,
//	q);

endmodule 