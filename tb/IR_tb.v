//test bench module for Instruction register
`timescale 1ns/1ps
module IR_tb();
    reg clock;
    reg[15:0] data_in;
    reg write_en;
    wire[15:0] data_out;

    IR dut(clock,write_en, data_in, data_out);

    always 
        begin
             #5 clock = 1;
             #5 clock = 0;
        end
    
    initial begin
        data_in      <=16'd1;
        write_en     <= 1;
		#50;

        data_in      <=16'd2;
        write_en     <= 0;
		#50;

        data_in      <=16'd3;
        write_en     <= 0;
		#50;

        data_in      <=16'd4;
        write_en     <= 1;
		#50;
    end
endmodule