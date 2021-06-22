`timescale 1ps/1ps

module core_tb();

reg clock, start;
reg [15:0] dram_in, iram_in; 

// ?dram_in: data_memory output
// ?iram_in: instruction memory output

wire [15:0] dram_out, pc_out, ar_out;
wire[1:0] read_en;
wire write_en; 

// todo: remove for test 
wire[19:0] control_out;
wire [5:0] state ;
wire [15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;

core core_dut(
    .clock    ( clock    ),
    .start    ( start    ),
    .dram_in  ( dram_in  ),
    .iram_in  ( iram_in  ),
    .dram_out ( dram_out ),
    .pc_out   ( pc_out   ),
    .ar_out   ( ar_out   ),
    .read_en  ( read_en  ),
    .write_en ( write_en ),
    .control_out(control_out),
    .state (state),
    .data_in_pc(data_in_pc),
    .alu_in_1(alu_in_1),
    .alu_in_2(alu_in_2),
    .alu_out(alu_out)
);



parameter period = 10;

always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end

initial begin
    #period;
    start <= 0;
    iram_in <= 0;
    dram_in <= 0;

    #period;
    start <= 1;
    iram_in <= 0;
    dram_in <= 0;

    // !load r1
    #50;
    start <= 1;
    iram_in <= 1025;
    dram_in <= 3;

    

   

    // !load r2

    #100
    start<=1;
    iram_in <= 2050;
    dram_in <= 2;

    // // !add
    // #50;
    // start <= 1;
    // iram_in <= 4096;
    // // dram_in <= 0;

    // !mul
    #100
    start <= 1;
    iram_in <= 4096;
    // dram_in <= 0;


    
    // !store

    #300
    start <= 1;
    iram_in <= 3072;

    #500;

    $stop;

end


endmodule