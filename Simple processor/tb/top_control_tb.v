`timescale 1ns/1ps

module top_control_tb();

reg clock, start;
reg [15:0] dram_in, iram_in; 
reg [15:0] data_mem_store, instruc_mem_store;
reg read_en_ir, read_en_d, write_en_ir, write_en_d;
reg [8:0] addr_ext;
// ?dram_in: data_memory output
// ?iram_in: instruction memory output

wire [15:0] dram_out, pc_out, ar_out;
reg [1:0] read_en;
reg write_en; 
integer  data_file, scan_file;

// todo: remove for test 
wire[19:0] control_out;
wire [5:0] state ;
wire [15:0] data_in_pc,alu_in_1,alu_in_2, alu_out;

`define NULL 0

core core_dut(
    .clock       ( clock       ),
    .start       ( start       ),
    .dram_in     ( dram_in     ),
    .iram_in     ( iram_in     ),
    .dram_out    ( dram_out    ),
    .pc_out      ( pc_out      ),
    .ar_out      ( ar_out      ),
    .read_en     ( read_en     ),
    .write_en    ( write_en    ),
    .control_out ( control_out ),
    .state       ( state       ),
    .data_in_pc  ( data_in_pc  ),
    .alu_in_1    ( alu_in_1    ),
    .alu_in_2    ( alu_in_2    ),
    .alu_out     ( alu_out     )
);


memory_ip iram(
    .address ( pc_out               ),
    .clock   ( clock                ),
    .data    ( instruc_mem_store    ),
    .rden    ( read_en_ir           ),
    .wren    ( write_en_ir          ),
    .q       ( iram_in              )
);

memory_ip dram(
    .address ( ar_out           ),
    .clock   ( clock            ),
    .data    ( data_mem_store   ),
    .rden    ( read_en_d        ),
    .wren    ( write_en_d       ),
    .q       ( dram_in          )
);

/*
* Intialize the clock
*/
always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end




initial begin
    // @posedge(clock);
    read_en[0] = control_out[15]; //data memory read_en
end

initial begin
    // @posedge(clock);
    read_en[1] = control_out[17]; //instruction memory read_en
end

initial begin
    // @posedge(clock);
    write_en   = control_out[16]; //data memeory write_en
end

initial begin
    
    /*  for the final multicore
    // todo: assign read_en signals
    // if()

    // todo: assign write signals
    // if()
    */

    start <=0;
    write_en_ir <= 0;
    write_en_d <= 0;
    
    #10;
    addr_ext = 9'd1;
    data_file = $fopen("../../test_files/instruction.txt", "r");
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    

    while(!$feof(data_file)) begin
        @(posedge clock);
        #20;
        write_en_ir <= 1;
        read_en_ir <= 0;
        #10;
        scan_file = $fscanf(data_file, "%d\n", instruc_mem_store); 
		#40;
        write_en_ir <= 0;
        read_en_ir <= 1;
		#20;
        addr_ext <= addr_ext + 9'd1;

            // if (!$feof(data_file)) begin
            //     $display(data_);
        //use captured_data as you would any other wire or reg value;
    end
    #40;
    $fclose(data_file);

    write_en_ir <=0;

    $finish;

end

endmodule