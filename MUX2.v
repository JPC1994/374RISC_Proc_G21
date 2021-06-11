module MUX2(
 input [31:0] in1, in2,
 input S,
 output reg [31:0] out1);
 
 always @* begin
	
	if(S == 0)
		out1 <= in1;
	else
		out1 <= in2;
end 

endmodule 
