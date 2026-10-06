module student_circuit_Q5(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
always @ (posedge clk)
if (clear == 1'b1)
	cct_output = 8'h45;
else
	case(cct_output)
	8'b01000101: cct_output = 8'b10001010;
	8'b10001010: cct_output = 8'b00010101;
	8'b00010101: cct_output = 8'b00101010;
	8'b00101010: cct_output = 8'b01010100;
	8'b01010100: cct_output = 8'b10101000;
	8'b10101000: cct_output = 8'b01010001;
	8'b01010001: cct_output = 8'b10100010;
	default: cct_output = 8'b01000101;
	endcase
		
		

endmodule