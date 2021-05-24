`timescale 1ns/1ps
module ac_tb();
	reg clock, data_in, write_en, data_in_alu,alu_out;
	wire data_out;
	
	AC dut(clock,write_en, data_in, alu_out, data_in_alu, data_out);
	
	always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
		
	initial begin

		
		assign write_en    = 0;
		assign data_in     = 0;
		assign data_in_alu = 0; 
		assign alu_out	   = 0;
		#50;
		
		assign write_en    = 1;
		assign data_in     = 0;
		assign data_in_alu = 0; 
		assign alu_out	   = 0;
		#50;
		
		assign write_en    = 1;
		assign data_in     = 1;
		assign data_in_alu = 0;
		assign alu_out	   = 0;	
		#50;
		
		
		assign write_en    = 0;
		assign data_in     = 1;
		assign data_in_alu = 1;
		assign alu_out	   = 0;	
		#50;
		
		assign write_en    = 0;
		assign data_in     = 0;
		assign data_in_alu = 1;
		assign alu_out	   = 1;
		#50;
		
		assign write_en    = 0;
		assign data_in     = 0;
		assign data_in_alu = 0;
		assign alu_out	   = 1;
		#50;
	end
	
endmodule