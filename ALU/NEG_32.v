`timescale 1ns/10ps
module NEG_32(
 input [31:0] x, y,
 output wire[31:0] zlow, zhigh);
 
 reg [5:0] i;
 wire [31:0] temp, addtemp, unused;
 
 NOT_32 not1(x, 0, temp, unused);
 Add add1(temp, 1, zlow);
 
endmodule
