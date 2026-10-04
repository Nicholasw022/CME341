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


module student_circuit_Q2(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg [7:0] cct_output
);

always@*
if (clear ==1'b1)
cct_output = 8'H00;
else if (cct_input[7:4] == 4'b11)
cct_output = ~cct_input;
else if (cct_input[7] == 1'b1)
cct_output = {7'd0,cct_input[7]} + {7'd0,cct_input[6]} + {7'd0,cct_input[5]} + {7'd0,cct_input[4]} + {7'd0,cct_input[3]} + {7'd0,cct_input[2]} + {7'd0,cct_input[1]} + {7'd0,cct_input[0]};
else
cct_output = cct_input;
endmodule 


module student_circuit_Q3(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg [7:0] cct_output
);
reg [7:0] adder_out, reg1, reg2, reg3;


always@(posedge clk)

if (clear ==1'b1)
reg1 = 8'b11;
else
reg1 = cct_input;

always@(posedge clk)

if (clear ==1'b1)
reg2 = 8'b11;
else
reg2 = cct_input;

always@(posedge clk)
if (clear ==1'b1)
reg3 = 8'b0;
else
reg3 = reg2;

always@*
adder_out = cct_input + 8'd17;

always@*
cct_output = (reg1 ^ adder_out)^reg3;

endmodule
 
 
 
 
 
 
 
 module student_circuit_Q4(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg [7:0] cct_output
);
reg [7:0] ring_counter;


always@(posedge clk)
if (clear ==1'b1)
ring_counter = 8'd1;
else if (ring_counter == 8'b00000001)
ring_counter = 8'b00000010;
else if (ring_counter == 8'b00000010)
ring_counter = 8'b00000100;
else if (ring_counter == 8'b00000100)
ring_counter = 8'b00001000;
else if (ring_counter == 8'b00001000)
ring_counter = 8'b00010000;
else if (ring_counter == 8'b00010000)
ring_counter = 8'b00100000;
else if (ring_counter == 8'b00100000)
ring_counter = 8'b01000000;
else if (ring_counter == 8'b01000000)
ring_counter = 8'b10000000;
else if (ring_counter == 8'b10000000)
ring_counter = 8'b00000001;


always @*
cct_output = ring_counter;


endmodule





module student_circuit_Q5(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg [7:0] cct_output
);
reg  [15:0] cct_input2;

always@*
begin
cct_input2 = cct_input * cct_input;
cct_output = cct_input2[11:4];
end
endmodule 
