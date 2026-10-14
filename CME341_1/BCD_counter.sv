module BCD_counter(output wire [3:0] dg_1,output wire [3:0] dg_10,output wire [3:0] dg_100, output wire [4:0] dg_1000, input wire clk, input wire sync_clr);
wire enable_2, enable_3,enable_4;

basic_BCD_counter BCD_c_1(.count_enable(1'b1),.look_ahead_roll_over(enable_2),.clk(clk),.sync_clr(sync_clr),.BCD_count(dg_1));

basic_BCD_counter BCD_c_2(.count_enable(enable_2),.look_ahead_roll_over(enable_3),.clk(clk),.sync_clr(sync_clr),.BCD_count(dg_10));

basic_BCD_counter BCD_c_3(.count_enable(enable_3),.look_ahead_roll_over(enable_4),.clk(clk),.sync_clr(sync_clr),.BCD_count(dg_100));

basic_BCD_counter BCD_c_4(.count_enable(enable_4),.look_ahead_roll_over(),.clk(clk),.sync_clr(sync_clr),.BCD_count(dg_1000));
endmodule