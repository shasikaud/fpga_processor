module AC(clock,write_en, data_in, alu_out, data_in_alu, data_out);

input clock;
input[15:0] data_in;
input alu_out;
input [15:0] data_in_alu;
input write_en;
output reg[15:0] data_out;


always @(posedge clock)
begin

if(write_en == 1)

data_out <= data_in ;


if(alu_out == 1)

data_out <= data_in_alu;

end
endmodule  