module hexadecaport_ram(
    clk,
    write_en1,write_en2,write_en3,write_en4,write_en5,write_en6,write_en7,write_en8,write_en9,write_en10,write_en11,write_en12,write_en13,write_en14,write_en15,write_en16,
    read_en1,read_en2,read_en3,read_en4,read_en5,read_en6,read_en7,read_en8,read_en9,read_en10,read_en11,read_en12,read_en13,read_en14,read_en15,read_en16,
    addr1,addr2,addr3,addr4,addr5,addr6,addr7,addr8,addr9,addr10,addr11,addr12,addr13,addr14,addr15,addr16,
    Data_in1,Data_in2,Data_in3,Data_in4,Data_in5,Data_in6,Data_in7,Data_in8,Data_in9,Data_in10,Data_in11,Data_in12,Data_in13,Data_in14,Data_in15,Data_in16,
    Data_out1,Data_out2,Data_out3,Data_out4,Data_out5,Data_out6,Data_out7,Data_out8,Data_out9,Data_out10,Data_out11,Data_out12,Data_out13,Data_out14,Data_out15,Data_out16
);

    input clk,write_en1,write_en2,write_en3,write_en4,write_en5,write_en6,write_en7,write_en8,write_en9,write_en10,write_en11,write_en12,write_en13,write_en14,write_en15,write_en16;
    input read_en1,read_en2,read_en3,read_en4,read_en5,read_en6,read_en7,read_en8,read_en9,read_en10,read_en11,read_en12,read_en13,read_en14,read_en15,read_en16;
    input[8:0] addr1,addr2,addr3,addr4,addr5,addr6,addr7,addr8,addr9,addr10,addr11,addr12,addr13,addr14,addr15,addr16;
    input[15:0] Data_in1,Data_in2,Data_in3,Data_in4,Data_in5,Data_in6,Data_in7,Data_in8,Data_in9,Data_in10,Data_in11,Data_in12,Data_in13,Data_in14,Data_in15,Data_in16;
    output[15:0] Data_out1,Data_out2,Data_out3,Data_out4,Data_out5,Data_out6,Data_out7,Data_out8,Data_out9,Data_out10,Data_out11,Data_out12,Data_out13,Data_out14,Data_out15,Data_out16;

    reg[15:0] hexadecaport_ram[511:0];
    reg[8:0] addr_read1,addr_read2,addr_read3,addr_read4,addr_read5,addr_read6,addr_read7,addr_read8,addr_read9,addr_read10,addr_read11,addr_read12,addr_read13,addr_read14,addr_read15,addr_read16;

    always @(posedge clk) 
    begin
      if (write_en1 == 1) 
        begin
           hexadecaport_ram[addr1] <= Data_in1;
           //addr_read1 <= addr1; 
        end
        if (read_en1 == 1)
        begin
            addr_read1 <= addr1;
        end 
  

      if (write_en2 == 1) 
        begin
           hexadecaport_ram[addr2] <= Data_in2;
           //addr_read2 <= addr2; 
        end
        if (read_en2 == 1)
        begin
            addr_read2 <= addr2;
        end    
  


      if (write_en3 == 1) 
        begin
           hexadecaport_ram[addr3] <= Data_in3;
           //addr_read3 <= addr3; 
        end
        if (read_en3 == 1)
        begin
            addr_read3 <= addr3;
        end 
 

      if (write_en4 == 1) 
        begin
           hexadecaport_ram[addr4] <= Data_in4;
           //addr_read2 <= addr2; 
        end
        if (read_en4 == 1)
        begin
            addr_read4 <= addr4;
        end

      if (write_en5 == 1) 
        begin
           hexadecaport_ram[addr5] <= Data_in5;
           //addr_read1 <= addr1; 
        end
        if (read_en5 == 1)
        begin
            addr_read5 <= addr5;
        end  
        
      if (write_en6 == 1) 
        begin
           hexadecaport_ram[addr6] <= Data_in6;
           //addr_read1 <= addr1; 
        end
        if (read_en6 == 1)
        begin
            addr_read6 <= addr6;
        end 

      if (write_en7 == 1) 
        begin
           hexadecaport_ram[addr7] <= Data_in7;
           //addr_read1 <= addr1; 
        end
        if (read_en7 == 1)
        begin
            addr_read7 <= addr7;
        end 
     
      if (write_en8 == 1) 
        begin
           hexadecaport_ram[addr8] <= Data_in8;
           //addr_read1 <= addr1; 
        end
        if (read_en8 == 1)
        begin
            addr_read8 <= addr8;
        end 

      if (write_en9 == 1) 
        begin
           hexadecaport_ram[addr9] <= Data_in9;
           //addr_read1 <= addr1; 
        end
        if (read_en9 == 1)
        begin
            addr_read9 <= addr9;
        end 

      if (write_en10 == 1) 
        begin
           hexadecaport_ram[addr10] <= Data_in10;
           //addr_read1 <= addr1; 
        end
        if (read_en10 == 1)
        begin
            addr_read10 <= addr10;
        end 

      if (write_en11 == 1) 
        begin
           hexadecaport_ram[addr11] <= Data_in11;
           //addr_read1 <= addr1; 
        end
        if (read_en11 == 1)
        begin
            addr_read11 <= addr11;
        end  
    
      if (write_en12 == 1) 
        begin
           hexadecaport_ram[addr12] <= Data_in12;
           //addr_read1 <= addr1; 
        end
        if (read_en12 == 1)
        begin
            addr_read12 <= addr12;
        end 
        
      if (write_en13 == 1) 
        begin
           hexadecaport_ram[addr13] <= Data_in13;
           //addr_read1 <= addr1; 
        end
        if (read_en13 == 1)
        begin
            addr_read13 <= addr13;
        end 

      if (write_en14 == 1) 
        begin
           hexadecaport_ram[addr14] <= Data_in14;
           //addr_read1 <= addr1; 
        end
        if (read_en14 == 1)
        begin
            addr_read14 <= addr14;
        end 

      if (write_en15 == 1) 
        begin
           hexadecaport_ram[addr15] <= Data_in15;
           //addr_read1 <= addr1; 
        end
        if (read_en15 == 1)
        begin
            addr_read15 <= addr15;
        end 

      if (write_en16 == 1) 
        begin
           hexadecaport_ram[addr16] <= Data_in16;
           //addr_read1 <= addr1; 
        end
        if (read_en16 == 1)
        begin
            addr_read16 <= addr16;
        end 
        end    

    assign Data_out1 = hexadecaport_ram[addr_read1];
    assign Data_out2 = hexadecaport_ram[addr_read2];
    assign Data_out3 = hexadecaport_ram[addr_read3];
    assign Data_out4 = hexadecaport_ram[addr_read4];
    assign Data_out5 = hexadecaport_ram[addr_read5];
    assign Data_out6 = hexadecaport_ram[addr_read6];
    assign Data_out7 = hexadecaport_ram[addr_read7];
    assign Data_out8 = hexadecaport_ram[addr_read8];
    assign Data_out9 = hexadecaport_ram[addr_read9];
    assign Data_out10 = hexadecaport_ram[addr_read10];
    assign Data_out11 = hexadecaport_ram[addr_read11];
    assign Data_out12 = hexadecaport_ram[addr_read12];
    assign Data_out13 = hexadecaport_ram[addr_read13];
    assign Data_out14 = hexadecaport_ram[addr_read14];
    assign Data_out15 = hexadecaport_ram[addr_read15];
    assign Data_out16 = hexadecaport_ram[addr_read16];

endmodule