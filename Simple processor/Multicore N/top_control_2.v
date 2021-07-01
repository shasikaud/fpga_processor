/*
*Dual core processor
*/
module top_control_2 (
    clock,
    start,
    addr_ext,
    start_2,
    iram_write_ext_1,
    iram_write_ext_2,
    Data_in_ins                                                              ,
    start_3,
    dram_write_ext,
    Data_in_dram,
    start_4,
    read_en_ext,
    dram_in_1
    );

    // inputs
    input clock, start, start_2, start_3, start_4;
    input iram_write_ext_1, iram_write_ext_2, dram_write_ext, read_en_ext;
    input [8:0] addr_ext;
    input [15:0] Data_in_ins, Data_in_dram;
	 
    //outputs
    output wire[15:0] dram_in_1;
    wire write_en_ins_1, write_en_ins_2;
    wire [1:0] read_en_1, read_en_2;
    wire [15:0] iram_in_1,dram_out_1,pc_out_1,dram_in_2, iram_in_2,pc_out_2,ar_out_1 ,dram_out_2, ar_out_2;


    //reg
    reg iram_write_1, iram_write_2;
    reg dram_write_en_1, dram_write_en_2;
    reg dram_read_en_1, dram_read_en_2;
    reg [8:0] iram_add_1, iram_add_2;
    reg [8:0] dram_addr_1, dram_addr_2;
    reg [15:0] dram_store_1, dram_store_2;
    
//instantiate the first core
core core_1(
    .clock       ( clock         ),
    .start       ( start         ),
    .dram_in     ( dram_in_1     ),   //dram to processor
    .iram_in     ( iram_in_1     ),
    .dram_out    ( dram_out_1    ),   //processor to dram
    .pc_out      ( pc_out_1      ),
    .ar_out      ( ar_out_1      ),
    .read_en     ( read_en_1     ),
    .write_en    ( write_en_1    )
);

//instantiate the second core
core core_2(
    .clock       ( clock         ),
    .start       ( start         ),
    .dram_in     ( dram_in_2     ),   //dram to processor
    .iram_in     ( iram_in_2     ),
    .dram_out    ( dram_out_2    ),   //processor to dram
    .pc_out      ( pc_out_2      ),
    .ar_out      ( ar_out_2      ),
    .read_en     ( read_en_2     ),
    .write_en    ( write_en_2    )
);

// iram for core 1
iram iram1(
    .clk      ( clock        ),
    .write_en ( iram_write_1 ),      
    .read_en  ( read_en_1[1] ),       
    .addr     ( iram_add_1   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_1    )          
);


// iram for core 2
iram iram2(
    .clk      ( clock        ),
    .write_en ( iram_write_2 ),          //or
    .read_en  ( read_en_2[1] ),          //internal
    .addr     ( iram_add_2   ),          //or
    .Data_in  ( Data_in_ins  ),          //external 
    .Data_out ( iram_in_2    )           //internal
);

// shared memory of the two cores
dualport_ram dram(
    .clk       ( clock           ),
    .write_en1 ( dram_write_en_1 ),
    .write_en2 ( dram_write_en_2 ),     
    .read_en1  ( dram_read_en_1  ),
    .read_en2  ( dram_read_en_2  ),     
    .addr1     ( dram_addr_1     ),
    .addr2     ( dram_addr_2     ),      
    .Data_in1  ( dram_store_1    ),     // core 1 data in
    .Data_in2  ( dram_store_2    ),     // core 2 data in
    .Data_out1 ( dram_in_1       ),     // core 1 data out
    .Data_out2 ( dram_in_2       )      // core 2 data out
);

always @(posedge clock) begin
    /*
    Store data to iram externaly
    */
    if (start_2 == 1)
    begin
        // ! for  iram
        iram_add_1   <= addr_ext;
        iram_add_2   <= addr_ext;
        iram_write_1 <= iram_write_ext_1;
        iram_write_2 <= iram_write_ext_2;
    end

    /*
    Store data to iram externaly
    */
    if (start_3 == 1)
    begin
        // ! for  dram
        dram_addr_1     <= addr_ext;
        dram_store_1    <= Data_in_dram;
        dram_write_en_1 <= dram_write_ext;
        dram_write_en_2 <= 0;
    end

    /*
    start processor
    */
    if (start == 1)
    begin
        // ! for  iram
        iram_add_1      <= pc_out_1[8:0];
        iram_add_2      <= pc_out_2[8:0];
        iram_write_1    <= write_en_ins_1;
        iram_write_2    <= write_en_ins_2;
        // ! for dram
        dram_store_1    <= dram_out_1;
        dram_store_2    <= dram_out_2;
        dram_addr_1     <= ar_out_1[8:0];
        dram_addr_2     <= ar_out_2[8:0];
        dram_write_en_1 <= write_en_1; 
        dram_write_en_2 <= write_en_2; 
        dram_read_en_1  <= read_en_1[0];
        dram_read_en_2  <= read_en_2[0];
    end

    /*
    Store the final output from the dram to a text file
    */
    if (start_4 == 1)
    begin
        dram_addr_1 <= addr_ext;
        dram_read_en_1 <= read_en_ext;

    end

end








endmodule //top_control