`timescale 1ns / 1ps

module conv(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			
	output [15:0] reg_00, output [15:0] reg_01, output [15:0] reg_02, output[15:0] sr_0, 	
	output [15:0] reg_10, output [15:0] reg_11, output [15:0] reg_12, output[15:0] sr_1, 
	output [15:0] reg_20, output [15:0] reg_21, output [15:0] reg_22, 
    	output [15:0] pxl_out,
		
	output valid
    );


	//Define constants
	parameter N = 5;	//Image columns
	parameter M = 5;	//Image rows
	parameter K = 3; 	//Kernel size

	// Intermediate wires
	wire [15:0] wire_00; wire [15:0] wire_01; wire [15:0] wire_02;
	wire [15:0] wire_10; wire [15:0] wire_11; wire [15:0] wire_12;
	wire [15:0] wire_20; wire [15:0] wire_21; wire [15:0] wire_22;

	// 3*3 kernel
	integer kernel_00 = 1; integer kernel_01 = 2; integer kernel_02 = 1;
	integer kernel_10 = 0; integer kernel_11 = 0; integer kernel_12 = 0;
	integer kernel_20 = 1; integer kernel_21 = 2; integer kernel_22 = 1;	

	// Row : 1
	mac mac_00(pxl_in, kernel_00, 0, wire_00);
	register r_00(clk, reset, wire_00, reg_00); 
	
	mac mac_01(pxl_in, kernel_01, reg_00, wire_01); 
	register r_01(clk, reset, wire_01, reg_01); 

	mac mac_02(pxl_in, kernel_02, reg_01, wire_02); 
	register r_02(clk, reset, wire_02, reg_02); 

	shift row_1(clk, reg_02, sr_0);

	// Row : 2
	mac mac_10(pxl_in, kernel_10, sr_0, wire_10); 
	register r_10(clk, reset, wire_10, reg_10); 

	mac mac_11(pxl_in, kernel_11, reg_10, wire_11); 
	register r_11(clk, reset, wire_11, reg_11); 

	mac mac_12(pxl_in, kernel_12, reg_11, wire_12); 
	register r_12(clk, reset, wire_12, reg_12); 

	shift row_2(clk, reg_12, sr_1);

	// Row : 3
	mac mac_20(pxl_in, kernel_20, sr_1, wire_20); 
	register r_20(clk, reset, wire_20, reg_20); 

	mac mac_21(pxl_in, kernel_21, reg_20, wire_21); 
	register r_21(clk, reset, wire_21, reg_21); 

	mac mac_22(pxl_in, kernel_22, reg_21, wire_22); 
	register r_22(clk, reset, wire_22, reg_22); 
	
	assign pxl_out = reg_22;	

	reg [8:0] counter = 0;
	reg temp = 0;

	// Valid bit logic

	always @(posedge clk) begin
		counter = counter + 1;
	
		// The logic below needs some revisiting to scale properly
		if (counter > ((K-1)*N + (K-1)) && counter < (M*N) + (K-1)) begin
			if ((counter - (K-1)) % N > 1) begin

				temp <= 1;
				end
			else
				temp <= 0;
				end
			
		else
			temp <= 0; 
			end
				 

	assign valid = temp;


endmodule