module PC(clock, write_en, inc, data_in, data_out);

input clock;
input inc;   //this is the control signal
input[15:0] data_in;
input write_en;
output reg[15:0] data_out;

initial 
    begin
        data_out <= 16'd1;
    end
always @(posedge clock)
begin

if(write_en == 1)

data_out <= data_in ;// why is data in needed


if (inc == 1)

data_out <= data_out + 16'd1;

end

endmodule  
