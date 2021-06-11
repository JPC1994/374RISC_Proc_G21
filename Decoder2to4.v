// File Name: Decoder2to4.v
`timescale 1ns/10ps
module Decoder2to4(
	input [1:0] DecoderIn,
	output reg d0, d1, d2, d3);
	
	always @(DecoderIn) begin
		case(DecoderIn)
			2'b00: begin d0=1; d1=0; d2=0; d3=0; end
			2'b01: begin d1=1; d0=0; d2=0; d3=0; end
			2'b10: begin d2=1; d1=0; d0=0; d3=0; end
			2'b11: begin d3=1; d1=0; d2=0; d0=0; end
		endcase
	end
		
endmodule
