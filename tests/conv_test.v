`timescale 1ns / 1ps

module conv_test;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] pxl_in;

	// Outputs
	wire[15:0] reg_00; wire[15:0] reg_01; wire[15:0] reg_02; wire [15:0] sr_0;
	wire[15:0] reg_10; wire[15:0] reg_11; wire[15:0] reg_12; wire [15:0] sr_1;
	wire[15:0] reg_20; wire[15:0] reg_21; wire[15:0] reg_22; 
	
	wire [15:0] pxl_out;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	conv uut (
		.clk(clk), 
		.reset(reset), 
		.pxl_in(pxl_in),
		.reg_00(reg_00), 
		.reg_01(reg_01),
		.reg_02(reg_02),
		.sr_0(sr_0),
		.reg_10(reg_10),
		.reg_11(reg_11),
		.reg_12(reg_12),
		.sr_1(sr_1),
		.reg_20(reg_20),
		.reg_21(reg_21),
		.reg_22(reg_22),
		.pxl_out(pxl_out),
		.valid(valid)
	);

initial begin
	// Initialize Inputs
	clk = 0;
	reset = 0;
	pxl_in = 0;

	// 5*5 image
	#20 pxl_in = 1; #20 pxl_in = 2; #20 pxl_in = 3; #20 pxl_in = 4; #20 pxl_in = 5;	
	#20 pxl_in = 0; #20 pxl_in = 1; #20 pxl_in = 0; #20 pxl_in = 1; #20 pxl_in = 0;
	#20 pxl_in = 1; #20 pxl_in = 2; #20 pxl_in = 3; #20 pxl_in = 4; #20 pxl_in = 5;
	#20 pxl_in = 0; #20 pxl_in = 1; #20 pxl_in = 0; #20 pxl_in = 1; #20 pxl_in = 0;
	#20 pxl_in = 1; #20 pxl_in = 2; #20 pxl_in = 3; #20 pxl_in = 4; #20 pxl_in = 5;

	end 
	always #10 clk = ~ clk;

endmodule