module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk)begin
        if (reset|(q==9 & slowena))
            q<=0;
        else
            q<=q+slowena;
        
    end
endmodule

