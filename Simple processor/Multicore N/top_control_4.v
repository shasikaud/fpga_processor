/*
*Quad core processor
*/
module top_control_4 (
    clock,
    start,
    addr_ext,
    start_2,
    iram_write_ext_1,
    iram_write_ext_2,
    iram_write_ext_3,
    iram_write_ext_4,
    Data_in_ins                                                              ,
    start_3,
    dram_write_ext,
    Data_in_dram,
    start_4,
    read_en_ext,
    dram_in_1
);

    //inputs
    input clock, start, start_2, start_3, start_4, dram_write_ext, read_en_ext; 
    input iram_write_ext_1, iram_write_ext_2, iram_write_ext_3, iram_write_ext_4; 
    input [8:0] addr_ext;
    input [15:0] Data_in_ins, Data_in_dram;
	 
     
    output wire[15:0] dram_in_1;

    wire  write_en_ins_1, write_en_ins_2, write_en_ins_3, write_en_ins_4;
    wire [1:0] read_en_1, read_en_2, read_en_3, read_en_4;
    wire [15:0] dram_in_2,dram_in_3,dram_in_4;
    wire [15:0] pc_out_1,pc_out_2, pc_out_3, pc_out_4;
    wire [15:0] ar_out_1 , ar_out_2, ar_out_3, ar_out_4;
    wire [15:0] iram_in_1, iram_in_2, iram_in_3, iram_in_4;
    wire [15:0] dram_out_1, dram_out_2, dram_out_3, dram_out_4;

    
    reg iram_write_1, iram_write_2, iram_write_3, iram_write_4;
    reg dram_write_en_1, dram_write_en_2, dram_write_en_3, dram_write_en_4;
    reg dram_read_en_1, dram_read_en_2, dram_read_en_3, dram_read_en_4;
    reg [8:0] iram_add_1, iram_add_2, iram_add_3, iram_add_4;
    reg [8:0] dram_addr_1, dram_addr_2, dram_addr_3, dram_addr_4;
    reg [15:0] dram_store_1, dram_store_2, dram_store_3, dram_store_4;
    

//instantiate the first core 
core core_1(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_1     ),   //dram to processor
    .iram_in     ( iram_in_1     ),
    .dram_out    ( dram_out_1    ),   //processor to dram
    .pc_out      ( pc_out_1      ),
    .ar_out      ( ar_out_1      ),
    .read_en     ( read_en_1    ),
    .write_en    ( write_en_1    )
);

//instantiate the second core 
core core_2(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_2     ),   //dram to processor
    .iram_in     ( iram_in_2     ),
    .dram_out    ( dram_out_2    ),   //processor to dram
    .pc_out      ( pc_out_2      ),
    .ar_out      ( ar_out_2      ),
    .read_en     ( read_en_2     ),
    .write_en    ( write_en_2    )
);

//instantiate the third core 
core core_3(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_3     ),   //dram to processor
    .iram_in     ( iram_in_3     ),
    .dram_out    ( dram_out_3   ),   //processor to dram
    .pc_out      ( pc_out_3      ),
    .ar_out      ( ar_out_3      ),
    .read_en     ( read_en_3     ),
    .write_en    ( write_en_3    )
);

//instantiate the fourth core 
core core_4(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_4     ),   //dram to processor
    .iram_in     ( iram_in_4     ),
    .dram_out    ( dram_out_4    ),   //processor to dram
    .pc_out      ( pc_out_4      ),
    .ar_out      ( ar_out_4      ),
    .read_en     ( read_en_4     ),
    .write_en    ( write_en_4    )
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
    .write_en ( iram_write_2 ),         //or
    .read_en  ( read_en_2[1] ),          //internal
    .addr     ( iram_add_2   ),      //or
    .Data_in  ( Data_in_ins  ),         //external 
    .Data_out ( iram_in_2    )               //internal
);

// iram for core 3
iram iram3(
    .clk      ( clock        ),
    .write_en ( iram_write_3 ),         //or
    .read_en  ( read_en_3[1] ),          //internal
    .addr     ( iram_add_3   ),      //or
    .Data_in  ( Data_in_ins  ),         //external 
    .Data_out ( iram_in_3    )               //internal
);


// iram for core 4
iram iram4(
    .clk      ( clock        ),
    .write_en ( iram_write_4 ),      
    .read_en  ( read_en_4[1] ),       
    .addr     ( iram_add_4   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_4    )          
);


// shared memory of the 4 cores
quadport_ram dram(
    .clk        ( clock           ),
    .write_en1  ( dram_write_en_1 ),
    .write_en2  ( dram_write_en_2 ),
    .write_en3  ( dram_write_en_3 ),
    .write_en4  ( dram_write_en_4 ),      
    .read_en1   ( dram_read_en_1  ),
    .read_en2   ( dram_read_en_2  ),
    .read_en3   ( dram_read_en_3  ),
    .read_en4   ( dram_read_en_4  ),         
    .addr1      ( dram_addr_1     ),
    .addr2      ( dram_addr_2     ), 
    .addr3      ( dram_addr_3     ),
    .addr4      ( dram_addr_4     ), 
    .Data_in1   ( dram_store_1    ),   // core 1 data in
    .Data_in2   ( dram_store_2    ),  // core 2 data in
    .Data_in3   ( dram_store_3    ),   // core 1 data in
    .Data_in4   ( dram_store_4    ),
    .Data_out1  ( dram_in_1       ),    // core 1 data out
    .Data_out2  ( dram_in_2       ),      // core 2 data out
    .Data_out3  ( dram_in_3       ),    // core 1 data out
    .Data_out4  ( dram_in_4       )      // core 2 data out
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
        iram_add_3   <= addr_ext;
        iram_add_4   <= addr_ext;

        iram_write_1 <= iram_write_ext_1;
        iram_write_2 <= iram_write_ext_2;
        iram_write_3 <= iram_write_ext_3;
        iram_write_4 <= iram_write_ext_4;
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
        dram_write_en_3 <= 0;
        dram_write_en_4 <= 0;
    end

    /*
    start processor
    */
    if (start == 1)
    begin
        // ! for  iram
        iram_add_1      <= pc_out_1[8:0];
        iram_add_2      <= pc_out_2[8:0];
        iram_add_3      <= pc_out_3[8:0];
        iram_add_4      <= pc_out_4[8:0];

        iram_write_1    <= write_en_ins_1;
        iram_write_2    <= write_en_ins_2;
        iram_write_3    <= write_en_ins_3;
        iram_write_4    <= write_en_ins_4;
        
        // ! for dram
        dram_store_1    <= dram_out_1;
        dram_store_2    <= dram_out_2;
        dram_store_3    <= dram_out_3;
        dram_store_4    <= dram_out_4;

        dram_addr_1     <= ar_out_1[8:0];
        dram_addr_2     <= ar_out_2[8:0];
        dram_addr_3     <= ar_out_3[8:0];
        dram_addr_4     <= ar_out_4[8:0];

        dram_write_en_1 <= write_en_1; 
        dram_write_en_2 <= write_en_2; 
        dram_write_en_3 <= write_en_3; 
        dram_write_en_4 <= write_en_4; 

        dram_read_en_1  <= read_en_1[0];
        dram_read_en_2  <= read_en_2[0];
        dram_read_en_3  <= read_en_3[0];
        dram_read_en_4  <= read_en_4[0];
    end

    if (start_4 == 1)
    begin
        dram_addr_1     <= addr_ext;
        dram_read_en_1  <= read_en_ext;
    end
end








endmodule //top_control