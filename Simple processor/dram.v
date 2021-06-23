module dram(clk,write_en,read_en,addr,Data_in,Data_out);
    input clk,write_en, read_en;
    input[8:0] addr;
    input[15:0] Data_in;
    output[15:0] Data_out;

    reg[15:0] singleport_ram[31:0];
    reg[4:0] addr_read;
	 
	 reg [8:0] addr_ext;
	 integer data_file, scan_file;
	 
	//  initial begin
	//  singleport_ram[1] <= 16'd3;
	//  singleport_ram[2] <= 16'd50;
	//  end

    always @(posedge clk) 
    begin
        if (write_en == 1) 
        begin
           singleport_ram[addr] <= Data_in;
           addr_read <= addr; 
        end
        if (read_en == 1)
        begin
            addr_read <= addr;
        end
    end
    assign Data_out = singleport_ram[addr_read];
	 
	 
endmodule