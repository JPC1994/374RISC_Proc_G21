`timescale 1ns/10ps
module Div(
	input [31:0] divisor, divident,
	output [31:0] quotient, remainder); //quotient = zlow, remainder = zhigh

reg [5:0] i;
reg [64:0] A;
reg [32:0] M;

always @* begin
	A[31:0] = divident;
	A[64:32] = 0;
	M[31:0] = divisor;

	for(i=0; i<32; i=i+1) begin
		M[32] = M[31];
		A = A << 1;
		A[64:32] = A[64:32] - divisor;
		if (A[63] == 1) begin 
			A[0] = 0;
			A[64:32] = A[64:32] + M;
		end 
		else if (A[63] == 0)
			A[0] = 1;
	end
end

assign quotient = A[31:0];
assign remainder = A[63:32];

endmodule
