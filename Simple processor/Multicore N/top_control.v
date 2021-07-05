/*
*Single core processor
*/
module top_control (
    clock,
    start,
    addr_ext,
    start_2,
    iram_write_ext,
    Data_in_ins                                                              ,
    start_3,
    dram_write_ext,
    Data_in_dram,
    start_4,
    read_en_ext,
    dram_in
    );

    // inputs
    input clock, start, start_2, start_4, start_3;
    input iram_write_ext, dram_write_ext, read_en_ext;
    input [8:0] addr_ext;
    input [15:0] Data_in_ins, Data_in_dram;

    //outputs
    output wire [15:0] dram_in;

    wire write_en;
    wire write_en_ins;
    wire [1:0] read_en;
    wire [5:0] state;
    wire [15:0] iram_in,dram_out,pc_out, ar_out;
    wire [15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;
    wire [19:0] control_out;
    
    //reg
    reg iram_write;
    reg dram_write_en;
    reg dram_read_en;
    reg [8:0] iram_add;
    reg [8:0] dram_addr;
    reg [15:0] dram_store;
    

//instantiate the core
core core_1(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in     ),   //dram to processor
    .iram_in     ( iram_in     ),
    .dram_out    ( dram_out    ),   //processor to dram
    .pc_out      ( pc_out      ),
    .ar_out      ( ar_out      ),
    .read_en     ( read_en     ),
    .write_en    ( write_en    )
);

// external or internal memory management
always @(posedge clock) begin
    /*
    Store data to iram externaly
    */
    if (start_2 == 1)
    begin
        // ! for  iram
        iram_add   <= addr_ext;
        iram_write <= iram_write_ext;
    end

    /*
    Store data to iram externaly
    */
    if (start_3 == 1)
    begin
        // ! for  dram
        dram_addr       <= addr_ext;
        dram_store      <= Data_in_dram;
        dram_write_en   <= dram_write_ext;
    end

    /*
    start processor
    */
    if (start == 1)
    begin
        // ! for  iram
        iram_add        <= pc_out[8:0];
        iram_write      <= write_en_ins;
        // ! for dram
        dram_store      <= dram_out;
        dram_addr       <= ar_out[8:0];
        dram_write_en   <= write_en; 
        dram_read_en    <= read_en[0];
    end

    /*
    Store the final output from the dram to a text file
    */
    if (start_4 == 1)
    begin
        dram_addr       <= addr_ext;
        dram_read_en    <= read_en_ext;

    end

end



iram iram(
    .clk      ( clock       ),
    .write_en ( iram_write  ),          //or
    .read_en  ( read_en[1]  ),          //internal
    .addr     ( iram_add    ),          //or
    .Data_in  ( Data_in_ins ),          //external 
    .Data_out ( iram_in     )           //internal
);


dram dram(
    .clk      ( clock           ),
    .write_en ( dram_write_en   ),      //or
    .read_en  ( dram_read_en    ),      //internal
    .addr     ( dram_addr       ),      //or
    .Data_in  ( dram_store      ),      //ot
    .Data_out ( dram_in         )       //internal
);

endmodule