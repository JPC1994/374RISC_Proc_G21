`timescale 1ns/10ps
module tb_Div;

reg [31:0] divisor, divident;
wire [31:0] quotient, remainder;

Div div_32(divisor, divident, quotient, remainder);

initial begin
	divisor = 32'b00000000000000000000000000010000;
	divident = 32'b00000000000000000000000011101010;
end
endmodule 