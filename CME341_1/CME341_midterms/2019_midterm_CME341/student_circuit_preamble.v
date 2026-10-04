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
//Q1

module student_circuit_Q1 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
	reg [7:0] ring_counter;
  always @(posedge clk)
		if (clear)
		ring_counter  = 8'b10000000; 
		else if (ring_counter == 8'b000000001)
		ring_counter = 8'b10000000;
		else
		ring_counter = ring_counter >> 1;
always @*
cct_output = ring_counter;

endmodule



module student_circuit_Q2 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)

always @*
if (clear)  
cct_output = 8'd0;
else if (cct_input == 8'H14)
cct_output = ~cct_input;
else if (cct_input > 8'd66)
cct_output = {4'd0, cct_input[3]} + {4'd0, cct_input[2]} + {4'd0, cct_input[1]} + {4'd0, cct_input[0]};
else
cct_output = cct_input;

endmodule





module student_circuit_Q3 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)

always @*
begin
cct_output[7] = cct_input[0];
cct_output[6] = cct_input[1];
cct_output[5] = cct_input[2];
cct_output[4] = cct_input[3];
cct_output[3] = cct_input[4];
cct_output[2] = cct_input[5];
cct_output[1] = cct_input[6];
cct_output[0] = cct_input[7];
end
endmodule



module student_circuit_Q4 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
reg new_clock;
always @(posedge clk)
new_clock  = ~new_clock;

always @(posedge new_clock)
if (clear)
cct_output = 8'd0;
else 
cct_output = cct_output + 8'd1;

endmodule




module student_circuit_Q5 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
reg and1, and2, or1, and3, and4;

always@*
begin
and1 = 1'b0 & cct_input[6];

and2 = 1'b1 & ~cct_input[6];

or1 = and1 | and2;

and4 = or1 & ~cct_input[7];

and3 = cct_input[7] & 1'b1;

cct_output[7] = and3 | and4;
cct_output[6:0] = cct_input[6:0];
end

endmodule
