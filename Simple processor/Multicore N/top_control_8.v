module top_control_8 (
    clock,
    start,
    addr_ext,
    start_2,
    start_3,
    start_4,
    iram_write_ext_1,
    iram_write_ext_2,
    iram_write_ext_3,
    iram_write_ext_4,
    iram_write_ext_5,
    iram_write_ext_6,
    iram_write_ext_7,
    iram_write_ext_8,
    Data_in_ins,
    dram_write_ext,
    Data_in_dram,
    read_en_ext,
    dram_in_1
);

    input clock, start, start_2, start_3, start_4, dram_write_ext, read_en_ext; 
    input iram_write_ext_1, iram_write_ext_2, iram_write_ext_3, iram_write_ext_4, iram_write_ext_5, iram_write_ext_6, iram_write_ext_7, iram_write_ext_8; 
    input [8:0] addr_ext;
    input [15:0] Data_in_ins, Data_in_dram;
	 
     
    output wire[15:0] dram_in_1;

    wire [15:0] dram_in_2,dram_in_3,dram_in_4,dram_in_5,dram_in_6,dram_in_7,dram_in_8;
    wire [15:0] pc_out_1,pc_out_2, pc_out_3, pc_out_4, pc_out_5, pc_out_6, pc_out_7, pc_out_8;
    wire [15:0] ar_out_1 , ar_out_2, ar_out_3, ar_out_4, ar_out_5 , ar_out_6, ar_out_7, ar_out_8;
    wire [15:0] iram_in_1, iram_in_2, iram_in_3, iram_in_4, iram_in_5, iram_in_6, iram_in_7, iram_in_8;
    wire [15:0] dram_out_1, dram_out_2, dram_out_3, dram_out_4, dram_out_5, dram_out_6, dram_out_7, dram_out_8;

    wire [1:0] read_en_1, read_en_2, read_en_3, read_en_4, read_en_5, read_en_6, read_en_7, read_en_8;
    wire  write_en_ins_1, write_en_ins_2, write_en_ins_3, write_en_ins_4, write_en_ins_5, write_en_ins_6, write_en_ins_7, write_en_ins_8;
   
    reg [8:0] iram_add_1, iram_add_2, iram_add_3, iram_add_4, iram_add_5, iram_add_6, iram_add_7, iram_add_8;
    reg iram_write_1, iram_write_2, iram_write_3, iram_write_4, iram_write_5, iram_write_6, iram_write_7, iram_write_8;
    reg [8:0] dram_addr_1, dram_addr_2, dram_addr_3, dram_addr_4, dram_addr_5, dram_addr_6, dram_addr_7, dram_addr_8;
    reg [15:0] dram_store_1, dram_store_2, dram_store_3, dram_store_4, dram_store_5, dram_store_6, dram_store_7, dram_store_8;
    reg dram_write_en_1, dram_write_en_2, dram_write_en_3, dram_write_en_4, dram_write_en_5, dram_write_en_6, dram_write_en_7, dram_write_en_8;
    reg dram_read_en_1, dram_read_en_2, dram_read_en_3, dram_read_en_4, dram_read_en_5, dram_read_en_6, dram_read_en_7, dram_read_en_8;


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


core core_5(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_5     ),   //dram to processor
    .iram_in     ( iram_in_5     ),
    .dram_out    ( dram_out_5    ),   //processor to dram
    .pc_out      ( pc_out_5      ),
    .ar_out      ( ar_out_5      ),
    .read_en     ( read_en_5    ),
    .write_en    ( write_en_5    )
);

core core_6(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_6     ),   //dram to processor
    .iram_in     ( iram_in_6     ),
    .dram_out    ( dram_out_6    ),   //processor to dram
    .pc_out      ( pc_out_6      ),
    .ar_out      ( ar_out_6      ),
    .read_en     ( read_en_6     ),
    .write_en    ( write_en_6    )
);

core core_7(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_7     ),   //dram to processor
    .iram_in     ( iram_in_7     ),
    .dram_out    ( dram_out_7   ),   //processor to dram
    .pc_out      ( pc_out_7      ),
    .ar_out      ( ar_out_7      ),
    .read_en     ( read_en_7     ),
    .write_en    ( write_en_7    )
);

core core_8(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_8     ),   //dram to processor
    .iram_in     ( iram_in_8     ),
    .dram_out    ( dram_out_8    ),   //processor to dram
    .pc_out      ( pc_out_8      ),
    .ar_out      ( ar_out_8      ),
    .read_en     ( read_en_8     ),
    .write_en    ( write_en_8    )
);


