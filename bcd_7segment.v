`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 11:13:15
// Design Name: 
// Module Name: bcd_7segment
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


module bcd_7segment(
input [3:0] bcd,
output reg [6:0] display
    );
    always @(bcd)begin 
    case(bcd)
4'b0000:display <= 7'b1111110;
4'b0001:display <= 7'b0110000;
4'b0010:display <= 7'b1101101;
4'b0011:display <= 7'b1111001;
4'b0100:display  <= 7'b0110011;
4'b0101:display <= 7'b1011011;
4'b0110:display <= 7'b1011111;
4'b0111:display <= 7'b1110000;
4'b1000:display<=7'b1111111;
4'b1001:display <= 7'b1111011;

    default:display <=7'bxxxxxxx;
 endcase 
 
    end
endmodule
