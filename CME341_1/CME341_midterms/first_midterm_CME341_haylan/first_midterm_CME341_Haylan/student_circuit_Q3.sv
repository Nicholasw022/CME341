module student_circuit_Q3(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

always @ (posedge clk)
if(clear == 1'b1)
	cct_output = 8'HFF;
else
	if (cct_output == 8'HAA)
		cct_output = cct_output;
	else
		cct_output = cct_output - 8'h1;
		

endmodule