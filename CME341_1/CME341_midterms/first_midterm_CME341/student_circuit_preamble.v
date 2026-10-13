// This file contains the initial version of the student circuit for
// the midterm exam preamble.  When working through the 'example exam question'
// section of the preamble, you are asked to change this module to implement
// a different circuit.

module student_circuit_preamble (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)

  always @ *
    if (clear)
		  cct_output  = 8'H0; 
    else	
      cct_output  = cct_input;
       
endmodule



module student_circuit_Q1 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);




  always @ *
    if (clear)
		  cct_output = 8'H1F; 
    else
		cct_output = ~cct_input;
endmodule



module student_circuit_Q2 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

always @ *
    if (clear)
		  cct_output = 8'd0; 
    else if (cct_input[0] == 1'b0)
		cct_output = 8'd1;
		else
		cct_output = 8'd0;
endmodule



module student_circuit_Q3 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

always @ (posedge clk)
    if (clear)
		  cct_output = 8'HFF; 
    else if (cct_output < 8'HA0)
		cct_output = cct_output;
		else
		cct_output = cct_output - 8'd7;
endmodule



module student_circuit_Q4 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);
always @ (posedge clk)
    if (clear)
		  cct_output = 8'HFF; 
    else
	 case(cct_output)
	 8'b01010101: cct_output = 8'b10101010;
	8'b10101010: cct_output = 8'b00010101;
	8'b00010101: cct_output = 8'b00101010;
	8'b00101010: cct_output = 8'b01010101;
	8'HFF: cct_output = 8'b01010101;
	default: cct_output = 8'b01010101;
	endcase
endmodule




module student_circuit_Q5 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);
reg [7:0] delay1, delay2;

always @ (posedge clk)
    if (clear)
		  delay1 = 8'd0; 
    else
	 delay1 = cct_input;
	 
always @ (posedge clk)
    if (clear)
		  delay2 = 8'd0; 
    else
	 delay2 = delay1;
	 
	 always @ (posedge clk)
    if (clear)
		  cct_output = 8'd0; 
    else
	 cct_output = delay2;
endmodule



module student_circuit_Q6 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

always @ *
    cct_output = {7'd0, cct_input[7]}+ {7'd0, cct_input[6]}+{7'd0, cct_input[5]}+{7'd0, cct_input[4]}+{7'd0, cct_input[3]}+{7'd0, cct_input[2]}+{7'd0, cct_input[1]}+{7'd0, cct_input[0]};

endmodule



module student_circuit_Q7 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

reg dummy0;
always@*
if (cct_input[0] == 1'b1)
dummy0 = cct_input[1];
else
dummy0 = cct_input[2];

always @ (posedge clk)
cct_output[0] = dummy0;

always@*
begin
cct_output[1] = 1'b0;
cct_output[7:2] = cct_input[7:2];
end

endmodule