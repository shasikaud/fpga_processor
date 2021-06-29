module iram_gen 
	#(parameter N = 4)
	(clk,write_en,read_en,addr,Data_in,Data_out);
	input clk;
	input [N-1:0]  write_en, read_en;
    input [N-1:0] [8:0] addr;
    input [N-1:0] [15:0] Data_in;
    output [N-1:0] [15:0] Data_out;

	genvar i;
	generate
		for (i = 0; i < N ; i= i + 1) begin:gen
	iram u_iram(
		.clk      ( clk      ),
		.write_en ( write_en[i] ),
		.read_en  ( read_en[i]  ),
		.addr     ( addr[i]     ),
		.Data_in  ( Data_in[i]  ),
		.Data_out ( Data_out[i] )
	);

		end
	endgenerate


endmodule
