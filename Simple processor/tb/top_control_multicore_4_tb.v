`timescale 1ns/1ps

module top_control_multicore_4_tb();

reg clock, start, start_2, start_3, start_4;
reg [8:0] addr_ext;
reg iram_write_ext1, iram_write_ext2, iram_write_ext3, iram_write_ext4;  //write enable to iram externally
reg dram_write_ext;  //write enable to dram externally
reg read_en_ext;  //read enable dram externally
reg [15:0] Data_in_ins;   //instruction to be writtern externally to iram
reg [15:0] Data_in_dram;   //data to be writtern externally to dram


integer  data_file, data_file2, scan_file, param_file;
reg[8:0] final_start, final_end;

wire[15:0]  dram_in;


// todo: remove for test 

`define NULL 0


top_control_4 u_top_control(
    .clock       ( clock       ),
    .start       ( start       ),
    .addr_ext    ( addr_ext    ),     
    .start_2     ( start_2     ),
    .start_3     ( start_3     ),
    .start_4     ( start_4     ),
    .Data_in_ins ( Data_in_ins ),
    .dram_write_ext (dram_write_ext),
    .Data_in_dram ( Data_in_dram),
    .read_en_ext ( read_en_ext ),
    .dram_in_1       (dram_in),
    .iram_write_ext_1(iram_write_ext1),
    .iram_write_ext_2(iram_write_ext2),
    .iram_write_ext_3(iram_write_ext3),
    .iram_write_ext_4(iram_write_ext4)
    );


/* 
Intialize the clock
*/
always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
    
initial begin
    #100;
    start <= 0;
    start_2 <= 0;
    start_3 <= 0;
    start_4 <= 0;
    #50;
    start_2 <= 1;
    #10;


    // ! store iram values core 1
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/instructions_core_1.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", Data_in_ins); 
		#20;
        iram_write_ext1 <= 1;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #40;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #40;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);
    #20


        // ! store iram values - core 2
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/instructions_core_2.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", Data_in_ins); 
		#20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 1;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #40;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #40;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);
    #20


        // ! store iram values - core 3
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/instructions_core_3.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", Data_in_ins); 
		#20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 1;
        iram_write_ext4 <= 0;
        #40;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #40;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);
    #20


        // ! store iram values - core 4
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/instructions_core_4.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", Data_in_ins); 
		#20;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 1;
        #40;
        iram_write_ext1 <= 0;
        iram_write_ext2 <= 0;
        iram_write_ext3 <= 0;
        iram_write_ext4 <= 0;
        #40;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);
    #20



    param_file = $fopen("../../test_files/final_addresess.txt", "r");
    if (param_file == `NULL) begin
        $display("param_file handle was NULL");
        $finish;
    end

    scan_file = $fscanf(param_file, "%d\n", final_start); 
    scan_file = $fscanf(param_file, "%d\n", final_end); 

    $fclose(param_file);


    #20
    iram_write_ext1 <= 0;
    iram_write_ext2 <= 0;
    iram_write_ext3 <= 0;
    iram_write_ext4 <= 0;
    #10;

    start_2 <= 0;
    start_3 <= 1;

    #20

    // ! store dram values
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/data.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        dram_write_ext <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", Data_in_dram); 
		#20;
        dram_write_ext <= 1;
		#40;
        dram_write_ext <= 0;
        #40;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #20;
    $fclose(data_file);
    dram_write_ext <=0;
    #10;

    start_2 <= 0;
    start_3 <= 0;
    #10;

    //START PROCESSOR
    start <= 1;
    #1200000;

    start <= 0;
    #10;

    // read final matrix vaues from dram   
    addr_ext = final_start;   //for this test case
    data_file = $fopen("../../test_files/final_matrix.txt", "w");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    
    start_4 <= 1;
    #20;

    while(addr_ext < final_end) begin
        @(posedge clock);
        #20;
        read_en_ext <= 1;
        #50;
        $fwrite(data_file, "%d\n", dram_in); 
		#50;
        read_en_ext <= 0;
        #40;
        addr_ext <= addr_ext + 9'd1;
    
    end
    #20;
    $fclose(data_file);
    start_4 <= 0;
    iram_write_ext1 <= 0;
    iram_write_ext2 <= 0;
    iram_write_ext3 <= 0;
    iram_write_ext4 <= 0;

    #10;


    $stop;

end



endmodule