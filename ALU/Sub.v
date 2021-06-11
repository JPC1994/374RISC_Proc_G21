`timescale 1ns / 1ps
module Sub(
    input [31:0] in1, in2,
    output [31:0] SUM
    );
	 
    wire [31:0] temp, unused; 
	 NEG_32 NEG_op(in2, 0, temp, unused);
	 Add add_op(in1, temp, SUM);
endmodule
