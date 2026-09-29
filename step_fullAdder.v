module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire first;
    add16 one(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(first), .sum(sum[15:0]));
    add16 two(.a(a[31:16]), .b(b[31:16]), .cin(first), .sum(sum[31:16]));

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = (a+b+cin)%2 ;
    assign cout = (a+b+cin) /2 ;
    
endmodule
