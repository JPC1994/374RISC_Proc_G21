// phase1 ALU

			T0: begin			
								Zlowout<= 1;  Read <= 1; MDRin <= 1; PCin <= 1;
								#15 Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
			end
			T1: begin
								PCout<= 1; MARin <= 1; incPC <= 1; Zlowin <= 1;
								#15 Zlowin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T2: begin
								MDRout<= 1; IRin <= 1; 
								#15 MDRout<= 0; IRin <= 0; // Take care in next phases
			end
			T3: begin
								R2out<= 1; Yin <= 1; 
								#25 R2out<= 0; Yin <= 0;
			end
			T4: begin
								R4out<= 1; 
								// opCode <= 4'b0001; // add
								// opCode <= 4'b0010; // sub
								// opCode <= 4'b0011; // shr
								// opCode <= 4'b0100; // shl
								// opCode <= 4'b0101; // ror
								opCode <= 4'b0110; // rol
								/* opCode <= 4'b0111; // and
								opCode <= 4'b1000; // or
								opCode <= 4'b1001; // mul
								opCode <= 4'b1010; // div
								opCode <= 4'b1011; // neg
								opCode <= 4'b1100; // not */
								Zlowin <= 1;
								#25 R4out<= 0; Zlowin <= 0;
			end
			T5: begin
								Zlowout<= 1; R5in <= 1; 
								#25 Zlowout<= 0; R5in <= 0; 
			end
			// T6 for mul and div
			T6: begin
								Zhighout <= 1; HIin <= 1;
								#25 Zhighout <= 0; HIin <= 0;
			end
			
			
// ld
		
			T0: begin								
								PCout <= 1; MARin <= 1; incPC <= 1; Zin <= 1; 
								#25 Zin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T1: begin
								Zlowout <= 1;  PCin <= 1; read <= 1; MDRin <= 1;
								#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end
			T2: begin
								MDRout <= 1; IRin <= 1;
								#25 MDRout <= 0; IRin <= 0;
			end
			T3: begin
								Grb <= 1; BAout <= 1; Yin <= 1; Cin <= 1;
								#25 Grb <= 0; BAout <= 0; Yin <= 0; Cin <= 0;
			end
			T4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0001; // add
								#25 Cout<= 0; Zin <= 0;
			end
			T5: begin
								Zlowout <= 1; MARin <= 1; 
								#25 Zlowout<= 0; MARin <= 0; 
			end
			T6: begin
								MDRin <= 1; 
								#25 MDRin <= 0;
			end
			T7: begin
								MDRout <= 1; Gra <= 1; Rin <= 1;
								#25 MDRout <= 0; Gra <= 0; Rin <= 0;
			end
			
			
// ldi
			
			// opcodes
			// ldi R1, 85
			// 00001_0001_0000_0000000000001010101
			// 8800055
			
			// ldi R0, 35(R1)
			// 00001_0000_0001_0000000000000100011
			// 8080023
			
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
								Grb <= 1; Yin <= 1; BAout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; BAout <= 0; Cin <= 0;
			end
			T4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			T5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0; 
			end
			
			
			
// str testbench

			T0: begin								
								PCout <= 1; MARin <= 1; incPC <= 1; Zin <= 1; 
								#25 Zin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T1: begin

								Zlowout <= 1;  PCin <= 1; read <= 1; MDRin <= 1;
								#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end
			T2: begin
								MDRout <= 1; IRin <= 1; 
								#25 MDRout <= 0; IRin <= 0;
			end
			T3: begin
								/* Grb <= 1; */ BAout <= 1; /* Yin <= 1; Cin <= 1; */ Gra <= 1; Rout <= 1; MDRin <= 1; 
								#25 /* Grb <= 0; */ BAout <= 0; /* Yin <= 0; Cin <= 0; */ Gra <= 0; Rout <= 0; MDRin <= 0;
			end
			T4: begin
								Cout <= 1; opCode <= 4'b0001; // add
								#25 Cout<= 0; 
			end
			T5: begin
								write <= 1; MARin <= 1; 
								#25 write <= 0; MARin <= 0; 
			end
			T7: begin
								MDRout <= 1;  Rin <= 1;
								#25 MDRout <= 0; Rin <= 0;
			end
			
		
// addi testbench

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
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			T4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			T5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0; 						
			end


			// ori
			
			// opcodes
			// 01101_0010_0001_0000000000000011010
			// 6908001A
			
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
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1; // MDRin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0; // MDRin <= 0;
			end
			T4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b1000; Zlowin <= 1; // or opcode
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			T5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0; 
			end
			
			
// branch
			
			// opcodes
			// brzr R2, 35
			// 10010_0010_00_000000000000000100011
			// 91000023
			
			// brnz R2, 35
			// 10010_0010_01_000000000000000100011
			// 91200023
			
			// brpl R2, 35
			// 10010_0010_10_000000000000000100011
			// 91400023
						
			// brmi R2, 35
			// 10010_0010_11_000000000000000100011
			// 91600023
			
			T0: begin								
					PCout <= 1; MARin <= 1; incPC <= 1; Zin <= 1;
					#25 Zin <= 0; incPC <= 0; MARin <= 0; PCout <= 0;
			end
			T1: begin
					Zlowout <= 1; read <= 1; MDRin <= 1; PCin <= 1; 
					#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end
			T2: begin
					MDRout <= 1; IRin <= 1;
					#25 MDRout <= 0; IRin <= 0;	
			end
			T3: begin
					Gra<=1; Rout<=1; CONin <= 1; Cin <= 1;
					#25 Gra<=0; Rout<=0; CONin <= 0; Cin <= 0;
			end
			T4: begin
					PCout<=1; Yin <= 1;
					#25 PCout<=0; Yin <= 0;
			end
			T5: begin
					Cout <= 1; Gra <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
					#25 Cout <= 0; Gra<=1; Zin <= 0; Zlowin <= 0;
			end
			T6: begin
					Zlowout <= 1; PCin <= 1;// CON <= PCin; // unsure about logic (CON -> pcIN)
					#25 Zlowout <= 0; PCin <= 0; //  CON <= 0;
			end
			
			
			
// jr

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
								Gra <= 1; PCin <= 1; Rout <= 1; Cin <= 1;
								#25 Gra <= 0; PCin <= 0; Rout <= 0; Cin <= 0;
			end

// jal

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
								Gra <= 1; PCout <= 1; Rin <= 1; Cin <= 1;
								#25 Gra <= 0; PCout <= 0; Rin <= 0; Cin <= 0;
			end
			
			
			// mflo and mfhi
			
			// opcodes
			
			// mfhi
			// 10111_0010_00000000000000000000000
			// B9000000
			
			// mflo
			// 10111_0010_00000000000000000000000
			// B9000000
			
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
								Gra <= 1; LOout <= 1; Rin <= 1; Cin <= 1; // HIout <= 1; <- uncomment for mfhi operation
								#25 Gra <= 0; LOout <= 0; Rin <= 0; Cin <= 0; // HIout <= 1;
			end
			
			
			
			// Out_Port
			
			// out R1
			// 10110_0001_00000000000000000000000
			// B0800000
			
			
			
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
			


			
			

