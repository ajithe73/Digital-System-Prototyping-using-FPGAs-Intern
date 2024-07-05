![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/4782803e-d133-4b78-b8be-eee037cfc6d0)


![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/639b9c10-80a1-4238-8a7a-d02c3dcbe6d3)

101 sequence detector code
``````
module fsm_sequence_detector #(parameter [1:0] reset = 2'b00 , get1 = 2'b01 , get10 = 2'b10 , get101 = 2'b11)
(   input x,
    input clk,
    input rst,
    output out ,
    output reg [1:0] state ,
    output reg [1:0] next_state
);
    always @(posedge clk or posedge rst) 
    begin
        if (rst) begin
            state <= reset ;
        end
        else begin
            state <= next_state;end 
    end
            always @(*) 
            
            begin 
            case (state)
           reset : 
            begin if (x) begin next_state <= get1; end
                   else begin next_state<=reset; end
            end

            get1:
            begin if (x) begin next_state <= get1; end
                   else begin next_state<=get10; end
            end

            get10:
            begin if (x) begin next_state <= get101; end
                   else begin next_state<=reset; end
            end
            
            get101:
            begin if (x) begin next_state <= get1; end
                   else begin next_state<=get10; end
            end

           default: begin next_state <= reset; end
            endcase
           end
      
    

    assign out = (state == get101) ? 1 : 0 ; 

endmodule
````````````
testbench
```````````
`timescale 1ns / 1ps

module tb_fsm_sequence_detector;

    // Inputs
    reg x;
    reg clk;
    reg rst;

    // Outputs
    wire out;
    wire [1:0] state;
    wire [1:0] next_state;

    // Instantiate the Unit Under Test (UUT)
    fsm_sequence_detector uut (
        .x(x),
        .clk(clk),
        .rst(rst),
        .out(out),
        .state(state),
        .next_state(next_state)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 0;
        x = 0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;

        // Test sequence 101
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 0; #10;
        
        // Test sequence 101 again
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 0; #10;

        // Test different sequences
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;

        // Finish simulation
        $finish;
    end

    initial begin
        // Monitor signals
        $monitor("At time %t, x = %b, rst = %b, state = %b, next_state = %b, out = %b",
                 $time, x, rst, state, next_state, out);
    end

endmodule
``````````````````````
