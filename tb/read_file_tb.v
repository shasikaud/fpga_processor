`timescale 1ns/1ps
module read_file_tb();
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
initial begin
    data_file = $fopen("../../test_files/test1.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    end

    always @(posedge clock) begin
    scan_file = $fscanf(data_file, "%d\n", captured_data); 
    if (!$feof(data_file)) begin
        data_ <= captured_data;
         $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    end

/*
read the value from the file
store the

*/
endmodule