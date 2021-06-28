`timescale 1ps/1ps
module quadportRam_tb();
    reg clk,write_en1,write_en2,write_en3,write_en4;
    reg read_en1,read_en2,read_en3,read_en4;
    reg[8:0] addr1,addr2,addr3,addr4;
    reg[15:0] Data_in1,Data_in2,Data_in3,Data_in4;
    wire[15:0] Data_out1,Data_out2,Data_out3,Data_out4;
quadport_ram dut(
    .clk(clk),
    .write_en1(write_en1),
    .write_en2(write_en2),
    .write_en3(write_en3),
    .write_en4(write_en4),
    .read_en1(read_en1),
    .read_en2(read_en2),
    .read_en3(read_en3),
    .read_en4(read_en4),
    .addr1(addr1),
    .addr2(addr2),
    .addr3(addr3),
    .addr4(addr4),
    .Data_in1(Data_in1),
    .Data_in2(Data_in2),
    .Data_in3(Data_in3),
    .Data_in4(Data_in4),
    .Data_out1(Data_out1),
    .Data_out2(Data_out2),
    .Data_out3(Data_out3),
    .Data_out4(Data_out4)
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
    //--//
    write_en3<=1;
    addr3<= 9'd7;
    Data_in3<=16'd15;
    read_en3<=1;
    //--//
    write_en4<=1;
    addr4<= 9'd10;
    Data_in4<=16'd70;
    read_en4<=1;
    //--//
    read_en1<=0;
    read_en2<=0;
    read_en3<=0;
    read_en4<=0;
    
    #20
    write_en1<=1;
    addr1<= 9'd2;
    Data_in1<=16'd4;
    //---//
    write_en2<=1;
    addr2<= 9'd5;
    Data_in2<=16'd9;
    //--//
    write_en3<=1;
    addr3<= 9'd8;
    Data_in3<=16'd35;
    //--//
    write_en4<=1;
    addr4<= 9'd11;
    Data_in4<=16'd50;

    #20
    write_en1<=1;
    addr1<= 9'd3;
    Data_in1<=16'd8;
    read_en1<=1;
    //--//
    write_en2<=1;
    addr2<= 9'd6;
    Data_in2<=16'd10;
    //--//
    write_en3<=1;
    addr3<= 9'd9;
    Data_in3<=16'd65;
    read_en3<=1;
    //--//
    write_en4<=1;
    addr4<= 9'd12;
    Data_in4<=16'd30;
    read_en4<=1;
end