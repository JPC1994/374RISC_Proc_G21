`timescale 1ns/10ps
module tb_Mul;

reg [31:0] in1, in2;
wire [31:0] zlow, zhigh;

Mul boothMul(in1, in2, zlow, zhigh);

reg [1:0] present_state = 2'b00;
reg clk;

initial begin
	in2 = 32'b00000000000000000000000000101010;
	clk = 0; 
	forever #10 clk = ~clk;
end

always @(present_state) begin
	case(present_state)
		2'b00: 	in1 = 32'b00000000000000000000000000010000;
		2'b01:	in1 = 32'b00000000000000000000000000001100;
		2'b10:	in1 = 32'b00000000000000000000000000010101;
	endcase
end

always @(posedge clk) begin
	present_state = present_state + 1;
	if (present_state == 3) begin
		present_state = 0;
	end
end
endmodule 