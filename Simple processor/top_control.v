module top_control (
    clock,
    start,
    dram_in,
    iram_in,
    dram_out,
    pc_out,
    ar_out,
    read_en,
    write_en,
    control_out,
    state,
    data_in_pc,
    alu_in_1,
    alu_in_2,
    alu_out,
    instruc_mem_store,
    read_en_ir,
    write_en_ir,
    data_mem_store,
    write_en_d,
);

    input clock,start;
    output wire [15:0] dram_in, iram_in,dram_out,pc_out, ar_out;
//    output wire [15:0] ;
    input [1:0] read_en;
    input write_en;
    output wire [19:0]control_out;
    output wire[5:0] state;
    output wire[15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;
    input [15:0] instruc_mem_store,data_mem_store;
    input read_en_ir,write_en_ir, write_en_d;


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




memory_ip iram(
    .address ( pc_out               ),
    .clock   ( clock                ),
    .data    ( instruc_mem_store    ),
    .rden    ( read_en_ir           ),
    .wren    ( write_en_ir          ),
    .q       ( iram_in              )
);

memory_ip dram(
    .address ( address ),
    .clock   ( clock   ),
    .data    ( data_mem_store    ),
    .rden    ( read_en_d    ),
    .wren    ( write_en_d    ),
    .q       ( dram_in )
);





endmodule //top_control