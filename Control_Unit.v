/*
This module defines the control unit of the processors
inputs  :   clock, 
            state, from the state machine
            
outputs :   countrol out,
            mem_write
*/
module Control_Unit(clock, state, control_out);

input clock;
input[5:0] state;
output reg[15:0] control_out;
// output reg[1:0] mem_write; 

parameter idle = 6'd0;
parameter fetch1 = 5'd1;
parameter fetch2 = 5'd2;
parameter fetch3 = 5'd3;
parameter clac = 5'd4;
parameter ldac1 = 5'd5;
parameter ldac2 = 5'd6;
parameter ldac3 = 5'd7;
parameter stac1 = 5'd8;
parameter stac2 = 5'd9;
parameter stac3 = 5'd10;
parameter mvacr = 5'd11;
parameter mvrac = 5'd12;
parameter add = 5'd13;
parameter mul = 5'd14;

//control signal
// [1] branch
// [1] pc<-pc+1
// [4] bus read
// [1] AR
// [1] IR
// [1] DR
// [1] R
// [1] PC
// [1] AC
// [2] Mem read
// [1] AC<-0
// [2] ALU Op

always@(posedge clock)

case(state)

idle:

begin
control_out <= 16'd0;
// mem_write <= 2'd0;
end

fetch1:

begin
control_out <= 16'd3080;
// mem_write <= 2'd0;
end

fetch2:

begin
control_out <= 16'd4608;
// mem_write <= 2'd0;
end

fetch3:

begin
control_out <= 16'd98304;
// mem_write <= 2'd0;
end

clac:

begin
control_out <= 16'd4;
// mem_write <= 2'd0;
end

ldac1:

begin
control_out <= 16'd3088;
// mem_write <= 2'd0;
end

ldac2:

begin
control_out <= 16'd39168;
// mem_write <= 2'd0;
end

ldac3:

begin
control_out <= 16'd8224;
// mem_write <= 2'd0;
end

stac1:

begin
control_out <= 16'd11264;
// mem_write <= 2'd0;
end

stac2:

begin
control_out <= 16'd12544;
// mem_write <= 2'd1;
end

stac3:

begin
control_out <= 16'd47104;
// mem_write <= 2'd0;
end

mvacr:

begin
control_out <= 16'd16512;
// mem_write <= 2'd0;
end

mvrac:

begin
control_out <= 16'd18464;
// mem_write <= 2'd0;
end

add:

begin
control_out <= 16'd33;
// mem_write <= 2'd0;
end

mul:

begin
control_out <= 16'd34;
// mem_write <= 2'd0;
end

endcase


endmodule 