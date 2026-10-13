module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
wire one,two,three;
    my_dff first(clk,resetn,in,one);
    my_dff sec(clk,resetn,one,two);
    my_dff third(clk,resetn,two,three);
    my_dff fourth(clk,resetn,three,out);

endmodule
module my_dff(input clk , input reset,input d,output reg q);
    always @(posedge clk)begin
        if (!reset)
            q<=1'b0;
        else
            q<=d;
    end
endmodule 
