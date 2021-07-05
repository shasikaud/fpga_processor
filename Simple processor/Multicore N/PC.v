module PC(clock, data_out, data_in, write_en, inc);

	input clock, write_en,inc;
	input [15:0] data_in;
	output reg[15:0] data_out;
	
	
	initial begin
	data_out <= 16'd1;
	end
	 
	always @(posedge clock)
	begin
	
	if(write_en == 1)
	data_out <= data_in;


	
	if(inc == 1)
	data_out <= data_out + 16'd1;

end

endmodule 