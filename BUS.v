module BUS(ar,pc,ir,dr,r,ac,dram,iram, control, data_out, addr, pc_addr);


input[15:0] ar,pc,dr,ir, r,ac,dram, iram;
input[3:0] control;


output reg[15:0] data_out;

output reg[15:0] addr;
output reg[15:0] pc_addr;

// always @(ar or pc or dr or ir or r or ac or dram or iram or control) //control
always @(control)
begin

case(control)

4'd1: data_out <= ar;
4'd2: data_out <= ac;
4'd3: data_out <= pc;
4'd4: data_out <= dr;
4'd5: data_out <= r;
4'd6: data_out <= iram;
4'd7: data_out <= dram;
4'd8: data_out <= ir;
default: data_out <= 16'd0;

endcase

addr <= ar;
pc_addr <= pc;

end

endmodule
