module base_tiempo_4vel (clk,rst,select,vel);
	parameter f=50000000; //frecuencia del reloj
	input clk,rst;
	input [1:0] select; //selecciona la velocidad
	output reg vel;
	
	reg [25:0] counter = 0; //conteo para el ciclo de reloj

	
	always @(posedge rst or posedge clk)
		
		if (rst)
			begin
			vel <= 0;
			counter <= 0;
			end
		
		else  
			begin
			counter <= counter + 1'b1;
			
			if (counter == 0)
				vel <= 0;

			if (select == 0 & counter == f)// velocidad de 1s
				begin				 	   
				vel <= ~vel;
				counter <= 0;
				end
				
			else if (select == 1 & counter == f/2)// velocidad de 0.5s
				begin
				vel <= ~vel;
				counter <= 0;
				end
				
			else if (select == 2 & counter == f/4)// velocidad de 0.25s
				begin
				vel <= ~vel;
				counter <= 0;
				end				   
				
			else if (select == 3 & counter == f/8)// velocidad de 0.125s
				begin
				vel <= ~vel;
				counter <= 0;
				end	
			end
endmodule
		   