// iram for core 1
iram iram1(
    .clk      ( clock      ),
    .write_en ( iram_write_1 ),      
    .read_en  ( read_en_1[1] ),       
    .addr     ( iram_add_1   ),   
    .Data_in  ( Data_in_ins ),       
    .Data_out ( iram_in_1    )          
);


// iram for core 2
iram iram2(
    .clk      ( clock      ),
    .write_en ( iram_write_2 ),         //or
    .read_en  ( read_en_2[1] ),          //internal
    .addr     ( iram_add_2   ),      //or
    .Data_in  ( Data_in_ins ),         //external 
    .Data_out ( iram_in_2    )               //internal
);

// iram for core 3
iram iram3(
    .clk      ( clock      ),
    .write_en ( iram_write_3 ),         //or
    .read_en  ( read_en_3[1] ),          //internal
    .addr     ( iram_add_3   ),      //or
    .Data_in  ( Data_in_ins ),         //external 
    .Data_out ( iram_in_3    )               //internal
);


// iram for core 4
iram iram4(
    .clk      ( clock      ),
    .write_en ( iram_write_4 ),      
    .read_en  ( read_en_4[1] ),       
    .addr     ( iram_add_4   ),   
    .Data_in  ( Data_in_ins ),       
    .Data_out ( iram_in_4    )          
);


// iram for core 5
iram iram5(
    .clk      ( clock      ),
    .write_en ( iram_write_5 ),      
    .read_en  ( read_en_5[1] ),       
    .addr     ( iram_add_5   ),   
    .Data_in  ( Data_in_ins ),       
    .Data_out ( iram_in_5    )          
);


// iram for core 6
iram iram6(
    .clk      ( clock      ),
    .write_en ( iram_write_6 ),         //or
    .read_en  ( read_en_6[1] ),          //internal
    .addr     ( iram_add_6   ),      //or
    .Data_in  ( Data_in_ins ),         //external 
    .Data_out ( iram_in_6    )               //internal
);

// iram for core 7
iram iram7(
    .clk      ( clock      ),
    .write_en ( iram_write_7 ),         //or
    .read_en  ( read_en_7[1] ),          //internal
    .addr     ( iram_add_7   ),      //or
    .Data_in  ( Data_in_ins ),         //external 
    .Data_out ( iram_in_7    )               //internal
);


// iram for core 8
iram iram8(
    .clk      ( clock      ),
    .write_en ( iram_write_8 ),      
    .read_en  ( read_en_8[1] ),       
    .addr     ( iram_add_8   ),   
    .Data_in  ( Data_in_ins ),       
    .Data_out ( iram_in_8    )          
);


