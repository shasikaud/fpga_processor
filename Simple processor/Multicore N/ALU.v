module ALU(clock, alu_control, alu_in_1,alu_in_2, alu_out);

	input clock;
	input[15:0] alu_in_1,alu_in_2;
	input[1:0] alu_control;
	output reg[15:0] alu_out;
	
	always @(posedge clock)
	begin
	
	case(alu_control)
	
	2'd1: alu_out <= alu_in_1 + alu_in_2;
	2'd2: alu_out <= alu_in_1 * alu_in_2;
	
	endcase
	
	end 
	endmodule 