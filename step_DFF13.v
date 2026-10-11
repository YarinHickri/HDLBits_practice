module top_module (
    input clk,
    input d,
    output q
);
    reg first,second;
    always @(posedge clk)begin 
        first<=d;
    end
    always @(negedge clk)begin
       second<=d ;
    end
    assign q = (clk) ? first:second;

endmodule

