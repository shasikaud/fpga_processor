module quadport_ram(
    clk,
    write_en1,write_en2,write_en3,write_en4,
    read_en1,read_en2,read_en3,read_en4,
    addr1,addr2,addr3,addr4,
    Data_in1,Data_in2,Data_in3,Data_in4,
    Data_out1,Data_out2,Data_out3,Data_out4,
);

    input clk,write_en1,write_en2,write_en3,write_en4;
    input read_en1,read_en2,read_en3,read_en4;
    input[8:0] addr1,addr2,addr3,addr4;
    input[15:0] Data_in1,Data_in2,Data_in3,Data_in4;
    output[15:0] Data_out1,Data_out2,Data_out3,Data_out4;

    reg[15:0] quadport_ram[31:0]
    reg[8:0] addr_read1,addr_read2,addr_read3,addr_read4;

    always @(posedge clk) 
    begin
      if (write_en1 == 1) 
        begin
           quadport_ram[addr1] <= Data_in;
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
           quadport_ram[addr2] <= Data_in2;
           //addr_read2 <= addr2; 
        end
        if (read_en2 == 1)
        begin
            addr_read1 <= addr2;
        end    
    end

    always @(posedge clk) 
    begin
      if (write_en3 == 1) 
        begin
           quadport_ram[addr3] <= Data_in34;
           //addr_read3 <= addr3; 
        end
        if (read_en3 == 1)
        begin
            addr_read3 <= addr3;
        end 
    end

    always @(posedge clk) 
    begin
      if (write_en4 == 1) 
        begin
           quadport_ram[addr4] <= Data_in4;
           //addr_read2 <= addr2; 
        end
        if (read_en4 == 1)
        begin
            addr_read4 <= addr4;
        end    
    end

    assign Data_out1 = quadport_ram[addr_read1];
    assign Data_out2 = quadport_ram[addr_read2];
    assign Data_out3 = quadport_ram[addr_read3];
    assign Data_out4 = quadport_ram[addr_read4];

endmodule

