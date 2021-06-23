`timescale 1ns/1ps

module top_control_tb();

reg clock, start;

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
    .read_en     (read_en      )
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
    start <= 0;
    #50;

    start <=1;
    #1000;

    $finish;

end



endmodule