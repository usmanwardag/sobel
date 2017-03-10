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