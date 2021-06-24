//test bench module for Program counter
`timescale 1ns/1ps
module PC_tb();
    reg clock;
    reg write_en;
    reg inc;
    reg[15:0] data_in;
    wire[15:0] data_out;

    PC dut(clock, write_en, inc, data_in, data_out);

    always
            begin
                #5 clock = 1;
                #5 clock = 0;
            end

    initial begin
        data_in      <=16'd2;
        inc          <= 0;
        write_en     <= 1;
		#50;

        write_en     <= 0; 
        inc          <= 1;
		#50;

        write_en     <= 0;
        inc          <= 1;
		#50;

        data_in      <=16'd8; 
        write_en     <= 0;
        inc          <= 1;
		#50;

        write_en     <= 1; 
        inc          <= 0;
		#50;
    end
	//$stop;
endmodule