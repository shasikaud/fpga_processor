module datapath(clock, dram_in, iram_in, control,ir_out, bus_out, addr_out, pc_addr);
input clock;
input [15:0] dram_in;
input [15:0] iram_in;
input[22:0] control;
output[15:0] bus_out;
output wire[15:0] addr_out, ir_out, pc_addr;


wire[15:0] ar,pc,dr,r,ac,alu_out, alu;

wire[7:0] ir;


BUS BUS(ar,pc,ir_out,dr,r,ac,dram_in,iram_in, control[7:2], bus_out, addr_out, pc_addr,control[21:20]);

register R(clock,control[14], bus_out, r);

register AR(clock,control[15], bus_out, ar);

register DR(clock,control[16], bus_out, dr);

AC AC(clock,control[17], bus_out, control[22], alu_out , ac);

PC PC(clock, control[18], control[1], bus_out, pc);

IR IR(clock,control[19], bus_out, ir_out);

ALU ALU(clock, control[9:8], ac, bus_out, alu_out);


endmodule  

