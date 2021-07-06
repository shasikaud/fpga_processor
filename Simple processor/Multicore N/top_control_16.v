/*
*hexadeca core processor
*/
module top_control_16 (
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
    iram_write_ext_9,
    iram_write_ext_10,
    iram_write_ext_11,
    iram_write_ext_12,
    iram_write_ext_13,
    iram_write_ext_14,
    iram_write_ext_15,
    iram_write_ext_16,
    Data_in_ins,
    dram_write_ext,
    Data_in_dram,
    read_en_ext,
    dram_in_1
);

    // input
    input clock, start, start_2, start_3, start_4, dram_write_ext, read_en_ext; 
    input iram_write_ext_1, iram_write_ext_2, iram_write_ext_3, iram_write_ext_4, iram_write_ext_5, iram_write_ext_6, iram_write_ext_7, iram_write_ext_8,iram_write_ext_9, iram_write_ext_10, iram_write_ext_11, iram_write_ext_12, iram_write_ext_13, iram_write_ext_14, iram_write_ext_15, iram_write_ext_16; 
    input [8:0] addr_ext;
    input [15:0] Data_in_ins, Data_in_dram;
	 
    // output 
    output wire[15:0] dram_in_1;


    wire  write_en_ins_1, write_en_ins_2, write_en_ins_3, write_en_ins_4, write_en_ins_5, write_en_ins_6, write_en_ins_7, write_en_ins_8,write_en_ins_9,write_en_ins_10,write_en_ins_11,write_en_ins_12,write_en_ins_13,write_en_ins_14,write_en_ins_15,write_en_ins_16;
    wire [1:0] read_en_1, read_en_2, read_en_3, read_en_4, read_en_5, read_en_6, read_en_7, read_en_8,read_en_9,read_en_10,read_en_11,read_en_12,read_en_13,read_en_14,read_en_15,read_en_16;
    wire [15:0] dram_in_2,dram_in_3,dram_in_4,dram_in_5,dram_in_6,dram_in_7,dram_in_8,dram_in_9,dram_in_10,dram_in_11,dram_in_12,dram_in_13,dram_in_14,dram_in_15,dram_in_16;
    wire [15:0] pc_out_1,pc_out_2, pc_out_3, pc_out_4, pc_out_5, pc_out_6, pc_out_7, pc_out_8,pc_out_9,pc_out_10,pc_out_11,pc_out_12,pc_out_13,pc_out_14,pc_out_15,pc_out_16;
    wire [15:0] ar_out_1 , ar_out_2, ar_out_3, ar_out_4, ar_out_5 , ar_out_6, ar_out_7, ar_out_8, ar_out_9,ar_out_10,ar_out_11,ar_out_12,ar_out_13,ar_out_14,ar_out_15,ar_out_16;
    wire [15:0] iram_in_1, iram_in_2, iram_in_3, iram_in_4, iram_in_5, iram_in_6, iram_in_7, iram_in_8,iram_in_9,iram_in_10,iram_in_11,iram_in_12,iram_in_13,iram_in_14,iram_in_15,iram_in_16;
    wire [15:0] dram_out_1, dram_out_2, dram_out_3, dram_out_4, dram_out_5, dram_out_6, dram_out_7, dram_out_8,dram_out_9,dram_out_10,dram_out_11,dram_out_12,dram_out_13,dram_out_14,dram_out_15,dram_out_16;

    // reg
    reg dram_write_en_1, dram_write_en_2, dram_write_en_3, dram_write_en_4, dram_write_en_5, dram_write_en_6, dram_write_en_7, dram_write_en_8,dram_write_en_9,dram_write_en_10,dram_write_en_11,dram_write_en_12,dram_write_en_13,dram_write_en_14,dram_write_en_15,dram_write_en_16;
    reg dram_read_en_1, dram_read_en_2, dram_read_en_3, dram_read_en_4, dram_read_en_5, dram_read_en_6, dram_read_en_7, dram_read_en_8,dram_read_en_9,dram_read_en_10,dram_read_en_11,dram_read_en_12,dram_read_en_13,dram_read_en_14,dram_read_en_15,dram_read_en_16;
    reg iram_write_1, iram_write_2, iram_write_3, iram_write_4, iram_write_5, iram_write_6, iram_write_7, iram_write_8,iram_write_9,iram_write_10,iram_write_11,iram_write_12,iram_write_13,iram_write_14,iram_write_15,iram_write_16;
    reg [8:0] iram_add_1, iram_add_2, iram_add_3, iram_add_4, iram_add_5, iram_add_6, iram_add_7, iram_add_8,iram_add_9,iram_add_10,iram_add_11,iram_add_12,iram_add_13,iram_add_14,iram_add_15,iram_add_16;
    reg [8:0] dram_addr_1, dram_addr_2, dram_addr_3, dram_addr_4, dram_addr_5, dram_addr_6, dram_addr_7, dram_addr_8, dram_addr_9,dram_addr_10,dram_addr_11,dram_addr_12,dram_addr_13,dram_addr_14,dram_addr_15,dram_addr_16;
    reg [15:0] dram_store_1, dram_store_2, dram_store_3, dram_store_4, dram_store_5, dram_store_6, dram_store_7, dram_store_8,dram_store_9,dram_store_10,dram_store_11,dram_store_12,dram_store_13,dram_store_14,dram_store_15,dram_store_16;
    
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