octaport_ram dram(
    .clk        ( clock       ),
    // !write_en
    .write_en1  ( dram_write_en_1 ),
    .write_en2  ( dram_write_en_2 ),
    .write_en3  ( dram_write_en_3 ),
    .write_en4  ( dram_write_en_4 ),
    .write_en5  ( dram_write_en_5 ),
    .write_en6  ( dram_write_en_6 ),
    .write_en7  ( dram_write_en_7 ),
    .write_en8  ( dram_write_en_8 ), 
    // ! read_en     
    .read_en1   ( dram_read_en_1 ),
    .read_en2   (dram_read_en_2 ),
    .read_en3   ( dram_read_en_3 ),
    .read_en4   (dram_read_en_4 ),
    .read_en5   ( dram_read_en_5 ),
    .read_en6   (dram_read_en_6 ),
    .read_en7   ( dram_read_en_7 ),
    .read_en8   (dram_read_en_8 ), 
    // ! addr         
    .addr1     ( dram_addr_1   ),
    .addr2     ( dram_addr_2   ), 
    .addr3     ( dram_addr_3   ),
    .addr4     ( dram_addr_4   ),
    .addr5     ( dram_addr_5   ),
    .addr6     ( dram_addr_6   ), 
    .addr7     ( dram_addr_7   ),
    .addr8     ( dram_addr_8   ), 
    // ! Data_in
    .Data_in1  ( dram_store_1  ),       // core 1 data in
    .Data_in2  ( dram_store_2  ),       // core 2 data in
    .Data_in3  ( dram_store_3  ),       // core 3 data in
    .Data_in4  ( dram_store_4  ),       // core 4 data in
    .Data_in5  ( dram_store_5  ),       // core 5 data in
    .Data_in6  ( dram_store_6  ),       // core 6 data in
    .Data_in7  ( dram_store_7  ),       // core 7 data in
    .Data_in8  ( dram_store_8  ),       // core 8 data in
    // ! Data_out
    .Data_out1 ( dram_in_1     ),       // core 1 data out
    .Data_out2 ( dram_in_2     ),       // core 2 data out
    .Data_out3 ( dram_in_3     ),       // core 3 data out
    .Data_out4 ( dram_in_4     ),       // core 4 data out
    .Data_out5 ( dram_in_5     ),       // core 5 data out
    .Data_out6 ( dram_in_6     ),       // core 6 data out
    .Data_out7 ( dram_in_7     ),       // core 7 data out
    .Data_out8 ( dram_in_8     )        // core 8 data out
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
        iram_add_5   <= addr_ext;
        iram_add_6   <= addr_ext;
        iram_add_7   <= addr_ext;
        iram_add_8   <= addr_ext;


        iram_write_1 <= iram_write_ext_1;
        iram_write_2 <= iram_write_ext_2;
        iram_write_3 <= iram_write_ext_3;
        iram_write_4 <= iram_write_ext_4;
        iram_write_5 <= iram_write_ext_5;
        iram_write_6 <= iram_write_ext_6;
        iram_write_7 <= iram_write_ext_7;
        iram_write_8 <= iram_write_ext_8;
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
        dram_write_en_5 <= 0;
        dram_write_en_6 <= 0;
        dram_write_en_7 <= 0;
        dram_write_en_8 <= 0;
    end

    /*
    start processor
    */
    if (start == 1)
    begin
        // ! for  iram
        iram_add_1  <= pc_out_1[8:0];
        iram_add_2  <= pc_out_2[8:0];
        iram_add_3  <= pc_out_3[8:0];
        iram_add_4  <= pc_out_4[8:0];
        iram_add_5  <= pc_out_5[8:0];
        iram_add_6  <= pc_out_6[8:0];
        iram_add_7  <= pc_out_7[8:0];
        iram_add_8  <= pc_out_8[8:0];

        iram_write_1 <= write_en_ins_1;
        iram_write_2 <= write_en_ins_2;
        iram_write_3 <= write_en_ins_3;
        iram_write_4 <= write_en_ins_4;
        iram_write_5 <= write_en_ins_5;
        iram_write_6 <= write_en_ins_6;
        iram_write_7 <= write_en_ins_7;
        iram_write_8 <= write_en_ins_8;
        
        // ! for dram
        dram_store_1 <= dram_out_1;
        dram_store_2 <= dram_out_2;
        dram_store_3 <= dram_out_3;
        dram_store_4 <= dram_out_4;
        dram_store_5 <= dram_out_5;
        dram_store_6 <= dram_out_6;
        dram_store_7 <= dram_out_7;
        dram_store_8 <= dram_out_8;

        dram_addr_1 <= ar_out_1[8:0];
        dram_addr_2 <= ar_out_2[8:0];
        dram_addr_3 <= ar_out_3[8:0];
        dram_addr_4 <= ar_out_4[8:0];
        dram_addr_5 <= ar_out_5[8:0];
        dram_addr_6 <= ar_out_6[8:0];
        dram_addr_7 <= ar_out_7[8:0];
        dram_addr_8 <= ar_out_8[8:0];

        dram_write_en_1 <= write_en_1; 
        dram_write_en_2 <= write_en_2; 
        dram_write_en_3 <= write_en_3; 
        dram_write_en_4 <= write_en_4;
        dram_write_en_5 <= write_en_5; 
        dram_write_en_6 <= write_en_6; 
        dram_write_en_7 <= write_en_7; 
        dram_write_en_8 <= write_en_8; 

        dram_read_en_1 <= read_en_1[0];
        dram_read_en_2 <= read_en_2[0];
        dram_read_en_3 <= read_en_3[0];
        dram_read_en_4 <= read_en_4[0];
        dram_read_en_5 <= read_en_5[0];
        dram_read_en_6 <= read_en_6[0];
        dram_read_en_7 <= read_en_7[0];
        dram_read_en_8 <= read_en_8[0];
    end

    if (start_4 == 1)
    begin
        dram_addr_1 <= addr_ext;
        dram_read_en_1 <= read_en_ext;

    end

end








endmodule //top_control