module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [31:0] q_next;
    assign q_next[31]=q[0];
    assign q_next[30:22]=q[31:23];
    assign q_next[21]=q[22]^q[0];
    assign q_next[20:2]=q[21:3];
    assign q_next[1]=q[2]^q[0];
    assign q_next[0]=q[1]^q[0];

    
    
    always @(posedge clk) begin
        if(reset)
            q<=32'b1;
        else
            q<=q_next;
    
    end
endmodule

