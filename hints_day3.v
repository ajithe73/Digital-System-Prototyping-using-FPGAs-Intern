
//in a D ff and in a Asynchronous reset -> is independent of the clk

always @ (posedge clk) begin ..if(reset)........... end /// synch

  always @ (posedge clk or posedge reset/negedge reset) begin..........end // async
