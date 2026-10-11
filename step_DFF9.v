module top_module (
    input clk,
    input x,
    output z
); 
        reg q1=0;
    reg q2=0;
    reg q3=0;
    always @(posedge clk) begin
        q1<=q1^x;
        q2<=~q2&x;
        q3<=~q3|x;

    end 
    assign z =~(q1|q2|q3);

endmodule

