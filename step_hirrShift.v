module top_module ( input clk, input d, output q );
wire first,second;
    my_dff(.clk(clk) , .d(d), .q(first));
    my_dff(.clk(clk) , .d(first), .q(second));
    my_dff(.clk(clk) , .d(second), .q(q));       
    
endmodule

