module motor_a_pasos (CLK,RST,select,sentido,paso,I1,I2,I3,I4);
	input CLK,RST,sentido,paso;
	input [1:0] select; //selector de velocidad
	output reg I1,I2,I3,I4;// Bobinas
	wire vel; // de la base de tiempo a la maquina de estados
	
	reg[2:0] estado;
	
	base_tiempo_4vel U1(CLK,RST,select,vel); //base de tiempo para control de velocidad
	
	always @(posedge RST or posedge CLK)
		
			if (RST)
			begin estado <= 0; I1 <= 1;I2 <= 0;I3 <= 0;I4 <= 0; end
			
			else 
				begin
					case (estado) 
						0: begin //comienza estado 0
							I1 <= 1;I2 <= 0;I3 <= 0;I4 <= 0;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 1;
								else if (~sentido & paso)
										estado <= 4;	
								else if (sentido & ~paso)
										estado <= 3;
								else if (sentido & paso)
										estado <= 7;	
								end
							else 
								estado <= estado;
							end //termina estado 0
						
						1: begin //comienza estado 1
							I1 <= 0;I2 <= 1;I3 <= 0;I4 <= 0;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 2;
								else if (~sentido & paso)
										estado <= 5;	
								else if (sentido & ~paso)
										estado <= 0;
								else if (sentido & paso)
										estado <= 4;	
								end
							else 
								estado <= estado;
							end //termina estado 1
							
						2: begin //comienza estado 2
							I1 <= 0;I2 <= 0;I3 <= 1;I4 <= 0;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 3;
								else if (~sentido & paso)
										estado <= 6;	
								else if (sentido & ~paso)
										estado <= 1;
								else if (sentido & paso)
										estado <= 5;	
								end
							else 
								estado <= estado;
							end //termina estado 2 
							
						3: begin //comienza estado 3
							I1 <= 0;I2 <= 0;I3 <= 0;I4 <= 1;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 0;
								else if (~sentido & paso)
										estado <= 7;	
								else if (sentido & ~paso)
										estado <= 2;
								else if (sentido & paso)
										estado <= 6;	
								end
							else 
								estado <= estado;
							end //termina estado 3
							
						4: begin //comienza estado 4
							I1 <= 1;I2 <= 1;I3 <= 0;I4 <= 0;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 5;
								else if (~sentido & paso)
										estado <= 1;	
								else if (sentido & ~paso)
										estado <= 7;
								else if (sentido & paso)
										estado <= 0;	
								end
							else 
								estado <= estado;
							end //termina estado 4	
							
						5: begin //comienza estado 5
							I1 <= 0;I2 <= 1;I3 <= 1;I4 <= 0;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 6;
								else if (~sentido & paso)
										estado <= 2;	
								else if (sentido & ~paso)
										estado <= 4;
								else if (sentido & paso)
										estado <= 1;	
								end
							else 
								estado <= estado;
							end //termina estado 5 
							
						6: begin //comienza estado 6
							I1 <= 0;I2 <= 0;I3 <= 1;I4 <= 1;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 7;
								else if (~sentido & paso)
										estado <= 3;	
								else if (sentido & ~paso)
										estado <= 5;
								else if (sentido & paso)
										estado <= 2;	
								end
							else 
								estado <= estado;
							end //termina estado 6 
							
						7: begin //comienza estado 7
							I1 <= 1;I2 <= 0;I3 <= 0;I4 <= 1;
						
							if(vel) begin
								if(~sentido & ~paso)	
										estado <= 4;
								else if (~sentido & paso)
										estado <= 0;	
								else if (sentido & ~paso)
										estado <= 6;
								else if (sentido & paso)
										estado <= 3;	
								end
							else 
								estado <= estado;
							end //termina estado 7 
						
						default begin estado <= 0; I1 <= 1;I2 <= 0;I3 <= 0;I4 <= 0; end	
					endcase
				end
endmodule