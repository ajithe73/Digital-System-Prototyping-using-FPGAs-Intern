`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2024 15:51:33
// Design Name: 
// Module Name: custom_module
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


module custom_module (
    input clk,
    input reset,
    input [1:0] select,
    input [2:0] serial_in,
    input [7:0] parallel_in,
    output reg [7:0] parallel_output 
);

    reg [7:0] temp;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            parallel_output <= 8'd0;
            temp <= 8'd0;
        end else begin
            case (select)
                2'b00: begin
                    parallel_output <= {serial_in, parallel_in[7:3]}; // shift right LSB is discarded 
                end
                2'b01: begin
                    parallel_output <= {parallel_in[4:0], serial_in}; // shift left MSB is discarded
                end
                2'b10: begin
                    temp <= temp << 1;
                    temp[0] <= serial_in[2]; // only feed the MSB of the serial_in to show how one bit is fed 
                    parallel_output <= temp; // serial in parallel out  
                end
                2'b11: begin
                    parallel_output <= parallel_in; // load parallel input
                end
                default: begin
                    parallel_output <= 8'bxxxxxxxx;
                end
            endcase
        end
    end

endmodule
