/*
Read file ok
store to memory
BUGS:
	timing delays when writing data to memory modules (overwriting data)
	find the delay for data to latch into the data bus
*/


`timescale 1ns/1ps
module test1_tb();

reg clock;
integer               data_file    ; // file handler
integer               scan_file    ; // file handler
reg [15:0] captured_data;
`define NULL 0 
 reg [15:0] data_;
    

always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end

reg write_en, read_en;
reg [8:0] data_address; 
wire [15:0]q_sig;

memory_ip memory_ip_inst
(
	.address(data_address) ,	// input [8:0] address_sig
	.clock(clock) ,	// input  clock_sig
	.data(captured_data) ,	// input [15:0] data_sig
	.rden(read_en) ,	// input  rden_sig
	.wren(write_en) ,	// input  wren_sig
	.q(q_sig) 	// output [15:0] q_sig
);


initial begin
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