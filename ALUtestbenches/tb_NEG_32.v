`timescale 1ns/10ps
module tb_NEG_32;

reg [31:0] x, y;
wire [31:0] Zlow, Zhigh;

NEG_32 logical_negate(x, y, Zlow, Zhigh);

reg clock;

initial begin
	x = 32'b0000_0000_0000_0000_1111_1111_1111_1111;
	y = 0;
	
	clock = 0; 
	forever #10 clock = ~clock;
end
endmodule