//instantiate the fifth core
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

//instantiate the sixth core
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

//instantiate the seventh core
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

//instantiate the eight core
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

//instantiate the ninth core   
core core_9(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_9     ),   //dram to processor
    .iram_in     ( iram_in_9     ),
    .dram_out    ( dram_out_9    ),   //processor to dram
    .pc_out      ( pc_out_9      ),
    .ar_out      ( ar_out_9      ),
    .read_en     ( read_en_9    ),
    .write_en    ( write_en_9    )
);

//instantiate the tenth core   
core core_10(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_10     ),   //dram to processor
    .iram_in     ( iram_in_10     ),
    .dram_out    ( dram_out_10    ),   //processor to dram
    .pc_out      ( pc_out_10      ),
    .ar_out      ( ar_out_10      ),
    .read_en     ( read_en_10    ),
    .write_en    ( write_en_10    )
);

//instantiate the eleventh core   
core core_11(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_11     ),   //dram to processor
    .iram_in     ( iram_in_11     ),
    .dram_out    ( dram_out_11    ),   //processor to dram
    .pc_out      ( pc_out_11      ),
    .ar_out      ( ar_out_11      ),
    .read_en     ( read_en_11    ),
    .write_en    ( write_en_11    )
);

//instantiate the 12th core   
core core_12(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_12     ),   //dram to processor
    .iram_in     ( iram_in_12     ),
    .dram_out    ( dram_out_12    ),   //processor to dram
    .pc_out      ( pc_out_12      ),
    .ar_out      ( ar_out_12      ),
    .read_en     ( read_en_12    ),
    .write_en    ( write_en_12    )
);

//instantiate the 13th core   
core core_13(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_13     ),   //dram to processor
    .iram_in     ( iram_in_13     ),
    .dram_out    ( dram_out_13    ),   //processor to dram
    .pc_out      ( pc_out_13      ),
    .ar_out      ( ar_out_13      ),
    .read_en     ( read_en_13    ),
    .write_en    ( write_en_13    )
);

//instantiate the 14th core   
core core_14(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_14     ),   //dram to processor
    .iram_in     ( iram_in_14     ),
    .dram_out    ( dram_out_14    ),   //processor to dram
    .pc_out      ( pc_out_14      ),
    .ar_out      ( ar_out_14      ),
    .read_en     ( read_en_14    ),
    .write_en    ( write_en_14    )
);

//instantiate the 15th core   
core core_15(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_15     ),   //dram to processor
    .iram_in     ( iram_in_15     ),
    .dram_out    ( dram_out_15    ),   //processor to dram
    .pc_out      ( pc_out_15      ),
    .ar_out      ( ar_out_15      ),
    .read_en     ( read_en_15    ),
    .write_en    ( write_en_15    )
);

//instantiate the 16th core   
core core_16(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in_16     ),   //dram to processor
    .iram_in     ( iram_in_16     ),
    .dram_out    ( dram_out_16    ),   //processor to dram
    .pc_out      ( pc_out_16      ),
    .ar_out      ( ar_out_16      ),
    .read_en     ( read_en_16    ),
    .write_en    ( write_en_16    )
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


// iram for core 5
iram iram5(
    .clk      ( clock        ),
    .write_en ( iram_write_5 ),      
    .read_en  ( read_en_5[1] ),       
    .addr     ( iram_add_5   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_5    )          
);


// iram for core 6
iram iram6(
    .clk      ( clock        ),
    .write_en ( iram_write_6 ),         //or
    .read_en  ( read_en_6[1] ),          //internal
    .addr     ( iram_add_6   ),      //or
    .Data_in  ( Data_in_ins  ),         //external 
    .Data_out ( iram_in_6    )               //internal
);

