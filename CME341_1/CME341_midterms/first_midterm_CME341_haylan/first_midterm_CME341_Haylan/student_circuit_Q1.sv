module student_circuit_Q1(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);

// initial circuit - should give 16'H622D in testbench for seed 8'HAA
// (replace with a different circuit as directed in the preamble)
assign two_comp = ~cct_input + 8'b1;
/*
always @ (posedge clk or posedge clear)
if(clear == 1'b1) begin
	cct_output = 8'b0;
	delay = 8'b0;
	end
else
	begin
	delay = two_comp;
	cct_output = delay;
	end
*/
reg[7:0] delay;
reg[7:0] delay1;
reg[7:0] delay2;
reg[7:0] delay3;
reg[7:0] delay4;
always @ (posedge clk)
	if(clear == 1'b1)
	delay = 8'b0;
else
	delay = cct_input;
	
always @ (posedge clk)
	if(clear == 1'b1)
	delay1 = 8'b0;
else
	delay1 = delay;

always @ (posedge clk)
	if(clear == 1'b1)
	delay2 = 8'b0;
else
	delay2 = delay1;
	
always @ (posedge clk)
	if(clear == 1'b1)
	delay3 = 8'b0;
else
	delay3 = delay2;

always @ (posedge clk)
	if(clear == 1'b1)
	delay4 = 8'b0;
else
	delay4 = delay3;
	
always @ (posedge clk)
	if(clear == 1'b1)
	cct_output = 8'b0;
else
	cct_output = delay3;
		

endmodule