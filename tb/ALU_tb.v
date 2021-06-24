//test bench module for ALU
`timescale 1ns/1ps
module ALU_tb();
	reg clock;
    reg [1:0] control;
    reg [15:0] ac_in;
    reg [15:0] bus_in;

    wire [15:0] data_out;

	
	ALU dut(clock, control, ac_in, bus_in, data_out);
	always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
		
	initial begin

		
		control      <= 2'd1;
		ac_in        <= 16'd0;
		bus_in       <= 16'd0; 
		#50;
		
		control     <= 2'd1;
		ac_in       <= 16'd1;
		bus_in       <= 16'd1; 
		#50;
		
		control     <= 2'd1;
		ac_in       <= 16'd2;
		bus_in      <= 16'd6; 
		#50;
		
		
		control      <= 2'd1;
		ac_in        <= 16'd5;
		bus_in       <= 16'd4; 
		#50;

        control      <= 2'd2;
		ac_in        <= 16'd0;
		bus_in       <= 16'd0; 
		#50;
		
		control      <= 2'd2;
		ac_in        <= 16'd1;
		bus_in       <= 16'd1; 
		#50;
		
		control      <= 2'd2;
		ac_in        <= 16'd2;
		bus_in       <= 16'd6; 
		#50;
		
		
		 control     <= 2'd2;
		 ac_in        <= 16'd5;
		 bus_in       <= 16'd4; 
		#50;
		
	end
	
endmodule