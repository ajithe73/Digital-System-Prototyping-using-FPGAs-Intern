module comparator    (
inputs [x:0] a, 
input [x:0] b,
output reg out_a,
output reg out_b,
output reg out_eq);


always @ (*) begin 
 ////2 approaches// 
end

endmodule 


//1st approach
if (a>b)begin out_a=1'b1;
out_b =1'b0;
 out_eq =1'b0 ;
end

//2nd approach

case({a,b})                        // {} this is a concatination operator 2 bits each a is of [1:0] similarrly b [1:0]
  4'b0000: begin out_eq = 1'b1 ;
                 out_a = 1'b0;
                 out_b = 1'b0; end

////
////
////

default: begin out_eq = 1'bx ;
                out_a = 1'bx;
                out_b = 1'bx; end
endcase 

endmodule
///////////////////////the above code is for a comparator/////////////////////////
