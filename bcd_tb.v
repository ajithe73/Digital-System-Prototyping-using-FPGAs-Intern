`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 11:25:15
// Design Name: 
// Module Name: bcd_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_seven_segment ;

reg [3:0] bcd ; reg clk ; 
wire [6:0] display ; 

bcd_7segment uut (. bcd (bcd ) ,. display ( display ));

initial begin

bcd =4'b0000 ; 

end

initial begin

bcd = 4'b0001 ;#100; //1
bcd = 4'b0011 ;#100; //3
bcd = 4'b1000 ;#100; //8
bcd = 4'b1001 ;#100; //9
#100;


end 
endmodule
