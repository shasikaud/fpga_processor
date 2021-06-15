module datapath(clock, dram_in, iram_in, control,ir_out, bus_out, addr_out);
input clock;
input [15:0] dram_in;
input [15:0] iram_in;
input[15:0] control;
output[15:0] bus_out;
output wire[15:0] addr_out, ir_out;

wire[15:0] ar,pc,dr,r,ac,alu_out, data_in_alu, alu;

wire[7:0] ir;


BUS BUS(ar,pc,ir_out,dr,r,ac,dram_in,iram_in, control[3:0], bus_out, addr_out);

register R(clock,control[3], bus_out, r);

register AR(clock,control[4], bus_out, ar);

register DR(clock,control[5], bus_out, dr);

AC AC(clock,control[6], bus_out, alu_out, data_in_alu, ac);

PC PC(clock, control[7], control[8], bus_out, pc);

IR IR(clock,control[9], bus_out, ir_out);

ALU ALU(clock, control[11:10], ac, bus_out, alu_out);

endmodule  

