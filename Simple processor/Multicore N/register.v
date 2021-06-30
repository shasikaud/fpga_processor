module register(clock, data_out, data_in, read_en, write_en);

	input clock,read_en, write_en;
	input [15:0] data_in;
	output reg[15:0] data_out;
	
	reg[15:0] data_store;
	

	 
	always @(posedge clock)
	begin
	
	if(write_en == 1)
	begin
	data_out <= data_in;
	end
	
//	if(read_en == 1)
//	begin
//		data_out <= data_store;
//	end

	end
	


endmodule 