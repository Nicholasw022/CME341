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

  always @ (posedge clk or posedge clear)
    if (clear)
		  cct_output  = 8'd0; 
    else	if (cct_input == 8'd31)
      cct_output  = 8'd100;
    else
		cct_output = cct_output + 8'd1;
endmodule



module student_circuit_Q2 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

  always @ *
	if (cct_input >= 8'd10 & cct_input <= 8'd99)
      cct_output  = cct_input;
    else
		cct_output = cct_input~^8'HC6;
endmodule



module student_circuit_Q3 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

  always @ *
   if (clear)
		cct_output  = 8'd0; 
	else if (cct_input[7])
      cct_output  = {cct_input[1:0],cct_input[1:0],cct_input[1:0],cct_input[1:0]};
   else
		cct_output = ~cct_input;
endmodule




module student_circuit_Q4 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);
	reg [7:0] delay;
	
  always @ (posedge clk or posedge clear)
   if (clear)
		delay  = 8'd0;
   else
		delay = cct_input;
		
		
  always @ (negedge clk or posedge clear)
    if (clear)
		cct_output = 8'd0;
	else
  cct_output = ~(delay & cct_input);
  
endmodule



module student_circuit_Q5 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);
	reg or1, xor1, and1, and2, and3, and4;

  always @ *
or1 = cct_input[1] | cct_input[0];
		
  always @ *
xor1 = cct_input[3] ^ cct_input[2];
		
	always @ *
and1 = cct_input[4] & or1 & xor1;

	always @ *
and2 = cct_input[5] & (~or1) & xor1;		
 	always @ *
and3 = cct_input[6] & or1 & (~xor1);
	 	always @ *
and4 = cct_input[7] &(~or1) & (~xor1);
			
 	 	always @ *
cct_output[4] = and1|and2|and3|and4;

 always @ *
cct_output[7:5] = 3'd0;
always @ *
cct_output[3:0] = 4'd0;
endmodule