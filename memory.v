module memory(clock, addr, data_in, data_out, mem_read, mem_write);

input clock;
input mem_read;
input mem_write;
input [15:0] addr;
input [15:0] data_in;

output reg [15:0] data_out;

//stack
//reg [15:0] stack_1 [0:655535];

always @(mem_read or mem_write)
begin

if(mem_read == 1)

//data_out <= stack_1[15:0][addr];


if(mem_write == 1)

//stack_1[15:0][addr] <= data_in;
end
end
endmodule  