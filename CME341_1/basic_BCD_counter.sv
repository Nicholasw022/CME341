module basic_BCD_counter(output reg [3:0] BCD_count, input wire clk, input sync_clr, input count_enable, output wire look_ahead_roll_over);

always @ (posedge clk)
if (sync_clr == 1'b1)
		BCD_count = 4'b0;
else if (count_enable == 1'b1)
		if (BCD_count == 4'd6)
			BCD_count = 4'b0;
		else
			BCD_count = BCD_count + 4'b1;
else
	BCD_count = BCD_count;

always @ (*)
	if ((BCD_count == 4'd6) && (count_enable == 1'b1))
		look_ahead_roll_over = 1'b1;
	else
		look_ahead_roll_over = 1'b0;

endmodule

