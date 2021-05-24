`timescale 1ns/1ps
module ac_tb();
	reg clock;
	reg write_en;
	reg alu_out;
	reg [15:0] data_in; 
	reg[15:0] data_in_alu;
	wire [15:0]data_out;
	
	AC dut(clock,write_en, data_in, alu_out, data_in_alu, data_out);
	
	always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
		
	initial begin

		
		 write_en    <= 0;
		 data_in     <= 16'd10;
		 data_in_alu <= 16'd0; 
		 alu_out	    <= 0;
		#50;
		
		 write_en    <= 1;
		 data_in     <= 16'd10;
		 data_in_alu <= 16'd15; 
		 alu_out	   <= 0;
		#50;
		
		 write_en    <= 0;
		 data_in     <= 16'd12;
		 data_in_alu <= 16'd15;
		 alu_out	   <= 0;	
		#50;
		
		
		 write_en    <= 0;
		 data_in     <= 16'd1;
		 data_in_alu <= 16'd15;
		 alu_out	   <= 1;	
		#50;
		
		 write_en    <= 0;
		 data_in     <= 0;
		 data_in_alu <= 16'd15;
		 alu_out	   <= 1;
		#50;
		
		 write_en    <= 0;
		 data_in     <= 16'd20;
		 data_in_alu <= 16'd12;
		 alu_out	   <= 0;
		#50;
	end
	
endmodule