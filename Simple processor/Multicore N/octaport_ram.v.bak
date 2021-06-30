module octaport_ram(
    clk,
    write_en1,write_en2,write_en3,write_en4,write_en5,write_en6,write_en7,write_en8,
    read_en1,read_en2,read_en3,read_en4,read_en5,read_en6,read_en7,read_en8,
    addr1,addr2,addr3,addr4,addr5,addr6,addr7,addr8,
    Data_in1,Data_in2,Data_in3,Data_in4,Data_in5,Data_in6,Data_in7,Data_in8,
    Data_out1,Data_out2,Data_out3,Data_out4,Data_out5,Data_out6,Data_out7,Data_out8
);

    input clk,write_en1,write_en2,write_en3,write_en4,write_en5,write_en6,write_en7,write_en8;
    input read_en1,read_en2,read_en3,read_en4,read_en5,read_en6,read_en7,read_en8;
    input[8:0] addr1,addr2,addr3,addr4,addr5,addr6,addr7,addr8;
    input[15:0] Data_in1,Data_in2,Data_in3,Data_in4,Data_in5,Data_in6,Data_in7,Data_in8;
    output[15:0] Data_out1,Data_out2,Data_out3,Data_out4,Data_out5,Data_out6,Data_out7,Data_out8;

    reg[15:0] quadport_ram[511:0];
    reg[8:0] addr_read1,addr_read2,addr_read3,addr_read4,addr_read5,addr_read6,addr_read7,addr_read8;

    always @(posedge clk) 
    begin
      if (write_en1 == 1) 
        begin
           quadport_ram[addr1] <= Data_in1;
           //addr_read1 <= addr1; 
        end
        if (read_en1 == 1)
        begin
            addr_read1 <= addr1;
        end 
  

  

      if (write_en2 == 1) 
        begin
           quadport_ram[addr2] <= Data_in2;
           //addr_read2 <= addr2; 
        end
        if (read_en2 == 1)
        begin
            addr_read2 <= addr2;
        end    
  


      if (write_en3 == 1) 
        begin
           quadport_ram[addr3] <= Data_in3;
           //addr_read3 <= addr3; 
        end
        if (read_en3 == 1)
        begin
            addr_read3 <= addr3;
        end 
 

      if (write_en4 == 1) 
        begin
           quadport_ram[addr4] <= Data_in4;
           //addr_read2 <= addr2; 
        end
        if (read_en4 == 1)
        begin
            addr_read4 <= addr4;
        end

      if (write_en5 == 1) 
        begin
           quadport_ram[addr5] <= Data_in5;
           //addr_read1 <= addr1; 
        end
        if (read_en5 == 1)
        begin
            addr_read5 <= addr5;
        end  
        
      if (write_en6 == 1) 
        begin
           quadport_ram[addr6] <= Data_in6;
           //addr_read1 <= addr1; 
        end
        if (read_en6 == 1)
        begin
            addr_read6 <= addr6;
        end 

      if (write_en7 == 1) 
        begin
           quadport_ram[addr7] <= Data_in7;
           //addr_read1 <= addr1; 
        end
        if (read_en7 == 1)
        begin
            addr_read7 <= addr7;
        end 
     
      if (write_en8 == 1) 
        begin
           quadport_ram[addr8] <= Data_in8;
           //addr_read1 <= addr1; 
        end
        if (read_en8 == 1)
        begin
            addr_read8 <= addr8;
        end      

        end    

    assign Data_out1 = quadport_ram[addr_read1];
    assign Data_out2 = quadport_ram[addr_read2];
    assign Data_out3 = quadport_ram[addr_read3];
    assign Data_out4 = quadport_ram[addr_read4];
    assign Data_out5 = quadport_ram[addr_read5];
    assign Data_out6 = quadport_ram[addr_read6];
    assign Data_out7 = quadport_ram[addr_read7];
    assign Data_out8 = quadport_ram[addr_read8];

endmodule

