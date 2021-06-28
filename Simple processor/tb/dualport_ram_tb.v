`timescale 1ps/1ps
module dualportRam_tb();
    reg clk,write_en1,write_en2,read_en1,read_en2;
    reg[8:0] addr1,addr2;
    reg[15:0] Data_in1,Data_in2;
    wire[15:0] Data_out1,Data_out2;
dualport_ram dut(
    .clk(clk),
    .write_en1(write_en1),
    .write_en2(write_en2),
    .read_en1(read_en1),
    .read_en2(read_en2),
    .addr1(addr1),
    .addr2(addr2),
    .Data_in1(Data_in1),
    .Data_in2(Data_in2),
    .Data_out1(Data_out1),
    .Data_out2(Data_out2)
);
always
		begin
			#5 clk = 1;
			#5 clk = 0;
		end

initial begin
    write_en1<=1;
    addr1<= 9'd1;
    Data_in1<=16'd1;
    read_en1<=1;
    //---//
    write_en2<=1;
    addr2<= 9'd4;
    Data_in2<=16'd7;
    read_en2<=1;
    read_en1<=0;
    read_en2<=0;

    #20
    write_en1<=1;
    addr1<= 9'd2;
    Data_in1<=16'd4;
    //---//
    write_en2<=1;
    addr2<= 9'd5;
    Data_in2<=16'd9;

    #20
    write_en1<=1;
    addr1<= 9'd3;
    Data_in1<=16'd8;
    read_en1<=1;
    //--//
    write_en2<=1;
    addr2<= 9'd6;
    Data_in2<=16'd10;
    read_en2<=1;
end
endmodule