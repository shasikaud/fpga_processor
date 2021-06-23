`timescale 1ns/1ps

module top_control_tb();

reg clock, start, start_2;
reg [8:0] addr_ext;
reg iram_write_ext;
reg [15:0] Data_in_ins;
wire [15:0] dram_out, pc_out, ar_out, dram_in, iram_in;

wire [1:0] read_en;
wire write_en; 
integer  data_file, scan_file;

// todo: remove for test 
wire[19:0] control_out;
wire [5:0] state ;
wire [15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;

top_control u_top_control(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in     ),
    .iram_in     ( iram_in     ),
    .dram_out    ( dram_out    ),
    .pc_out      ( pc_out      ),
    .ar_out      ( ar_out      ),
    .control_out ( control_out ),
    .state       ( state       ),
    .data_in_pc  ( data_in_pc  ),
    .alu_in_1    ( alu_in_1    ),
    .alu_in_2    ( alu_in_2    ),
    .alu_out     ( alu_out     ),
    .write_en    (write_en     ),
    .read_en     (read_en      ),
    .addr_ext    (addr_ext)     ,     
    .start_2        (start_2),
    .iram_write_ext(iram_write_ext),
    .Data_in_ins    (Data_in_ins)
);


/* 
Intialize the clock
*/
always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
    
initial begin
    #100;
    start <= 0;
    start_2 <= 0;
    #50;
    start_2 <= 1;
    #10;

    


    addr_ext <= 9'd1;
    Data_in_ins <= 16'd0;
    #20;
    iram_write_ext <= 1;
    #20;
    iram_write_ext <= 0;

    #10;
    addr_ext <= 9'd2;
    Data_in_ins <= 16'd1025;
    #20;
    iram_write_ext <= 1;
    #20;
    iram_write_ext <= 0;


    #10;
    addr_ext <= 9'd3;
    Data_in_ins <= 16'd2050;
    #20;
    iram_write_ext <= 1;
    #20;
    iram_write_ext <= 0;

    #10;
    addr_ext <= 9'd4;
    Data_in_ins <=  16'd5120;
    #20;
    iram_write_ext <= 1;
    #20;
    iram_write_ext <= 0;

    #10;
    addr_ext <= 9'd5;
    Data_in_ins <=  16'd3075;
    #20;
    iram_write_ext <= 1;
    #20;
    iram_write_ext <= 0;

    #100;

    start_2 <=0;
    start <=1;
    #1000;

    $stop;

end



endmodule