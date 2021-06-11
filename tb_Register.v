module tb_Register;
	reg clr, clk, regIn; 
	reg [31:0] busMuxOut;
	
	wire [31:0] busMuxIn_in;
	
	parameter 	Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
					Reg_load2b = 4'b0100, T0 = 4'b0101, T1 = 4'b0110;
	
	reg [3:0] Present_state = Default;
	
Register DUT(clr, clk, regIn, busMuxOut, busMuxIn_in);

initial
	begin
		clk = 0;
		forever #10 clk = ~clk;
end

always @(posedge clk)
	begin
		case (Present_state)
			Default			:				Present_state = T0;
			T0					:		#40	Present_state = T1;

		endcase
	end
always @(Present_state)
	begin
		case (Present_state)
			Default: begin
								clr <= 0; clk <= 0; regIn<= 0;
								busMuxOut <= 0;
			end
			T0: begin
								regIn<= 1; busMuxOut <= 5;
			end
			T1: begin
								regIn<= 0; clr <= 1;
			end
			
		endcase
	end
endmodule