// iram for core 7
iram iram7(
    .clk      ( clock        ),
    .write_en ( iram_write_7 ),         //or
    .read_en  ( read_en_7[1] ),          //internal
    .addr     ( iram_add_7   ),      //or
    .Data_in  ( Data_in_ins  ),         //external 
    .Data_out ( iram_in_7    )               //internal
);


// iram for core 8
iram iram8(
    .clk      ( clock        ),
    .write_en ( iram_write_8 ),      
    .read_en  ( read_en_8[1] ),       
    .addr     ( iram_add_8   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_8    )          
);

// iram for core 9
iram iram9(
    .clk      ( clock        ),
    .write_en ( iram_write_9 ),      
    .read_en  ( read_en_10[1] ),       
    .addr     ( iram_add_9   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_9    )          
);

// iram for core 10
iram iram10(
    .clk      ( clock        ),
    .write_en ( iram_write_10 ),      
    .read_en  ( read_en_10[1] ),       
    .addr     ( iram_add_10   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_10    )          
);

// iram for core 11
iram iram11(
    .clk      ( clock        ),
    .write_en ( iram_write_11 ),      
    .read_en  ( read_en_11[1] ),       
    .addr     ( iram_add_11   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_11    )          
);

// iram for core 12
iram iram12(
    .clk      ( clock        ),
    .write_en ( iram_write_12 ),      
    .read_en  ( read_en_12[1] ),       
    .addr     ( iram_add_12   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_12    )          
);

// iram for core 13
iram iram13(
    .clk      ( clock        ),
    .write_en ( iram_write_13 ),      
    .read_en  ( read_en_13[1] ),       
    .addr     ( iram_add_13   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_13    )          
);

// iram for core 14
iram iram14(
    .clk      ( clock        ),
    .write_en ( iram_write_14 ),      
    .read_en  ( read_en_14[1] ),       
    .addr     ( iram_add_14   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_14    )          
);

// iram for core 15
iram iram15(
    .clk      ( clock        ),
    .write_en ( iram_write_15 ),      
    .read_en  ( read_en_15[1] ),       
    .addr     ( iram_add_15   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_15    )          
);

// iram for core 16
iram iram16(
    .clk      ( clock        ),
    .write_en ( iram_write_16 ),      
    .read_en  ( read_en_16[1] ),       
    .addr     ( iram_add_16   ),   
    .Data_in  ( Data_in_ins  ),       
    .Data_out ( iram_in_16    )          
);

