`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:09:45 08/22/2014 
// Design Name: 
// Module Name:    SevenSegmentDisplay 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// Assume output signals are all active low
module SevenSegmentDisplay(clk, reset, number, anode, toggle, segment);
    parameter DIGITS = 4;
	 input clk;
	 input reset;
	 input [(DIGITS*4)-1:0] number;
	 input toggle;
    output [DIGITS-1:0] anode;
	 output [6:0] segment;
    reg [1:0] current_anode;
	 wire [3:0] hex_number;
	 
	 wire change_anode;
	 
	 timer anode_timer(
	   .clk (clk),
		.reset (reset),
		.interval (100000),
		.tick (change_anode));

	 assign anode =
		(current_anode == 0) ? 7'b1110 :
		(current_anode == 1) ? 7'b1101 :
		(current_anode == 2) ? 7'b1011 :
		(current_anode == 3) ? 7'b0111 :
		                       7'b1111;

	 assign hex_number[3:0] =
		(current_anode == 0) ? number[3:0] :
		(current_anode == 1) ? number[7:4] :
		(current_anode == 2) ? number[11:8] :
		(current_anode == 3) ? number[15:12] :
		                       0;

	//assign anode = 4'b1011;
	always @(posedge clk)
	begin
		 if(reset)
			current_anode = 0;
		 else if(change_anode)
			current_anode = current_anode + 1;
	end
	
	SevenSegmentDigit digit(
		.number (hex_number),
		.segment (segment));

endmodule
