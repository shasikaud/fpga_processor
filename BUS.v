module BUS(ar,pc,ir,dr,r,ac,dram,iram, control_register, data_out, addr, pc_addr, control_memory);


input[15:0] ar,pc,dr,ir, r,ac,dram, iram;
input[5:0] control_register;
input[1:0] control_memory;

reg[7:0] control;
output reg[15:0] data_out;

output reg[15:0] addr;
output reg[15:0] pc_addr;

// always @(ar or pc or dr or ir or r or ac or dram or iram or control) //control
always @(control_register or control_memory)
begin

control[5:0] = control_register;
control[7:6] = control_memory;
case(control)

8'd1: data_out <= r;
8'd2: data_out <= ar;
8'd4: data_out <= dr;
8'd8: data_out <= ac;
8'd16: data_out <= pc;
8'd32: data_out <= ir;
8'd64: data_out <= dram;
8'd128: data_out <= iram;
default: data_out <= 16'd0;

endcase

addr <= ar;
pc_addr <= pc;

end

endmodule