// shared memory of the 8 cores
hexadecaport_ram dram(
    .clk        ( clock           ),
    // !write_en
    .write_en1   ( dram_write_en_1  ),
    .write_en2   ( dram_write_en_2  ),
    .write_en3   ( dram_write_en_3  ),
    .write_en4   ( dram_write_en_4  ),
    .write_en5   ( dram_write_en_5  ),
    .write_en6   ( dram_write_en_6  ),
    .write_en7   ( dram_write_en_7  ),
    .write_en8   ( dram_write_en_8  ),
    .write_en9   ( dram_write_en_9  ),
    .write_en10  ( dram_write_en_10 ),
    .write_en11  ( dram_write_en_11 ),
    .write_en12  ( dram_write_en_12 ),
    .write_en13  ( dram_write_en_13 ),
    .write_en14  ( dram_write_en_14 ),
    .write_en15  ( dram_write_en_15 ),
    .write_en16  ( dram_write_en_16 ), 

    // ! read_en     
    .read_en1   ( dram_read_en_1  ),
    .read_en2   ( dram_read_en_2  ),
    .read_en3   ( dram_read_en_3  ),
    .read_en4   ( dram_read_en_4  ),
    .read_en5   ( dram_read_en_5  ),
    .read_en6   ( dram_read_en_6  ),
    .read_en7   ( dram_read_en_7  ),
    .read_en8   ( dram_read_en_8  ),
    .read_en9   ( dram_read_en_9  ),
    .read_en10  ( dram_read_en_10 ),
    .read_en11  ( dram_read_en_11 ),
    .read_en12  ( dram_read_en_12 ),
    .read_en13  ( dram_read_en_13 ),
    .read_en14  ( dram_read_en_14 ),
    .read_en15  ( dram_read_en_15 ),
    .read_en16  ( dram_read_en_16 ),

    // ! addr         
    .addr1     ( dram_addr_1   ),
    .addr2     ( dram_addr_2   ), 
    .addr3     ( dram_addr_3   ),
    .addr4     ( dram_addr_4   ),
    .addr5     ( dram_addr_5   ),
    .addr6     ( dram_addr_6   ), 
    .addr7     ( dram_addr_7   ),
    .addr8     ( dram_addr_8   ),
    .addr9     ( dram_addr_9   ),
    .addr10    ( dram_addr_10  ),
    .addr11    ( dram_addr_11  ),
    .addr12    ( dram_addr_12  ),
    .addr13    ( dram_addr_13  ),
    .addr14    ( dram_addr_14  ),
    .addr15    ( dram_addr_15  ),
    .addr16    ( dram_addr_16  ), 
    // ! Data_in
    .Data_in1   ( dram_store_1  ),       // core 1 data in
    .Data_in2   ( dram_store_2  ),       // core 2 data in
    .Data_in3   ( dram_store_3  ),       // core 3 data in
    .Data_in4   ( dram_store_4  ),       // core 4 data in
    .Data_in5   ( dram_store_5  ),       // core 5 data in
    .Data_in6   ( dram_store_6  ),       // core 6 data in
    .Data_in7   ( dram_store_7  ),       // core 7 data in
    .Data_in8   ( dram_store_8  ),       // core 8 data in
    .Data_in9   ( dram_store_9  ),       // core 9 data in
    .Data_in10  ( dram_store_10 ),       // core 10 data in
    .Data_in11  ( dram_store_11 ),       // core 11 data in
    .Data_in12  ( dram_store_12 ),       // core 12 data in
    .Data_in13  ( dram_store_13 ),       // core 13 data in
    .Data_in14  ( dram_store_14 ),       // core 14 data in
    .Data_in15  ( dram_store_15 ),       // core 15 data in
    .Data_in16  ( dram_store_16 ),       // core 16 data in
    // ! Data_out
    .Data_out1   ( dram_in_1     ),       // core 1 data out
    .Data_out2   ( dram_in_2     ),       // core 2 data out
    .Data_out3   ( dram_in_3     ),       // core 3 data out
    .Data_out4   ( dram_in_4     ),       // core 4 data out
    .Data_out5   ( dram_in_5     ),       // core 5 data out
    .Data_out6   ( dram_in_6     ),       // core 6 data out
    .Data_out7   ( dram_in_7     ),       // core 7 data out
    .Data_out8   ( dram_in_8     ),        // core 8 data out
    .Data_out9   ( dram_in_9     ),       // core 9 data out
    .Data_out10  ( dram_in_10    ),       // core 10 data out
    .Data_out11  ( dram_in_11    ),       // core 11 data out
    .Data_out12  ( dram_in_12    ),       // core 12 data out
    .Data_out13  ( dram_in_13    ),       // core 13 data out
    .Data_out14  ( dram_in_14    ),       // core 14 data out
    .Data_out15  ( dram_in_15    ),       // core 15 data out
    .Data_out16  ( dram_in_16    )       // core 16 data out
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
        iram_add_9   <= addr_ext;
        iram_add_10   <= addr_ext;
        iram_add_11   <= addr_ext;
        iram_add_12   <= addr_ext;
        iram_add_13   <= addr_ext;
        iram_add_14   <= addr_ext;
        iram_add_15   <= addr_ext;
        iram_add_16   <= addr_ext;


        iram_write_1 <= iram_write_ext_1;
        iram_write_2 <= iram_write_ext_2;
        iram_write_3 <= iram_write_ext_3;
        iram_write_4 <= iram_write_ext_4;
        iram_write_5 <= iram_write_ext_5;
        iram_write_6 <= iram_write_ext_6;
        iram_write_7 <= iram_write_ext_7;
        iram_write_8 <= iram_write_ext_8;
        iram_write_9 <= iram_write_ext_9;
        iram_write_10 <= iram_write_ext_10;
        iram_write_11 <= iram_write_ext_11;
        iram_write_12 <= iram_write_ext_12;
        iram_write_13 <= iram_write_ext_13;
        iram_write_14 <= iram_write_ext_14;
        iram_write_15 <= iram_write_ext_15;
        iram_write_16 <= iram_write_ext_16;
        
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
        dram_write_en_9 <= 0;
        dram_write_en_10 <= 0;
        dram_write_en_11 <= 0;
        dram_write_en_12 <= 0;
        dram_write_en_13 <= 0;
        dram_write_en_14 <= 0;
        dram_write_en_15 <= 0;
        dram_write_en_16 <= 0;

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
        iram_add_9  <= pc_out_9[8:0];
        iram_add_10 <= pc_out_10[8:0];
        iram_add_11 <= pc_out_11[8:0];
        iram_add_12 <= pc_out_12[8:0];
        iram_add_13 <= pc_out_13[8:0];
        iram_add_14 <= pc_out_14[8:0];
        iram_add_15 <= pc_out_15[8:0];
        iram_add_16 <= pc_out_16[8:0];

        iram_write_1 <= write_en_ins_1;
        iram_write_2 <= write_en_ins_2;
        iram_write_3 <= write_en_ins_3;
        iram_write_4 <= write_en_ins_4;
        iram_write_5 <= write_en_ins_5;
        iram_write_6 <= write_en_ins_6;
        iram_write_7 <= write_en_ins_7;
        iram_write_8 <= write_en_ins_8;
        iram_write_9 <= write_en_ins_9;
        iram_write_10 <= write_en_ins_10;
        iram_write_11 <= write_en_ins_11;
        iram_write_12 <= write_en_ins_12;
        iram_write_13 <= write_en_ins_13;
        iram_write_14 <= write_en_ins_14;
        iram_write_15 <= write_en_ins_15;
        iram_write_16 <= write_en_ins_16;
        
        // ! for dram
        dram_store_1 <= dram_out_1;
        dram_store_2 <= dram_out_2;
        dram_store_3 <= dram_out_3;
        dram_store_4 <= dram_out_4;
        dram_store_5 <= dram_out_5;
        dram_store_6 <= dram_out_6;
        dram_store_7 <= dram_out_7;
        dram_store_8 <= dram_out_8;
        dram_store_9 <= dram_out_9;
        dram_store_10 <= dram_out_10;
        dram_store_11 <= dram_out_11;
        dram_store_12 <= dram_out_12;
        dram_store_13 <= dram_out_13;
        dram_store_14 <= dram_out_14;
        dram_store_15 <= dram_out_15;
        dram_store_16 <= dram_out_16;

        dram_addr_1 <= ar_out_1[8:0];
        dram_addr_2 <= ar_out_2[8:0];
        dram_addr_3 <= ar_out_3[8:0];
        dram_addr_4 <= ar_out_4[8:0];
        dram_addr_5 <= ar_out_5[8:0];
        dram_addr_6 <= ar_out_6[8:0];
        dram_addr_7 <= ar_out_7[8:0];
        dram_addr_8 <= ar_out_8[8:0];
        dram_addr_9 <= ar_out_9[8:0];
        dram_addr_10 <= ar_out_10[8:0];
        dram_addr_11 <= ar_out_11[8:0];
        dram_addr_12 <= ar_out_12[8:0];
        dram_addr_13 <= ar_out_13[8:0];
        dram_addr_14 <= ar_out_14[8:0];
        dram_addr_15 <= ar_out_15[8:0];
        dram_addr_16 <= ar_out_16[8:0];

        dram_write_en_1 <= write_en_1; 
        dram_write_en_2 <= write_en_2; 
        dram_write_en_3 <= write_en_3; 
        dram_write_en_4 <= write_en_4;
        dram_write_en_5 <= write_en_5; 
        dram_write_en_6 <= write_en_6; 
        dram_write_en_7 <= write_en_7; 
        dram_write_en_8 <= write_en_8;
        dram_write_en_9 <= write_en_9;
        dram_write_en_10 <= write_en_10;
        dram_write_en_11 <= write_en_11;
        dram_write_en_12 <= write_en_12;
        dram_write_en_13 <= write_en_13;
        dram_write_en_14 <= write_en_14;
        dram_write_en_15 <= write_en_15;
        dram_write_en_16 <= write_en_16; 

        dram_read_en_1 <= read_en_1[0];
        dram_read_en_2 <= read_en_2[0];
        dram_read_en_3 <= read_en_3[0];
        dram_read_en_4 <= read_en_4[0];
        dram_read_en_5 <= read_en_5[0];
        dram_read_en_6 <= read_en_6[0];
        dram_read_en_7 <= read_en_7[0];
        dram_read_en_8 <= read_en_8[0];
        dram_read_en_9 <= read_en_9[0];
        dram_read_en_10 <= read_en_10[0];
        dram_read_en_11 <= read_en_11[0];
        dram_read_en_12 <= read_en_12[0];
        dram_read_en_13 <= read_en_13[0];
        dram_read_en_14 <= read_en_14[0];
        dram_read_en_15 <= read_en_15[0];
        dram_read_en_16 <= read_en_16[0];
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