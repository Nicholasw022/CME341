module sequential_B_to_BCD_converter (
input[15:7] sw, // switches SW[15:8], binary num to be converted
input clk,
output wire[6:0] hex0, hex1, hex2, hex3 // segment drivers
);
reg[8:0] counter; // the binary counter
reg[8:0] bin_num; // the register holding the
//binary number being converted
reg[3:0] digit_001, digit_010, digit_100, digit_1000;
// registers holding the BCD digits
(* keep *) reg right_number; // useful for debugging
// so don’t let the compiler optimize it out
// declaring it a reg means the comparator
// must be built with the ‘‘always @ * ’’
wire[3:0] dg_1, dg_10, dg_100, dg_1000; // outputs of ‘‘basic_BCD_counter’’
// instantiations
// comparator
always @ *
if (counter == bin_num)
	right_number = 1'b1;
else
	right_number = 1'b0;
	
// binary counter
always @ (posedge clk)
if (right_number == 1'b1)
	counter = 9'b0;
else
	counter = counter + 9'b1;
	
// bin_num register
always @ (posedge clk)
	if(right_number == 1'b1)
		bin_num = sw;

		
// registers digit_001, digit_010 and digit_100
always @ (posedge clk)
	if(right_number == 1'b1)
		digit_001 = dg_1;

		
always @ (posedge clk)
	if(right_number == 1'b1)
		digit_010 = dg_10;

		
always @ (posedge clk)
	if(right_number == 1'b1)
		digit_100 = dg_100;
		
always @ (posedge clk)
	if(right_number == 1'b1)
		digit_1000 = dg_1000;
		
// make the 3 digit BCD by the
// instantiation of the basic BCD counter 3 times
BCD_counter BCD_1(.dg_1(dg_1),.dg_10(dg_10),.dg_100(dg_100),.dg_1000(dg_1000),.sync_clr(right_number),.clk(clk));

// instantiation of the hex display drivers
hex_display_driver hex_display_0 (
.hex_digit(digit_001),
.hex_segments(hex0));
hex_display_driver hex_display_1 (
.hex_digit(digit_010),
.hex_segments(hex1));
hex_display_driver hex_display_2 (
.hex_digit(digit_100),
.hex_segments(hex2));
hex_display_driver hex_display_3 (
.hex_digit(digit_1000),
.hex_segments(hex3));
endmodule