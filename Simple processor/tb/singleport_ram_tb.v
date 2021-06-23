`timescale 1ns/1ps
module singleport_ram_tb();
    reg clk,write_en,read_en;
    reg[8:0] addr;
    reg[15:0] Data_in;
    wire[15:0] Data_out;
    singleport_ram dut (clk,write_en,read_en,addr,Data_in,Data_out);  
    always
            begin
			#5 clk = 1;
			#5 clk = 0;
		end

initial begin

    addr<= 9'd1;
    Data_in<=16'd1;
    #20;
    write_en<=1;
    read_en <=0;

    #20;
    write_en<=0;

    #20;
    addr<= 9'd2;
    Data_in<=16'd4;
    #20;
    write_en<=1;

    #20;
    write_en <=0;
    
    #20;
    read_en<=1;
    #40;
    addr<= 9'd1;
    Data_in<=16'd8;

    #20;
    read_en <= 0;

    #20;
    
    read_en<=1;
    #40;
    addr<= 9'd2;
    Data_in<=16'd8;

    #40;
    $finish;
end

endmodule