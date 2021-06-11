module OR_4_3In(
	input [3:0] A, B, C,
	output [3:0] out
);

 reg [2:0] i;
 reg [3:0] temp;
 
	always @(A or B or C) begin 
		for(i = 0 ; i < 4 ; i = i+1) begin
			if(A[i] == 1 || B[i] == 1 || C[i] == 1) 
				temp[i] = 1;
			else 
				temp[i] = 0;
		end
	end

assign out = temp;

endmodule
