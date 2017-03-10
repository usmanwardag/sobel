module shift
(
  input clk,
  input [15:0] data_in,
  output [15:0] data_out
);

// Depth = n-k; for now assume 'n' to be 5
parameter DEPTH = 2;

reg [DEPTH-1:0] holding_register0;
reg [DEPTH-1:0] holding_register1;
reg [DEPTH-1:0] holding_register2;
reg [DEPTH-1:0] holding_register3;
reg [DEPTH-1:0] holding_register4;
reg [DEPTH-1:0] holding_register5;
reg [DEPTH-1:0] holding_register6;
reg [DEPTH-1:0] holding_register7;
reg [DEPTH-1:0] holding_register8;
reg [DEPTH-1:0] holding_register9;
reg [DEPTH-1:0] holding_register10;
reg [DEPTH-1:0] holding_register11;
reg [DEPTH-1:0] holding_register12;
reg [DEPTH-1:0] holding_register13;
reg [DEPTH-1:0] holding_register14;
reg [DEPTH-1:0] holding_register15;

always @ (posedge clk) begin
  holding_register0 [DEPTH-1:0] <= {holding_register0[DEPTH-2:0], data_in[0]};
  holding_register1 [DEPTH-1:0] <= {holding_register1[DEPTH-2:0], data_in[1]};
  holding_register2 [DEPTH-1:0] <= {holding_register2[DEPTH-2:0], data_in[2]};
  holding_register3 [DEPTH-1:0] <= {holding_register3[DEPTH-2:0], data_in[3]};
  holding_register4 [DEPTH-1:0] <= {holding_register4[DEPTH-2:0], data_in[4]};
  holding_register5 [DEPTH-1:0] <= {holding_register5[DEPTH-2:0], data_in[5]};
  holding_register6 [DEPTH-1:0] <= {holding_register6[DEPTH-2:0], data_in[6]};
  holding_register7 [DEPTH-1:0] <= {holding_register7[DEPTH-2:0], data_in[7]};
  holding_register8 [DEPTH-1:0] <= {holding_register8[DEPTH-2:0], data_in[8]};
  holding_register9 [DEPTH-1:0] <= {holding_register9[DEPTH-2:0], data_in[9]};
  holding_register10 [DEPTH-1:0] <= {holding_register10[DEPTH-2:0], data_in[10]};
  holding_register11 [DEPTH-1:0] <= {holding_register11[DEPTH-2:0], data_in[11]};
  holding_register12 [DEPTH-1:0] <= {holding_register12[DEPTH-2:0], data_in[12]};
  holding_register13 [DEPTH-1:0] <= {holding_register13[DEPTH-2:0], data_in[13]};
  holding_register14 [DEPTH-1:0] <= {holding_register14[DEPTH-2:0], data_in[14]};
  holding_register15 [DEPTH-1:0] <= {holding_register15[DEPTH-2:0], data_in[15]};
end

assign data_out[0] = holding_register0[DEPTH-1];
assign data_out[1] = holding_register1[DEPTH-1];
assign data_out[2] = holding_register2[DEPTH-1];
assign data_out[3] = holding_register3[DEPTH-1];
assign data_out[4] = holding_register4[DEPTH-1];
assign data_out[5] = holding_register5[DEPTH-1];
assign data_out[6] = holding_register6[DEPTH-1];
assign data_out[7] = holding_register7[DEPTH-1];
assign data_out[8] = holding_register8[DEPTH-1];
assign data_out[9] = holding_register9[DEPTH-1];
assign data_out[10] = holding_register10[DEPTH-1];
assign data_out[11] = holding_register11[DEPTH-1];
assign data_out[12] = holding_register12[DEPTH-1];
assign data_out[13] = holding_register13[DEPTH-1];
assign data_out[14] = holding_register14[DEPTH-1];
assign data_out[15] = holding_register15[DEPTH-1];


endmodule