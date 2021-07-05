module register(clock, data_out, data_in, write_en);

	input clock, write_en;
	input [15:0] data_in;
	output reg[15:0] data_out;
	 
	always @(posedge clock)
	begin
	
	if(write_en == 1)
	begin
	data_out <= data_in;
	end

	end
	


endmodule 