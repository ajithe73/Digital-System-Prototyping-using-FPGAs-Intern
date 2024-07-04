![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/69a022f8-41fc-43eb-ac40-18f913d489ca)


this is the obtained waveform 


<h2>FSM Truth Table</h2>

<table>
    <thead>
        <tr>
            <th>Current State</th>
            <th>Input `w`</th>
            <th>Next State</th>
            <th>Output `z`</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
            <td>0</td>
            <td>A</td>
            <td>0</td>
        </tr>
        <tr>
            <td>A</td>
            <td>1</td>
            <td>B</td>
            <td>0</td>
        </tr>
        <tr>
            <td>B</td>
            <td>0</td>
            <td>A</td>
            <td>0</td>
        </tr>
        <tr>
            <td>B</td>
            <td>1</td>
            <td>C</td>
            <td>0</td>
        </tr>
        <tr>
            <td>C</td>
            <td>0</td>
            <td>A</td>
            <td>1</td>
        </tr>
        <tr>
            <td>C</td>
            <td>1</td>
            <td>C</td>
            <td>1</td>
        </tr>
    </tbody>
</table>

</body>
</html>

the code is given as follows 

```````
module fsm #(parameter [1:0] A = 2'b00 , B = 2'b01 , C = 2'b10 )(
input rst,
input clk,
input w,
output reg z,
output  reg [1:0]state,
output reg [1:0] next_state
    );  
        
  
     

     always @ (state , w , rst) begin
        
        if (!rst) begin
        case (state)
        A: begin
            z = 1'b0;
            if(w) next_state <= B;
            else next_state <= A;
        end
        B: begin 
            z = 1'b0;
            if(w) next_state <= C;
            else next_state <= A;
        end

        C: begin
            z = 1'b1;
           if   (w) next_state <= C;
           else next_state <= A;
        end
        endcase
        
        end

        else begin
            next_state <= A ;
         end
     end

 always @ (posedge clk) begin state = next_state; end
    
endmodule
````````````


for the test bench reffer 


`````````````````````````

`timescale 1ns / 1ps

module fsm_tb;


    reg clk;
    reg rst;
    reg w;
    wire z;
    wire [1:0] state;  
    wire [1:0] next_state;


    fsm uut (
        .rst(rst),
        .clk(clk),
        .w(w),
        .z(z),
        .state(state) ,
        .next_state(next_state)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

  
    initial begin
       
        rst = 1; w = 0;
        #10; 

        
        rst = 0;
        
        
        w = 0;
        #10; 

      
        w = 1;
        #10;
        
        
        w = 1;
        #10; 
        
        
        w = 0;
        #10;

       
        w = 1;
        #10; 
        
    
        w = 0;
        #10;

       
        rst = 1;
        #10;
        rst = 0;

        
        w = 1;
        #10; 
      
        w = 1;
        #10; 

        
        $stop;
    end

    
    initial begin
        $monitor("Time = %0t, rst = %b, w = %b, z = %b, state = %b , next_state = %b", $time, rst, w, z, state,next_state);
    end

endmodule
 
`````````````````````````````````````````````
