module top_control (
    clock,
    start,
    dram_in,
    iram_in,
    dram_out,
    pc_out,
    ar_out,
    control_out,
    state,
    data_in_pc,
    alu_in_1,
    alu_in_2,
    alu_out,
    write_en,
    read_en
);

    input clock,start;
    output wire [15:0] dram_in, iram_in,dram_out,pc_out, ar_out;
//    output wire [15:0] ;
    output wire  [1:0] read_en;
    output wire  write_en;
    output wire [19:0]control_out;
    output wire[5:0] state;
    output wire[15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;
    wire write_en_ins;
    wire [15:0] Data_in_ins;

core core_1(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in     ),
    .iram_in     ( iram_in     ),
    .dram_out    ( dram_out    ),
    .pc_out      ( pc_out      ),
    .ar_out      ( ar_out      ),
    .read_en     ( read_en     ),
    .write_en    ( write_en    ),
    .control_out ( control_out ),
    .state       ( state       ),
    .data_in_pc  ( data_in_pc  ),
    .alu_in_1    ( alu_in_1    ),
    .alu_in_2    ( alu_in_2    ),
    .alu_out     ( alu_out     )
);


iram iram(
    .clk      ( clock      ),
    .write_en ( write_en_ins ),
    .read_en  ( read_en[1]  ),
    .addr     ( pc_out[8:0]     ),
    .Data_in  ( Data_in_ins  ),
    .Data_out ( iram_in )
);


dram dram(
    .clk      ( clock      ),
    .write_en ( write_en ),
    .read_en  ( read_en[0]  ),
    .addr     ( ar_out[8:0]     ),
    .Data_in  ( dram_out  ),
    .Data_out ( dram_in )
);







endmodule //top_control