`timescale 1ns/1ps
module BUS_tb();
    reg clock;
    reg [3:0] control;
    reg [15:0] ar,pc,dr,ir, r,ac,dram, iram;
    wire [15:0] data_out, addr;

	
	BUS dut(ar,pc,ir,dr,r,ac,dram,iram, control, data_out, addr);
    
    always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
		
	initial begin

		
		 control        <= 4'd0;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd1;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd2;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd3;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd4;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd5;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd6;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;

        control        <= 4'd7;
		 ar             <= 16'd1;
		 pc             <= 16'd2; 
         dr             <= 16'd3; 
         ir             <= 16'd4; 
         r              <= 16'd5; 
         ac             <= 16'd6; 
         dram           <= 16'd7; 
         iram           <= 16'd8; 
		#50;
		
		
	end
	
endmodule