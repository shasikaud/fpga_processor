/*
This module defines the control unit of the processors
inputs  :   clock, 
            state, from the state machine
            
outputs :   countrol out,
            mem_write
*/
module control_unit(clock, state, control_out);

input clock;
input[5:0] state;
output reg[19:0] control_out;
// output reg[1:0] mem_write; 

parameter idle = 6'd0;
parameter fetch1 = 6'd1;
parameter fetch2 = 6'd2;
parameter fetch3 = 6'd3;
parameter fetch4 = 6'd4;
parameter fetch5 = 6'd5;
parameter fetch6 = 6'd6;
parameter ldr11 = 6'd7;
parameter ldr12 = 6'd8;
parameter ldr13 = 6'd9;
parameter ldr14 = 6'd10;
parameter ldr21 = 6'd11;
parameter ldr22 = 6'd12;
parameter ldr23 = 6'd13;
parameter ldr24 = 6'd14;
parameter stac1 = 6'd15;
parameter stac2 = 6'd16;
parameter stac3 = 6'd17;
parameter stac4 = 6'd18;
parameter add1 = 6'd19;
parameter add2 = 6'd20;
parameter mul1 = 6'd21;
parameter mul2 = 6'd22;
parameter FINISH = 6'd23;



always@(posedge clock)

case(state)

idle:

begin
control_out <= 20'd0;

end

fetch1:

begin
control_out <= 20'd135328;

end

fetch2:

begin
control_out <= 20'd131136;

end

fetch3:

begin                   
control_out <= 20'd133152;

end

fetch4:

begin
control_out <= 20'd133152;

end
fetch5:

begin
control_out <= 20'd18464;

end
fetch6:

begin
control_out <= 20'd2080;

end

ldr11:

begin
control_out <= 20'd36896;
end

ldr12:

begin
control_out <= 20'd32768;
end

ldr13:

begin
control_out <= 20'd33024;
end

ldr14:

begin
control_out <= 20'd33024;
end

ldr21:

begin
control_out <= 20'd36896;
end

ldr22:

begin
control_out <= 20'd32768;
end

ldr23:

begin
control_out <= 20'd33280;
end

ldr24:

begin
control_out <= 20'd33280;
end


stac1:

begin
control_out <= 20'd4128;
end

stac2:

begin
control_out <= 20'd65616;
end

stac3:

begin
control_out <= 20'd65616;
end

stac4:

begin
control_out <= 20'd65616;
end



add1:

begin
control_out <= 20'd1037;
end

add2:

begin
control_out <= 20'd1037;
end



mul1:

begin
control_out <= 20'd1038;
end

mul2:

begin
control_out <= 20'd1038;
end

endcase


endmodule 