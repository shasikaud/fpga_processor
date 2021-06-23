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
    read_en,
    addr_ext,
    start_2,
    iram_write_ext,
    Data_in_ins,

);

    input clock,start, start_2,iram_write_ext;
    input [8:0] addr_ext;
    input [15:0] Data_in_ins;

    output wire [15:0] dram_in, iram_in,dram_out,pc_out, ar_out;
//    output wire [15:0] ;
    output wire  [1:0] read_en;
    output wire  write_en;
    output wire [19:0]control_out;
    output wire[5:0] state;
    output wire[15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;
    wire  write_en_ins;
   
    reg [8:0]iram_add;
    reg iram_write;

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

always @(posedge clock) begin
    /*
    Store data to memory externaly
    */
    if (start_2 == 1)
    begin
        // ! for  iram
        iram_add   <= addr_ext;
        iram_write <= iram_write_ext;


    end
    /*
    start processor
    */
    if (start == 1)
    begin
        // ! for  iram
        iram_add <= pc_out[8:0];
        iram_write <= write_en_ins;

        // ! for dram

    end
end



iram iram(
    .clk      ( clock      ),
    .write_en ( iram_write ),         //or
    .read_en  ( read_en[1]  ),          //internal
    .addr     (  iram_add    ),      //or
    .Data_in  ( Data_in_ins  ),         //external 
    .Data_out ( iram_in )               //internal
);

// rom_vlog_mif#(
//     .ADDR_WIDTH ( 9 ),
//     .DATA_WIDTH ( 16 )
// )u_rom_vlog_mif(
//     .clk_i      ( clock      ),
//     .read_en    ( read_en[0] ),
//     .write_en   ( write_en   ),
//     .data       ( dram_out   ),
//     .addr_i     ( ar_out[8:0] ),
//     .data_o     ( dram_in    )
// );


dram dram(
    .clk      ( clock       ),
    .write_en ( write_en    ),
    .read_en  ( read_en[0]  ),
    .addr     ( ar_out[8:0] ),
    .Data_in  ( dram_out    ),
    .Data_out ( dram_in     )
);







endmodule //top_control