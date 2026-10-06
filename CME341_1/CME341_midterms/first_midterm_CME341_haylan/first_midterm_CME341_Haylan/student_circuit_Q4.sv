module student_circuit_Q4(
  input wire        clk, 
  input wire        clear,
  input wire  [7:0] cct_input,
  output reg  [7:0] cct_output
);
reg out_xnor1;
reg out_xor1;
reg out_nor1;
reg out_nor2;
reg out_and1;
reg out_and2;
reg out_and3;
reg out_and4;
always @ *
out_xnor1 = ~(cct_input[7]^cct_input[6]);

always @ *
out_xor1 = (cct_input[5] ^ cct_input[4]);

always @ *
out_nor1 = ~(cct_input[3] | out_xor1);

always @ *
out_and1 = out_xnor1 & cct_input[1] & cct_input[0];

always @ *
out_and2 = out_xor1 & (~cct_input[1]) & cct_input[0];

always @ *
out_and3 = out_nor1 & cct_input[1] & (~cct_input[0]);

always @ *
out_and4 = cct_input[2] & (~cct_input[1]) & (~cct_input[0]);

always @ *
out_nor2 = ~(out_and2 | out_and3);

always @ *
begin
cct_output[6] = out_and1 | out_and2 | out_nor2 | out_and3 | out_and4; 
cct_output[7] = 1'b0;
cct_output[5:0] = 6'b0;
end
endmodule