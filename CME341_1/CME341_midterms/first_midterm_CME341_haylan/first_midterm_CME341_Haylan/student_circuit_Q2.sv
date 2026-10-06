module student_circuit_Q2(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)

always @ *
if (clear == 1'b1)
	cct_output = 8'b0;
else
	if(cct_input%4 !=0)
		cct_output = ~cct_input;
	else if (cct_input > 8'ha5)
		cct_output = cct_input;
	else
		cct_output = cct_input*2;

	
endmodule