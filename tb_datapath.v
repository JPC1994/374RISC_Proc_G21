`timescale 1ns/10ps
module tb_datapath;
	
	reg clk, clr;
	
	parameter 	Default = 4'b0000;
	reg [3:0] Present_state = Default;
		
	datapath datapath1(clk, clr); 
	
initial
	begin
		clk = 0;
		clr = 0;
		forever #10 clk = ~clk;
end

endmodule


	// parameter 	Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, T3 = 4'b0100, T4 = 4'b0101, T5 = 4'b0110, T6 = 4'b0111, T7 = 4'b1000; // T8 = 4'b1001; 
/* always @(posedge clk)
	begin
		case (Present_state)
			Default			:		#40	Present_state = T0;
			T0					:		#40	Present_state = T1;
			T1					:		#40	Present_state = T2;
			T2					:		#40	Present_state = T3;
			T3					:		#40	Present_state = T4;
			T4					:		#40	Present_state = T5;
			T5 				:		#40	Present_state = T6;
			T6 				:		#40	Present_state = T7;
			// T7 				:		#40	Present_state = T8;
			
		endcase
	end
	
always @(Present_state)
	begin
		case (Present_state)
			Default: begin						
								HIout <= 0; LOout <= 0; Zhighout <= 0; Zlowout <= 0; 
								PCout <= 0; MDRout <= 0; In_Portout <= 0; Cout <= 0;
								PCin <= 0; Yin <= 0; Zin <= 0; Zhighin <= 0; 
								MARin <= 0; HIin <= 0; LOin <= 0; IRin <= 0; incPC <= 0;
								MDRin <= 0; MDRread <= 0; Gra <= 0; Grb <= 0; Grc <= 0; Rout <= 0; BAout <= 0; Rin <= 0; read <= 0;
			end
			/* 
			// jr
			
			// opcodes
			// jal R1
			// 10100_0001_00000000000000000000000
			// A0800000
			
			T0: begin
								Zlowout <= 1;  PCin <= 1; read <= 1; MDRin <= 1;
								#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end
			T1: begin								
								PCout <= 1; MARin <= 1; incPC <= 1; Zlowin <= 1;
								#25 Zlowin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T2: begin
								MDRout <= 1; IRin <= 1; 
								#25 MDRout <= 0; IRin <= 0;
			end 
			T3: begin
								PCout <= 1; Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 PCout <= 0; Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			T4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add opcode
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			T5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0; 
						
			end */
			
			// Out_Port
			
			// out R1
			// 10110_0001_00000000000000000000000
			// B0800000
			
			
			
			/* T0: begin
								Zlowout <= 1;  PCin <= 1; read <= 1; MDRin <= 1;
								#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end
			T1: begin								
								PCout <= 1; MARin <= 1; incPC <= 1; Zlowin <= 1;
								#25 Zlowin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T2: begin
								MDRout <= 1; IRin <= 1; 
								#25 MDRout <= 0; IRin <= 0;
			end 
			T3: begin
								Gra <= 1; Rout <= 1; Cin <= 1; Out_Port <= 1; 
								#25 Grb <= 0; Rout <= 0; Cin <= 0; Out_Port <= 0; 
			end

			
			// In_Port
			
			// in R1
			// 10101_0001_00000000000000000000000
			// A8800000
			
			T0: begin
								Zlowout <= 1;  PCin <= 1; read <= 1; MDRin <= 1;
								#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end
			T1: begin								
								PCout <= 1; MARin <= 1; incPC <= 1; Zlowin <= 1;
								#25 Zlowin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T2: begin
								MDRout <= 1; IRin <= 1; 
								#25 MDRout <= 0; IRin <= 0;
			end 
			T3: begin
								Gra <= 1; Rin <= 1; Cin <= 1; In_Portout <= 1; 
								#25 Grb <= 0; Rin <= 0; Cin <= 0; In_Portout <= 0;
			end

		endcase
	end
endmodule */



