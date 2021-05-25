`timescale 1ns/1ps
module memory_ip_tb();
    reg [8:0] address_sig;
    reg clock_sig;
    reg [15:0] data_sig;
    reg rden_sig, wren_sig;
    wire [15:0] q_sig;

    // rden_sig <= 0;
    // wren_sig <= 0;
    // address_sig <= 9'd0;
    // clock_sig <= 0;
    // q_sig <= 16'd0;
    // data_sig <= 16'd0;


memory_ip memory_ip_inst
(
	.address(address_sig) ,	// input [8:0] address_sig
	.clock(clock_sig) ,	// input  clock_sig
	.data(data_sig) ,	// input [15:0] data_sig
	.rden(rden_sig) ,	// input  rden_sig
	.wren(wren_sig) ,	// input  wren_sig
	.q(q_sig) 	// output [15:0] q_sig
);

always
		begin
			#5 clock_sig = 1;
			#5 clock_sig = 0;
		end
		
	initial begin

        address_sig <= 9'd1;
        data_sig <= 16'd64;
        #10;
        wren_sig <= 1;
        rden_sig <= 0;
        #10;
        wren_sig <= 0;
        rden_sig <= 0;
        #10;
        address_sig <= 9'd2;
        data_sig <= 16'd65;
        #10;
        wren_sig <= 1;
        rden_sig <= 0;
        #10;
        wren_sig <= 0;
        rden_sig <= 0;
        #20;
        address_sig <= 9'd1;
        #10;
        wren_sig <= 0;
        rden_sig <= 1;
        #10;
        wren_sig <= 0;
        rden_sig <= 0;
        #20;
        address_sig <= 9'd2;
        #10;
        wren_sig <= 0;
        rden_sig <= 1;
        #10;
        wren_sig <= 0;
        rden_sig <= 0;
        #20;
    end
endmodule
        
