module clock(clk);
output reg clk;
always
begin
clk = 0;
#10;
clk = 1;
#10;
end

endmodule 