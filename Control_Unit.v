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
output reg[22:0] control_out;
// output reg[1:0] mem_write; 

parameter idle = 6'd0;
parameter fetch1 = 6'd1;
parameter fetch2 = 6'd2;
parameter fetch3 = 6'd3;
parameter fetch4 = 6'd4;
parameter fetch5 = 6'd5;
parameter clac = 6'd6;
parameter ldac1 = 6'd7;
parameter ldac2 = 6'd8;
parameter ldac3 = 6'd9;
parameter ldac4 = 6'd10;
parameter stac1 = 6'd11;
parameter stac2 = 6'd12;
parameter stac3 = 6'd13;
parameter stac4 = 6'd14;
parameter mvacr = 6'd15;
parameter mvrac = 6'd16;
parameter add = 6'd17;
parameter mul = 6'd18;

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
control_out <= 23'd0;
// mem_write <= 2'd0;
end

fetch1:

begin
control_out <= 23'd33856;
// mem_write <= 2'd0;
end

fetch2:

begin
control_out <= 23'd2098178;
// mem_write <= 2'd0;
end

fetch3:

begin
control_out <= 23'd2622465;
// mem_write <= 2'd0;
end


fetch4:

begin
control_out <= 23'd2622465;
// mem_write <= 2'd0;
end


fetch5:

begin
control_out <= 23'd2622465;
// mem_write <= 2'd0;
end

clac:

begin
control_out <= 23'd8192;
// mem_write <= 2'd0;
end

ldac1:

begin
control_out <= 23'd34944;
// mem_write <= 2'd0;
end

ldac2:

begin
control_out <= 23'd2099200;
// mem_write <= 2'd0;
end

ldac3:

begin
control_out <= 23'd1116160;
// mem_write <= 2'd0;
end

stac1:

begin
control_out <= 23'd32832;
// mem_write <= 2'd0;
end

stac2:

begin
control_out <= 23'd4130;
// mem_write <= 2'd1;
end

stac3:

begin
control_out <= 23'd16;
// mem_write <= 2'd0;
end

mvacr:

begin
control_out <= 23'd16416;
// mem_write <= 2'd0;
end

mvrac:

begin
control_out <= 23'd131076;
// mem_write <= 2'd0;
end

add:

begin
control_out <= 23'd4194564;
// mem_write <= 2'd0;
end

mul:

begin
control_out <= 23'd4194820;
// mem_write <= 2'd0;
end

endcase


endmodule 