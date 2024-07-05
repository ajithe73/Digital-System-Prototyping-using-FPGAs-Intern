![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/151813972/1df00c46-b6fa-4290-a7ee-b2dacaf4f1af)


``````````

module MooreMchn_2(input clk,rst,x,
output z,
reg [2:0] current);
parameter reg[2:0] reset = 3'b000,got1 = 3'b001, got10 = 3'b010,got11=3'b011,
got101=3'b100,got110=3'b101;


always@(posedge clk)begin
    if(rst) 
        current <= reset;
    else
        case(current)
          reset: begin
                if(x==1'b1)
                    current <= got1;
                else 
                    current <= reset;
                end
          got1: begin
                if(x==1'b1)
                    current <= got11;
                 else 
                    current <= got10;      
                 end
          got10: begin 
                if(x==1'b1)
                    current <= 101;
                else 
                    current <= reset;
                end
          got11: begin
                if(x==1'b1)
                    current <= got11;
                else
                    current <= got110;
                 end
           got101: begin 
                  if(x==1'b1)
                    current <= got11;
                  else
                    current <= got10;
                   end
           got110: begin 
                  if(x==1'b1)
                    current <= got101;
                  else
                    current <= reset;
           end
           default: current<=reset;
        endcase
end
//assign the output 
 
 assign z = (current==got101 || current==got110);

endmodule

``````````````


```````````````````````````````
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2024 14:00:38
// Design Name: 
// Module Name: Tb_MooreMchn_2
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

module Tb_MooreMchn_2;
  // Input signals
  reg clk;
  reg rst;
  reg x;

  // Output signal
  wire z;
  wire current;
  // Instantiate the DUT (Device Under Test)
  MooreMchn_2 dut (.clk(clk), .rst(rst), .x(x), .z(z),.current(current));

  // Clock generation
  always 
    #5 clk = ~clk;
   


  // Test initialization
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    x = 1'b0;
    #10; // Hold reset for 10 clock cycles
    
    rst = 1'b0;
  end

  // Test scenarios
  initial begin
    // Test 1: Valid sequence (101)
    #10
    x = 1'b1;
    #10
    x = 1'b0;
    ;
    x = 1'b1;
    @(posedge clk); // Check output at the end of the sequence

    // Test 2: Reset during sequence (10-)
    @(posedge clk);
    x = 1'b1;
    @(posedge clk);
    x = 1'b0;
    @(posedge clk);
    rst = 1'b1;
    @(posedge clk);
    x = 1'b0; // Input after reset doesn't matter
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk); // Check output after reset

    // Test 3: Invalid sequence (11-)
    @(posedge clk);
    x = 1'b1;
    @(posedge clk);
    x = 1'b1;
    @(posedge clk);
    x = 1'b0;
    @(posedge clk); // Check output after invalid input

    // Test 4: Repeated valid sequences (101101...)
    @(posedge clk);
    x = 1'b1;
    @(posedge clk);
    x = 1'b0;
    @(posedge clk);
    x = 1'b1;
    @(posedge clk);
    x = 1'b1;
    @(posedge clk);
    x = 1'b0;
    @(posedge clk);
    x = 1'b1;
    @(posedge clk); // Check output after repeated sequence

    // Additional tests can be added here for more comprehensive verification

    #10;
    $finish;
  end

  // Monitor signals
  always @(posedge clk) begin
    $monitor("Time: %d, rst: %b, x: %b, z: %b, current:%b", $time, rst, x, z,current);
  end

endmodule
``````````````````````````````````




