module processor(clock,control, dram_in,iram_in,dram_out, ir_out,ar_out, pc_out, data_in_pc,alu_in_1,alu_in_2, alu_out);

input clock;
input[14:0] control;
input[15:0] dram_in,iram_in;
output wire[15:0] dram_out,ir_out,ar_out, pc_out;

output wire[15:0] data_in_pc,alu_in_1,alu_in_2, alu_out; // output for test



register R1(clock, alu_in_1, dram_in, control[8]);

register R2(clock, alu_in_2, dram_in, control[9]);

register AC(clock, dram_out, alu_out, control[10]);

register IR(clock, ir_out, iram_in, control[11]);

register AR(clock, ar_out, ir_out, control[12]);

PC PC(clock, pc_out, data_in_pc, control[13], control[14]);

ALU ALU(clock, control[1:0], alu_in_1,alu_in_2, alu_out);


endmodule 