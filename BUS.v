<<<<<<< Updated upstream
module BUS(ar,pc,ir,dr,r,ac,dram,iram, control, data_out, addr);
=======
module BUS(ar,pc,ir,dr,r,ac,dram,iram, control_register, data_out, addr, pc_addr, control_memory);
>>>>>>> Stashed changes


input[15:0] ar,pc,dr,ir, r,ac,dram, iram;
input[5:0] control_register;
input[1:0] control_memory;

reg[7:0] control;
output reg[15:0] data_out;

output reg[15:0] addr;

<<<<<<< Updated upstream
always @(ar or pc or dr or ir or r or ac or dram or iram or control) //control

=======
// always @(ar or pc or dr or ir or r or ac or dram or iram or control) //control
always @(control_register or control_memory)
>>>>>>> Stashed changes
begin

control[5:0] = control_register;
control[7:6] = control_memory;
case(control)

<<<<<<< Updated upstream
4'd1: data_out <= ar;
4'd2: data_out <= ac;
4'd3: data_out <= pc;
4'd4: data_out <= dr;
4'd5: data_out <= r;
4'd6: data_out <= iram;
4'd7: data_out <= dram;
=======
8'd1: data_out <= r;
8'd2: data_out <= ar;
8'd4: data_out <= dr;
8'd8: data_out <= ac;
8'd16: data_out <= pc;
8'd32: data_out <= ir;
8'd64: data_out <= dram;
8'd128: data_out <= iram;
>>>>>>> Stashed changes
default: data_out <= 16'd0;

endcase

addr <= ar;

end

endmodule
