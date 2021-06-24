module ALU(clock, control, ac_in, bus_in, data_out);

input clock;
input[1:0] control;
input[15:0] ac_in;
input[15:0] bus_in;

output reg [15:0] data_out;




always @(posedge clock)

begin


//data_out <= ac_in + bus_in;
//data_out = ac_in*bus_in ;
case(control)

2'd1: data_out = ac_in + bus_in;
2'd2: data_out = ac_in*bus_in ;

endcase


end


endmodule