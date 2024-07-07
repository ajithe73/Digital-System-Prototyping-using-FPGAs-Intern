module custom_module (
    input clk ,
    input reset ,
    input load ,
    input [1:0] select,
    input serial_in ,
    input [7:0] parallel_in,
    output [7:0] parallel_output,
);
 reg [1:0] counter = 2'b00;
 reg [7:0] temp;
    // first off we make a counter that counts till 0,1,2 that is 3  times before it resets to 0 
    always @(posedge clk , negedge reset) begin
        counter = counter + 1'b1;
         
        if (!reset) 
    begin
        parallel_output = 8'd0;
    end

        else
    begin 
           case (select)
            2'b00: begin
                parallel_output <= {serial_in,parallel_in [7:1]}; //shift right 
            end
            2'b01:begin
                parallel_output <= {parallel_in[6:0] , serial_in }; //shift left
            end
            2'b10:begin
                temp <= temp << 1 ;
                temp[0] <= serial_in ;
                parallel_output <= temp; 
            end
            2'b11:begin
                 parallel_output <= parallel_input
            end  
            default: begin
               
            end
           endcase 
    end
    end
endmodule