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



module student_circuit_Q2 (
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
    else	if ( cct_input == 8'b10)
      cct_output  = ~cct_input;
     else if (cct_input > 8'd35)
	  cct_output = {7'd0,cct_input[0]} + {7'd0,cct_input[1]} + {7'd0,cct_input[2]} + {7'd0,cct_input[3]};
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

reg [7:0] adderoutput, reg1, reg2;
always @ *
    if (clear == 1'b1)
		  adderoutput = 8'b11 + 8'h22; 
		else
		adderoutput = 8'h22 + cct_input;
		  
always @ (posedge clk)
	if (clear == 1'b1)
		reg1 = 8'b11;
	else
		reg1 = cct_input;
		
always @(posedge clk)
if (clear == 1'b1)
	reg2 = 8'h55;
	else
	reg2 = adderoutput ^ reg1;
always @*
cct_output = reg2^reg1;

endmodule




module student_circuit_Q4 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
reg [7:0] goofy_counter;

always@ (posedge clk)
if (clear == 1'b1)
goofy_counter = 8'b1000_0001;
else
case(goofy_counter)
8'b1000_0001: goofy_counter = 8'b0100_0010;
8'b0100_0010: goofy_counter = 8'b0010_0100;
8'b0010_0100: goofy_counter = 8'b0001_1000;
8'b0001_1000: goofy_counter = 8'b1000_0001;
default: goofy_counter = 8'b1000_0001;
endcase

always@*
cct_output = goofy_counter;

endmodule




module student_circuit_Q5 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
reg [7:0] rightshift;
always @*
rightshift[7:0] = cct_input >> 2;

always @*
begin
cct_output[7:6] ={cct_input[7], cct_input[7]};
cct_output[5:0] = rightshift[5:0];
end
endmodule