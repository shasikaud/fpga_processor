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
    data_in_ext: enable signal to store data externally data memory
outputs:    
    dram_in: 16-bit data to be written to data memory
    addr_out: address of the data memory
    mem_write: 
    data_out: for testbench display purpose 

*/

`timescale 1ns/1ps
module test_tb2();

reg clock, start, mem_write_ins, mem_write_data_ext;
reg [15:0] iram_in_ext,data_in_ext;
wire[15:0] addr_out, mem_write, dram_in, data_out; 
integer               data_file    ; // file handler
integer               scan_file    ; // file handler

// wire[5:0] state,ir_out;
 
top_layer u_top_layer(
    .clk                ( clock              ),
    .start              ( start              ),
    .dram_in            ( dram_in            ),
    .iram_in_ext        ( iram_in_ext        ),
    .data_out           ( data_out           ),
    .addr_out           ( addr_out           ),
    .mem_write_data_ext ( mem_write_data_ext ),
    .mem_write_ins      ( mem_write_ins      ),
    .read_en            ( read_en            ),
    .mem_write_data     ( mem_write_data     ),
    .data_out           ( data_out           ),
    .data_in_ext        ( data_in_ext        ),
    .iram_in            ( iram_in            )
);




reg [15:0] captured_data;
`define NULL 0 
 reg [15:0] data_;
    

always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end

// reg write_en, read_en;
// reg [8:0] data_address; 
// wire [15:0]q_sig;



initial begin
    start <=0;
    write_en <= 0;
    read_en <= 0;
    #10;
    data_address = 9'd1;
    data_file = $fopen("../../test_files/test1.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        write_en <= 1;
        read_en <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", captured_data); 
		#20;
        write_en <= 0;
        read_en <= 0;
		#10;
        data_address <= data_address + 1'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);

    #20;
	 data_address <= 9'd1;
	 #20;
    write_en <= 0;
    read_en <= 1;
	 
	 
    #20;
    data_address <= 9'd2;
    #20;
    write_en <= 0;
    read_en <= 1;
    #20;




    end

endmodule