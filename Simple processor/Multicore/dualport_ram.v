module dualport_ram(
    clk,
    write_en1,write_en2,
    read_en1,read_en2,
    addr1,addr2,
    Data_in1,Data_in2,
    Data_out1,Data_out2
);
    input clk,write_en1,write_en2,read_en1,read_en2;
    input[8:0] addr1,addr2;
    input[15:0] Data_in1,Data_in2;
    output[15:0] Data_out1,Data_out2;

    reg[15:0] dualport_ram[31:0]
    reg[8:0] addr_read1,addr_read2;

    always @(posedge clk) 
    begin
      if (write_en1 == 1) 
        begin
           dualport_ram[addr1] <= Data_in3;
           //addr_read1 <= addr1; 
        end
        if (read_en1 == 1)
        begin
            addr_read1 <= addr1;
        end 
    end

    always @(posedge clk) 
    begin
      if (write_en2 == 1) 
        begin
           dualport_ram[addr2] <= Data_in2;
           //addr_read2 <= addr2; 
        end
        if (read_en2 == 1)
        begin
            addr_read1 <= addr2;
        end    
    end

    assign Data_out1 = dualport_ram[addr_read1];
    assign Data_out2 = dualport_ram[addr_read2];
endmodule