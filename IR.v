module IR(clock,write_en, data_in, data_out);

input clock;
input[15:0] data_in;
input write_en;
output reg[15:0] data_out;

always @(posedge clock)
begin

if(write_en == 1)

data_out <= data_in ;

end

endmodule  
