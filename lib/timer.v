`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:45 08/22/2014 
// Design Name: 
// Module Name:    timer 
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
module timer(clk, reset, interval, tick);
   input clk;
	input reset;
	input [63:0] interval;
	output tick;
	
	reg [63:0] counter;
	reg tick;

	always @(posedge clk)
	begin
		 if(reset)
		 begin
			counter = 0;
			tick = 0;
		 end
		 else if(counter == interval)
		 begin
			counter = 0;
			tick = 1;
		 end
		 else
		 begin
			counter = counter + 1;
			tick = 0;
		 end
	end
	

endmodule
