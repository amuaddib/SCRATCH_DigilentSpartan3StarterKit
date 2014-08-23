`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:08 08/22/2014 
// Design Name: 
// Module Name:    main 
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
module main(anode, segment, dp, clk);
    output [3:0] anode;
	 output [6:0] segment;
	 output dp;
	 //input [3:0] btn;
	 input clk;
	 
	 //test
	 
	 SevenSegmentDisplay display(
	   .clk (clk),
		.number ('hABCD),
		.anode  (anode),
		.segment (segment));

	 assign dp = 1;

endmodule
