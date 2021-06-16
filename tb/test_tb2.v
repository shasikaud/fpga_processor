/*
Read file ok
* store to data_memory
store to ir_memory
BUGS:
	timing delays when writing data to memory modules (overwriting data)
	find the delay for data to latch into the data bus
*/

/*
inputs:
    mem_write_ins: write enable of instruction memory
    mem_write_data_ext: write enable for external data write (testbench)
    iram_in_ext: enable signal to store instructions externally iram
    data_in_ext: contains external data to be written into the data memory

outputs:    
    dram_in: 16-bit data to be written to data memory
    addr_ext: address of the data memory
    mem_write: 
    data_out: for testbench display purpose 
    read_en: not required (testbench check)
    iram_in: output of the instruciton memory && input to the processor
*/

`timescale 1ns/1ps
module test_tb2();

reg clock, start, mem_write_ins, mem_write_data_ext;
reg [15:0] iram_in_ext,data_in_ext;
reg[15:0] addr_ext, mem_write; 
reg[1:0]  read_en;

wire[15:0] iram_in, dram_in, data_out, addr_out;
wire[8:0] addr_ins;
wire [5:0] state;
integer               data_file    ; // file handler
integer               scan_file    ; // file handler

// wire[5:0] state,ir_out;
 
top_layer u_top_layer(
    .clk                ( clock              ),     // clock
    .start              ( start              ),     // start the processor
    .dram_in            ( dram_in            ),     // output of the data memory
    .iram_in_ext        ( iram_in_ext        ),     // to store data into iram
    .data_out           ( data_out           ),     // to store data into dram
    .addr_ext           ( addr_ext           ),     // location of the dram or iram
    .mem_write_data_ext ( mem_write_data_ext ),     // dram write enable
    .mem_write_ins      ( mem_write_ins      ),     // iram write enable
    .read_en_ext        ( read_en            ),     // read enable
    .data_in_ext        ( data_in_ext        ),     // to store data into dram
    .iram_in            ( iram_in            ),     // read istructions from iram
    .addr_ins           (addr_ins            ),
    .addr_out           (addr_out            ),
    .state              (state               )
);




// // reg [15:0] captured_data;
`define NULL 0 
//  reg [15:0] data_;
    

always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end

// reg write_en, read_en;
// reg [8:0] data_address; 
// wire [15:0]q_sig;



initial begin
    // write data to data memory 
    //////////////////////////////////////////////////////////////////
    start <=0;
    mem_write_ins <= 0;
    mem_write_data_ext <= 0;
    
    #10;
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/test1.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        mem_write_data_ext <= 1;
        read_en <= 2'b00;
        #10;
        scan_file = $fscanf(data_file, "%d\n", data_in_ext); 
		#20;
        mem_write_data_ext <= 0;
        read_en <= 2'b10;
		#10;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);


    
    mem_write_data_ext <= 0;
    #10;
    // write instruction to the instruction memory
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/instruction.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end

     while(!$feof(data_file)) begin
        @(posedge clock);          
        #20;
        mem_write_ins <= 1;
        read_en <= 2'b00;
        #10;
        scan_file = $fscanf(data_file, "%d\n", iram_in_ext); 
		#30;
        // mem_write_ins <= 0;
        // read_en <= 2'b01;
		// #30;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);
    mem_write_ins <= 0;

    #100;
    start <= 1;
    

    #80;
    start <= 0;

    #20;
    start <= 1;
    

    #40;
    start <= 0;
    // #150;
    // read_en <= 2'b00;

    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd1;

    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd2;

    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd3;


    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd4;

    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd5;


    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd6;


    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd7;

    // #50;
    // mem_write_ins <= 0;
    // read_en <= 2'b01;
    // addr_ext <= 9'd8;
    
    // todo: add and mul 
    // #20;
	//  data_address <= 9'd1;
	//  #20;
    // write_en <= 0;
    // read_en <= 1;
	 
	 
    // #20;
    // data_address <= 9'd2;
    // #20;
    // write_en <= 0;
    // read_en <= 1;
    // #20;



    $stop;

    end

endmodule