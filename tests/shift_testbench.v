module shift_testbench;

  //Inputs
  reg clk;
  reg [15:0] data_in;
  wire [15:0] data_out;
  
  shift uut(
	.clk(clk),
	.data_in(data_in),
	.data_out(data_out)
	);
  
  initial begin
    	clk = 0;
    	data_in = 100;
    
    	#100;
		
    	data_in = 10;
	#40;
	
    	data_in = 30;
	#40;
	
    	data_in = 21;
	#40;

	data_in = 110;
	#40;
	
    end
	
    always #10 clk = ~ clk;
      
endmodule