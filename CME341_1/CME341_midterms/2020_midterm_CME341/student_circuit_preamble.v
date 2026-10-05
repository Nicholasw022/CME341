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
    if (cct_input >= 8'd7 & cct_input <= 8'd11) 
		  cct_output  = cct_input; 
		else	
      cct_output  = 8'd0;
       
endmodule


module student_circuit_Q2 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);


  always @(posedge clk)
    if (clear)
		  cct_output  = 8'd0; 
		else	
      cct_output  = cct_output + 8'd3;
       
endmodule



/*
module student_circuit_Q3 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);
reg newclk;
	always@*
   if (clear)
	cct_output  = 8'd0; 
	always @(posedge clk)
	newclk = ~newclk;
	
  always @(posedge newclk)
   cct_output  = ~cct_input - 8'd1;
	
       
endmodule

*/



module student_circuit_Q4 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

reg or1, and1;
reg [7:0] mux1;


always @*
or1 = cct_input[7] | cct_input[6] | cct_input[5] | cct_input[4];


always @*
if (or1 == 1)
	mux1 = {7'b0, cct_input[2]};
else
	mux1 = {6'b0, cct_input[1:0]};

always @*
and1 = cct_input[7] & cct_input[6] & cct_input[5] & cct_input[4];

always @*
if (and1 == 1)
	cct_output = {7'b0, cct_input[3]};
else
	cct_output = mux1;

       
endmodule





module student_circuit_Q5 (
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

reg iseven74, isodd74, iseven30, isodd30;
integer i;

always @*begin
iseven74 = 1'b0;
isodd74 = 1'b0;
if (cct_input[4] == 1'b0)
iseven74 = 1'b1;
else
isodd74 = 1'b1;
end



always @*begin
iseven30 = 1'b0;
isodd30 = 1'b0;
if (cct_input[0] == 1'b0)
iseven30 = 1'b1;
else
isodd30 = 1'b1;
end


always@*
if (isodd74 & isodd30)
cct_output = 8'b11111111;
else if (iseven74 & iseven30)
cct_output = 8'd0;
else
cct_output = 8'b01110000;

       
endmodule